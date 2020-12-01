require 'pry'
class Api

    attr_accessor :query

    

    def initialize(query)
        @query = query
    end

    def get_articles
        t=Time.now
        year = t.year
        month = t.month
        day = t.day
        url = "http://newsapi.org/v2/everything?q=#{@query}&from=#{t.year}-#{t.month}-#{t.day}&sortBy=publishedAt&apiKey=#{ENV["API_KEY"]}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        articles = JSON.parse(response)
        puts "How many articles do you want in your page?"
            n=gets.strip
            i=n.to_i
        articles["articles"][1..i]
    end

    def create_articles
        self.get_articles.each{|article| Article.new(article["title"], article["author"], article["id"], article["content"])}

    end
end
