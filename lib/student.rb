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
    students_array.each do |student|
      new(student)
    end
  end

  def add_student_attributes(attributes_hash)
    @twitter = attributes_hash[":twitter"].to_s
    @linkedin = attributes_hash[":linkedin"].to_s
    @github = attributes_hash[":github"].to_s
    @blog = attributes_hash[":blog"].to_s

    @profile_quote = attributes_hash[":profile_quote"].to_s
      @bio = attributes_hash[":bio"].to_s 
      return self 
  end

  def self.all
    @@all
  end
end
