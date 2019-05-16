require 'pry'
class Owner
  attr_accessor :cat, :dog, :fish, :pets, :name, :mood
  attr_reader :species
 
  @@all = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @@all << self
  end
  
  def save
    @@all.save
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@all.count
  end 
  
  def self.reset_all 
    @@all.clear
  end 
  
  def say_species
    "I am a #{@species}."
  end
  
  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end
  
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end
  
  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end
  
  def walk_dogs
     pets[:dogs].collect {|dog| dog.mood = "happy"}
  end
  
  def play_with_cats
    pets[:cats].collect {|cat| cat.mood = "happy"}
  end
  
  def feed_fish
    pets[:fishes].collect {|fish| fish.mood = "happy"}
  end
  
 def sell_pets
    pets.each do |species, animals|
      animals.each do |animal|
        animal.mood = "nervous"
      end
      animals.clear
    end
  end
  
  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end
end