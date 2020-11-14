require 'pry'
# require_relative '../environment.rb'
class Api

    attr_accessor :query

    

    def initialize(query)
        @query = query
    end

    def get_articles
        t=Time.now
        url = "http://newsapi.org/v2/everything?q=#{@query}&from=2020-10-#{t.day}&sortBy=publishedAt&apiKey=fedc37138f114bd48c8ae8a239063753"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        articles = JSON.parse(response)
        puts "How many articles do you want in your page?"
            n=gets.strip
            i=n.to_i
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