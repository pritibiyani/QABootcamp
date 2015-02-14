require_relative '../src/SubCategoryPage'
require_relative '../src/Menu'

class HomePage


  def initialize driver
    @driver = driver
    @menu   = Menu.new @driver
  end

  def on_home_page?
    # @driver.url.include?
  end

  def navigate_to_home_page(url)
    @driver.navigate.to url
    @driver.navigate.to url
  end

  def select_category_and_subcategory category, sub_category
    @menu.select_category_and_subcategory category, sub_category
  end

end