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
      name = s.css(".card-text-container p").text.strip
      student_details[":name"] = name
      student_details[":location"] = location
      student_details[":profile_url"] = profile_url[0]

      if ( name.length != 0 )
          scraped_students << student_details
        end 
      end 
      return scraped_students 
  end

  def self.create_from_collection(students_array)
  end

end
