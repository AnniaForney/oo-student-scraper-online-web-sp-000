require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []
    page = Nokogiri::HTML open((index_url))
    students = page.css(".student-card")
    students.each do |s|
      student_details = {}
      profile_url = s.css("a").map{|link| link['href']}
      
  end

  def self.create_from_collection(students_array)
  end

end
