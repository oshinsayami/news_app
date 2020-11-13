
class Article

    attr_accessor :title, :author, :description, :content, :cli

    @@all = []
    @@save_for_later = []
    @@search_history= []
    

    def initialize(title, author, description, content)
        @title = title
        @author = author
        @description = description
        @content = content
        @@all << self
    end

    def self.all
        @@all
    end

    def self.article_clear
        @@all=[]
    end

    def self.save_for_later
        @@save_for_later
    end

    def self.display_articles
        puts "----------------------------------------------------"
        puts "Please choose one of the following articles:(1-10)"
        puts "----------------------------------------------------"
        self.all.each_with_index{|article, index| puts "#{index + 1}. #{article.title}"}
        puts "----------------------------------------------------"
    end

    def self.display_individual_article(index)
        puts "----------------------------------------------------"
        article= self.all[index]
        puts "#{article.title} -- #{article.author}"
        puts "#{article.content}"
        puts "----------------------------------------------------"
        @@search_history << article.title
    end

    def self.save_article(index)
        article = self.all[index]
        @@save_for_later << article.title
        
    end

    def self.display_saved_articles
        # binding.pry
        puts "----------------------------------------------------"
        @@save_for_later.each_with_index{|a,index| puts "#{index+1}. #{a}"}
        puts "----------------------------------------------------"

        # binding.pry
    end

    def self.display_search_history
        # binding.pry
        puts "----------------------------------------------------"
        @@search_history.each_with_index{|category, index| puts "#{index+1}. #{category}"}
        puts "----------------------------------------------------"
    end

end