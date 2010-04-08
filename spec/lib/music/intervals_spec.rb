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
    end

    context "with sharp notes" do
      subject { Music::Intervals.new(:key_note => "C", :note_mode => "sharp") }

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
      subject { Music::Intervals.new(:key_note => "C", :note_mode => "flat") }

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
      subject { Music::Intervals.new(:key_note => "F#", :note_mode => "sharp") }

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
      subject { Music::Intervals.new(:key_note => "F#", :note_mode => "flat") }

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
        [[ 0, "A#"],
         [ 1, "B" ],
         [ 2, "C" ],
         [ 3, "C#"],
         [ 4, "D" ],
         [ 5, "D#"],
         [ 6, "E" ],
         [ 7, "F" ],
         [ 8, "F#"],
         [ 9, "G" ],
         [10, "G#"],
         [11, "A" ],
         [12, "A#"],
         [25, "B" ],
         [-1, "A" ]].each do |step_expected_note_pair|
          (step, expected_note) = *step_expected_note_pair
          check_step_to_note(step, expected_note)
        end
      end
    end
  end
end
