#!/usr/bin/env ruby
require "ruby-debug"

LINEBREAK = "<br>\n"

class SongLine
  CHORD_REGEXP = /[A-G][+#abdmsu0-9*\/]*/

  def initialize(chords, lyrics)
    @chords = chords
    @lyrics = lyrics
  end

  def parse_chords
    indices = []
    index = 0
    while found_index = @chords.index(CHORD_REGEXP, index)
      indices << found_index
      index = found_index + 1
    end
    @chords_with_locations = @chords.scan(CHORD_REGEXP).zip(indices)
  end

  def format_chord(chord)
    "<b>(%s)</b>" % chord
  end

  # Assumes that both @chords and @lyrics are set
  def merge!
    @merged = @lyrics
    @tail = ""
    parse_chords
    @chords_with_locations.reverse.each do |chord_with_index|
      chord, index = chord_with_index
      if index < @lyrics.length
        @merged.insert(index, format_chord(chord))
      else
        @tail = format_chord(chord) + " " + @tail
      end
    end
    @merged + @tail + LINEBREAK
  end

  def merge
    if @chords && @lyrics
      merge!
    elsif @chords
      @chords + LINEBREAK
    else
      @lyrics + LINEBREAK
    end
  end

  def to_s
    merge
  end

  def to_s_full
    s = ""
    if @chords
      s += @chords + "\n"
    end
    if @lyrics
      s += @lyrics + "\n"
    end
    s
  end
end

class ChordParse
  def initialize(txt)
    @txt = txt
  end

  def contains_only_chords?(line)
    line = line.gsub("sus", "")
    line = line.gsub("dim", "")
    line = line.gsub("aug", "")
    if line =~ /[h-ln-z]/i
      return false
    end

    return line =~ /[a-g]/i
  end

  def handle_chords_line(line)
    if @last_chord_line
      @lines << SongLine.new(@last_chord_line, nil)
    end
    @last_chord_line = line
  end

  def handle_blank_line(line)
    @lines << line + LINEBREAK
  end

  def handle_lyrics_line(line)
    if @last_chord_line
      @lines << SongLine.new(@last_chord_line, line)
      @last_chord_line = nil
    else
      @lines << SongLine.new(nil, line)
    end
  end

  def parse
    @lines = []
    @txt.split("\n").each do |line|
      if contains_only_chords?(line)
        handle_chords_line(line)
      elsif line =~ /^\s*$/
        handle_blank_line(line)
      else
        handle_lyrics_line(line)
      end
    end
    @lines.join
  end
end

def wrap_in_html(content)
  <<EOT
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
  </head>
  <body LANG="en-GB" TEXT="#000000" BGCOLOR="#ffffff" DIR="LTR">
    <font FACE="Verdana, sans-serif">
      #{content}
    </font>
  </body>
</hmtl>
EOT
end

txt = ARGF.read
puts wrap_in_html(ChordParse.new(txt).parse)
