require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    scraped_students = []
    page = Nokogiri::HTML open((index_url))
    
  end

  def self.create_from_collection(students_array)
  end

end
