require 'pry'

class Owner
	@@all = []
	attr_reader :name, :species

	def initialize (name)
		@name = name
		@species = 'human'
		Owner.all << self
	end

	def self.all
		@@all
	end

	def species
		@species
	end

	def say_species
		"I am a #{@species}."
	end

	def self.count
		Owner.all.length
	end

	def self.reset_all
		@@all = []
	end

	def cats
		Cat.all.select do | cat |
			cat.owner == self
		end
	end

	def dogs
		Dog.all.select do | dog |
			dog.owner == self
		end
	end

	def buy_cat(name)
		Cat.new(name,self)
	end

	def buy_dog(name)
		Dog.new(name,self)
	end

	def walk_dogs
		self.dogs.each {|dog| dog.mood = 'happy'}
	end

	def feed_cats
		self.cats.each {|cat| cat.mood = 'happy'}
	end

	def sell_pets
		self.cats.each do |cat| 
			cat.owner = nil
			cat.mood = 'nervous'
		end
		self.dogs.each do |dog|
			dog.owner = nil
			dog.mood = 'nervous'
		end
	end

	def list_pets
		"I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
	end
end


