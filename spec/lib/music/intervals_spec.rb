require 'spec_helper'

describe Music::Intervals do
  def check_step_to_note(step, expected_note)
    subject.step_to_note(step).should == expected_note
  end

  context "in the C key" do
    subject { Music::Intervals.new(:key_note => "C") }

    describe "#step_to_note" do
      it "maps to the correct notes" do
        [[ 0, "C" ],
         [ 1, "C#"],
         [ 2, "D" ],
         [ 3, "D#"],
         [ 4, "E" ],
         [ 5, "F" ],
         [ 6, "F#"],
         [ 7, "G" ],
         [ 8, "G#"],
         [ 9, "A" ],
         [10, "A#"],
         [11, "B" ],
         [12, "C" ],
         [25, "C#"],
         [-1, "B" ]].each do |step_expected_note_pair|
          (step, expected_note) = *step_expected_note_pair
          check_step_to_note(step, expected_note)
        end
      end

      it "maps to the correct note with the other accidental_mode" do
        subject.step_to_note(1, :flat).should == "Db"
      end

      describe "#step_to_interval" do
        def check_step_to_interval(step, expected_interval)
          subject.step_to_interval(step).should == expected_interval
        end

        it "maps to the correct intervals" do
          [[ 0, "Uni" ],
           [ 1, "m2"],
           [ 2, "M2" ],
           [ 3, "m3"],
           [ 4, "M3" ],
           [ 5, "P4" ],
           [ 6, "Tri"],
           [ 7, "P5" ],
           [ 8, "m6"],
           [ 9, "M6" ],
           [10, "m7"],
           [11, "M7" ],
           [12, "Oct" ]].each do |step_expected_interval_pair|
            (step, expected_interval) = *step_expected_interval_pair
            check_step_to_interval(step, expected_interval)
          end
        end
      end
    end

    context "with sharp notes" do
      subject { Music::Intervals.new(:key_note => "C", :note_accidental_mode => "sharp") }

      describe "#step_to_note" do
        it "maps to the correct notes" do
          [[ 0, "C" ],
           [ 1, "C#"],
           [ 2, "D" ],
           [ 3, "D#"],
           [ 4, "E" ],
           [ 5, "F" ],
           [ 6, "F#"],
           [ 7, "G" ],
           [ 8, "G#"],
           [ 9, "A" ],
           [10, "A#"],
           [11, "B" ],
           [12, "C" ],
           [25, "C#"],
           [-1, "B" ]].each do |step_expected_note_pair|
            (step, expected_note) = *step_expected_note_pair
            check_step_to_note(step, expected_note)
          end
        end
      end
    end
    context "with flat notes" do
      subject { Music::Intervals.new(:key_note => "C", :note_accidental_mode => "flat") }

      describe "#step_to_note" do
        it "maps to the correct notes" do
          [[ 0, "C" ],
           [ 1, "Db"],
           [ 2, "D" ],
           [ 3, "Eb"],
           [ 4, "E" ],
           [ 5, "F" ],
           [ 6, "Gb"],
           [ 7, "G" ],
           [ 8, "Ab"],
           [ 9, "A" ],
           [10, "Bb"],
           [11, "B" ],
           [12, "C" ],
           [25, "Db"],
           [-1, "B" ]].each do |step_expected_note_pair|
            (step, expected_note) = *step_expected_note_pair
            check_step_to_note(step, expected_note)
          end
        end
      end
    end
  end

  context "in the F# key" do
    subject { Music::Intervals.new(:key_note => "F#") }

    describe "#step_to_note" do
      it "maps to the correct notes" do
        [[ 0, "F#"],
         [ 1, "G" ],
         [ 2, "G#"],
         [ 3, "A" ],
         [ 4, "A#"],
         [ 5, "B" ],
         [ 6, "C" ],
         [ 7, "C#"],
         [ 8, "D" ],
         [ 9, "D#"],
         [10, "E" ],
         [11, "F" ],
         [12, "F#"],
         [25, "G" ],
         [-1, "F" ]].each do |step_expected_note_pair|
          (step, expected_note) = *step_expected_note_pair
          check_step_to_note(step, expected_note)
        end
      end
    end

    context "with sharp notes" do
      subject { Music::Intervals.new(:key_note => "F#", :note_accidental_mode => "sharp") }

      describe "#step_to_note" do
        it "maps to the correct notes" do
          [[ 0, "F#"],
           [ 1, "G" ],
           [ 2, "G#"],
           [ 3, "A" ],
           [ 4, "A#"],
           [ 5, "B" ],
           [ 6, "C" ],
           [ 7, "C#"],
           [ 8, "D" ],
           [ 9, "D#"],
           [10, "E" ],
           [11, "F" ],
           [12, "F#"],
           [25, "G" ],
           [-1, "F" ]].each do |step_expected_note_pair|
            (step, expected_note) = *step_expected_note_pair
            check_step_to_note(step, expected_note)
          end
        end
      end
    end
    context "with flat notes" do
      subject { Music::Intervals.new(:key_note => "F#", :note_accidental_mode => "flat") }

      describe "#step_to_note" do
        it "maps to the correct notes" do
          [[ 0, "Gb"],
           [ 1, "G" ],
           [ 2, "Ab"],
           [ 3, "A" ],
           [ 4, "Bb"],
           [ 5, "B" ],
           [ 6, "C" ],
           [ 7, "Db"],
           [ 8, "D" ],
           [ 9, "Eb"],
           [10, "E" ],
           [11, "F" ],
           [12, "Gb"],
           [25, "G" ],
           [-1, "F" ]].each do |step_expected_note_pair|
            (step, expected_note) = *step_expected_note_pair
            check_step_to_note(step, expected_note)
          end
        end
      end
    end
  end
  context "in the Bb key" do
    subject { Music::Intervals.new(:key_note => "Bb") }

    describe "#step_to_note" do
      it "maps to the correct notes" do
        [[ 0, "Bb"],
         [ 1, "B" ],
         [ 2, "C" ],
         [ 3, "Db"],
         [ 4, "D" ],
         [ 5, "Eb"],
         [ 6, "E" ],
         [ 7, "F" ],
         [ 8, "Gb"],
         [ 9, "G" ],
         [10, "Ab"],
         [11, "A" ],
         [12, "Bb"],
         [25, "B" ],
         [-1, "A" ]].each do |step_expected_note_pair|
          (step, expected_note) = *step_expected_note_pair
          check_step_to_note(step, expected_note)
        end
      end
    end
  end

  describe "default sharp/flat accidental_mode" do
    def check_note_to_default_accidental_model(note, expected_default_accidental_mode)
      "#{note}: #{Music::Intervals.default_accidental_mode(note)}".should ==
        "#{note}: #{expected_default_accidental_mode}"
    end

    it "should be as expected for all notes" do
      # C, G, D, A, E, B, F#, C#, G#, D#, A#, F
      # 0  1  2  3  4  5  6   5   4   3   2   1
        [["C" , :sharp],
         ["C#", :flat],
         ["Db", :flat],
         ["D" , :sharp],
         ["D#", :flat],
         ["Eb", :flat],
         ["E" , :sharp],
         ["F" , :flat],
         ["F#", :sharp],
         ["Gb", :flat],
         ["G" , :sharp],
         ["G#", :flat],
         ["Ab", :flat],
         ["A" , :sharp],
         ["A#", :flat],
         ["Bb", :flat],
         ["B" , :sharp]].each do |note_expected_default_accidental_mode_pair|
        (note, expected_default_accidental_mode) = *note_expected_default_accidental_mode_pair
        check_note_to_default_accidental_model(note, expected_default_accidental_mode)
      end
    end
  end
end
