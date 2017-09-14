class Game
  @@word = []
  @@word_game = []
  @@losses
  @@current_man = []
  @@letter_box = []
  # attr_reader :word_game

  def initialize()
    word_bank = ["ruby","code","tech","program","fart"]
    @@word = word_bank.sample.split("")
    temp = []
    @@word.each do |letter|
      temp.push("_")
    end
    @@letter_box = []
    @@word_game = temp
    @@losses = 0
  end

  def self.guess?(guess_letter)
    at_least_one = false
    i = 0
    @@letter_box.push(guess_letter)
    @@word.each do |letter|
      if guess_letter.downcase == letter
        @@word_game[i] = letter
        at_least_one = true
      end
      i += 1
    end
    if at_least_one
      at_least_one
    else
      @@losses += 1
      at_least_one
    end
  end

  def self.box
    @@letter_box
  end

  def self.guesses
    @@word_game
  end

  def self.reveal
    @@word[0]
  end

  def self.hangman
    man = ["O<br>","\\","|","/<br>","&nbsp;|<br>","/","\\"]
    current_man = []
    temp = @@losses
    until temp == 0 do
      current_man.push(man[temp - 1])
      temp = temp - 1
    end
    current_man.reverse
  end

  def self.is_won?
    @@word_game == @@word
  end

  def self.is_lost?
    @@losses > 6
  end
end

#  O
# \|/
#  |
# / \
# head = " O"
# torso1 = "|"
# left_a = "\\"
# right_a = "/"
# torso2 = " |"
# left_l = "/ "
# right_l = "\\"
