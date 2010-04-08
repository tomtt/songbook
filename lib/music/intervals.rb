module Music
  class Intervals
    def initialize(options = {})
      @mode = (options[:note_mode] || :sharp).to_sym
      @key_offset = 0
      if options[:key_note]
        @key_offset = index_of_note(options[:key_note])
      end
      @options = options
    end

    def step_to_note(step)
      note_mapping((step + @key_offset) % 12, @mode)
    end

    private

    def note_mapping(step, mode)
      set_notes_mapping
      @notes[mode][step]
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
    end
  end
end
