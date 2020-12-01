
class Cli
    
    def start
        puts "----------------------------------------------------"
        puts "Welcome to ALL ABOUT NEWS"
        puts "----------------------------------------------------"
        # binding.pry
        self.options?
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def options?
        puts "----------------------------------------------------"
        Article.article_clear
        puts "Select the following options:"
        puts "----------------------------------------------------"
        puts "1. Search for a story"
        puts "2. Go to search history page"
        puts "3. Go to saved articles"
        puts "4. Delete saved articles"
        puts "5. Terminate the app"
        puts "----------------------------------------------------"
        query = gets.strip
        case query
        when "1"
            self.search_for_story?
        when "2"
            self.goto_search_history?
        when "3"
            # binding.pry
            self.goto_saved_articles?
        when "4"
            self.delete_articles?
        when "5" 
            puts "----------------------------------------------------"
            puts "See you next time"
            puts "----------------------------------------------------"
        else
            puts "*****  WRONG INPUT  *****"
            puts "PLEASE ENTER A NUMBER FROM 1-5"
            self.options?
        end
    end

    def search_for_story?
        puts "----------------------------------------------------"
        puts "Enter the category you want to read"
        puts "----------------------------------------------------"
            story = gets.strip
            api= Api.new(story)
            api.create_articles
            Article.display_articles
            input= gets.strip
            index = input_to_index(input)
            Article.display_individual_article(index)
            puts "----------------------------------------------------"
            puts "Do you want to save this article? Please press y/n"
            puts "----------------------------------------------------"
            string = gets.strip
            if string == "y"
                 Article.save_article(index)
            end
            self.looping?
            # binding.pry
    end

    def looping?
        puts "----------------------------------------------------"
        puts "Do you want to go to the main menu? Press y/n"
        puts "----------------------------------------------------"
        str = gets.strip
        if str == "y"
            self.options?
        else 
            puts "See you next time."
        end
    end

    
    def goto_search_history?
        # binding.pry
        Article.display_search_history
        self.looping?
    end

    def goto_saved_articles?
        # binding.pry
        Article.display_saved_articles
        self.looping?
    end

    def delete_articles?
        # binding.pry
        Article.display_saved_articles
        puts "Please enter the number you want to delete"
        number = gets.strip
        article_index= number.to_i
        # binding.pry
        Article.save_for_later.delete_at(article_index-1)
        puts "----------------------------------------------------"
        puts " Article number #{article_index} deleted."
        puts "----------------------------------------------------"
        Article.display_saved_articles
        self.looping?
    end


end

