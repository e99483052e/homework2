class Player
	attr_accessor :hand
	attr_reader :name

	def initialize(name)
		@hand = ""
		@name = name
	end

	def enter_hand
		begin
			puts "please enter R / P / S:"
			puts "R) Rock, P)Paper, S)Scissors"
			user_input = gets.chomp.upcase
		end while !["R", "P", "S"].include?(user_input)
		self.hand = user_input
	end
end

class HumanPlayer < Player

end

class ComputerPlayer <  Player
	def  enter_hand 
		self.hand = ["R", "P", "S"].sample
	end
end

class Game
	HANDS = {R: "Rock", P: "Paper", S: "Scissors"}
	attr_accessor  :human_player, :computer_player, :msg

	def initialize
		@human_player = HumanPlayer.new(get_user_name)
		@computer_player = ComputerPlayer.new("Matrix")
	end

	def intro
		puts "***********************"
		puts "wellcome to RPS Game!!!"
 		puts "***********************"
	end

	def get_user_name
		puts "please enter your name:"
		gets.chomp.capitalize!
	end

	def check_win(user_input, computer_input)
		 if (user_input == computer_input)
     			"it's a draw"
    		elsif user_input == "R"
      			if computer_input == "S"
        		"wins"
      			elsif computer_input == "P"
        		"loses"
      			end
    		elsif user_input == "P"
      			if computer_input == "R"
        		"wins"
      			elsif computer_input == "S"
        		"loses"
      			end
    		elsif user_input == "S"
      			if computer_input == "P"
        		"wins"
      			elsif computer_input == "R"
        		"loses"
      			end
    		end
    	end

    	def result(user_input, computer_input, message)
		puts "#{self.human_player.name} choose #{HANDS[user_input.to_sym]},Computer choose #{HANDS[computer_input.to_sym]},#{message}"
		puts "========================================================="
	end

    	def continue?
		begin
			puts "Play again? : Y / N"
			continue = gets.chomp.upcase
		end while !["Y", "N"].include?(continue)
		continue
	end

    	def goodbye
		puts "================================"
		puts "Goodbye!! Thanks for playing!!!"
		puts "================================"
	end
 
 	def play
 		intro
 		begin
 			self.human_player.enter_hand
 			self.computer_player.enter_hand
 			self.msg = self.check_win(human_player.hand, computer_player.hand)
 			result(self.human_player.hand, self.computer_player.hand, msg)
 		end while  continue? == "Y"
 		goodbye
 	end

end

#====================================

Game.new.play