class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(hash)
    @name = hash[":name"].to_s
    @location = hash[":location"].to_s
    @profile_url = hash[":profile_url"].to_s
    @@all << self
  end

  def self.create_from_collection(students_array)
    
  end

  def add_student_attributes(attributes_hash)
  end

  def self.all
    @@all
  end
end
