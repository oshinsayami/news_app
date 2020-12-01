
class Article 

    attr_accessor :title, :author, :id, :content

    @@all = []
    @@save_for_later = []
    @@search_history= []
    

    def initialize(title, author, id, content)
        @title = title
        @author = author
        @content = content
        @id = id
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
        puts "Please choose one of the following articles:"
        puts "----------------------------------------------------"
        #Sorting articles by title 
        sort = Article.all.sort_by {|article| article.title} 
        sort.each_with_index{|article, index| 
        puts "#{index + 1}. #{article.title}"}
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
        puts "----------------------------------------------------"
        @@save_for_later.each_with_index{|a,index| puts "#{index+1}. #{a}"}
        puts "----------------------------------------------------"
    end

    def self.display_search_history
        puts "----------------------------------------------------"
        @@search_history.each_with_index{|category, index| puts "#{index+1}. #{category}"}
        puts "----------------------------------------------------"
    end

end