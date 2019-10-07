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

  def self.scrape_profile_page(profile_url)
    profile_details = {}
    page = Nokogiri::HTML open((profile_url))
    student_details = page.css(".vitals-container")

    url_details = student_details.css("a").map{|link| link['href']}

    twitter = (url_details.grep /twitter.com/)[0]
    linkedin = (url_details.grep /linkedin.com/)[0]
    github = (url_details.grep /github.com/)[0]
    blog = url_details[3]
    profile_quote = student_details.css("profile_quote").text.strip
    bio = page.css(".details-container p").text.strip

    profile_details[":twitter"] = twitter
    profile_details[":linkedin"] = linkedin
    profile_details[":github"] = github
    profile_details[":blog"] = blog
    profile_details[":profile_quote"] = profile_quote
    profile_details[":bio"] = bio

    return profile_details
  end 

end
