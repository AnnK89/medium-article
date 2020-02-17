require 'nokogiri'
require 'open-uri'

# file = 'fraise.html' # or 'strawberry.html'
# doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

# doc.css('.recipe-card__duration__value').each do |el|
#   puts el.text
# end

class Scraper
  attr_reader :recipes

  RECIPES_PATH = ".recipe-card"
  ATTR_PATHS = {
    name: '.recipe-card__title',
    description: '.recipe-card__description',
    prep_time: '.recipe-card__duration__value'
  }

  def initialize
    @base_url = 'https://www.marmiton.org/recettes/recherche.aspx?aqt='
    @recipes = nil
    @selected_recipe = nil
  end

  def fetch_recipes(keyword)
    @recipes = call(keyword).search(RECIPES_PATH)
    # @recipes
  end

  def fetch_titles
    @recipes.search(ATTR_PATHS[:name]).first(5)
  end

  def select_recipe(index)
    @selected_recipe = @recipes[index]
  end

  def recipe_attributes
    attr_hash = {}
    ATTR_PATHS.each_pair do |property, path|
      attr_hash[property] = @selected_recipe.search(path).text.strip
    end
    attr_hash
  end

  private

  def call(keyword)
    Nokogiri::HTML(open(@base_url + keyword))
  end
end
