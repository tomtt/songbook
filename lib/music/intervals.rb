module Music
  class Intervals
    def initialize(options = {})
      if options[:note_accidental_mode]
        @accidental_mode = options[:note_accidental_mode].to_sym
      else
        @accidental_mode = Intervals.default_accidental_mode(options[:key_note])
      end
      @key_offset = 0
      if options[:key_note]
        @key_offset = index_of_note(options[:key_note])
      end
      @options = options
    end

    def step_to_note(step, accidental_mode = @accidental_mode)
      note_mapping((step + @key_offset) % 12, accidental_mode)
    end

    def step_to_interval(step)
      set_notes_mapping
      @intervals[step]
    end

    def self.default_accidental_mode(note)
      if %w{C# Db D# Eb F Gb G# Ab A# Bb}.include? note
        :flat
      else
        :sharp
      end
    end

    private

    def note_mapping(step, accidental_mode)
      set_notes_mapping
      @notes[accidental_mode][step]
    end

    def index_of_note(note)
      set_notes_mapping
      @notes[:sharp].index(note) || @notes[:flat].index(note)
    end

    def set_notes_mapping
      return if @notes_sharp
      @notes = {}
      @notes[:sharp] = %w{ C C# D D# E F F# G G# A A# B }
      @notes[:flat] = %w{ C Db D Eb E F Gb G Ab A Bb B }
      @intervals = %w{Uni m2 M2 m3 M3 P4 Tri P5 m6 M6 m7 M7 Oct}
    end
  end
end
