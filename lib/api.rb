require 'pry'
# require_relative '../environment.rb'
class Api

    attr_accessor :query

    

    def initialize(query)
        @query = query
    end

    def get_articles
        # binding.pry
        t=Time.now
        year = t.year
        month = t.month
        day = t.day
        # binding.pry
        url = "http://newsapi.org/v2/everything?q=#{@query}&from=#{t.year}-#{t.month}-#{t.day}&sortBy=publishedAt&apiKey=#{ENV["API_KEY"]}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        articles = JSON.parse(response)
        puts "How many articles do you want in your page?"
            n=gets.strip
            i=n.to_i
            # binding.pry
        articles["articles"][1..i]
# binding.pry
    end

    def create_articles
        # binding.pry
        self.get_articles.each{|article| Article.new(article["title"], article["author"], article["id"], article["content"])}

    end
end

# api= Api.new("bitcoins")
# binding.pry