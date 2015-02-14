require_relative '../src/ProductPage'

class SubCategoryPage

  def initialize driver, name
    @name   = name
    @driver = driver
    @menu   = Menu.new @driver
  end

  def on_subcategory_page?
    get_url.include? @name
  end

  def choose_product product_name
    element = find_element_by_partial_link_text product_name
    element.click
    ProductPage.new @driver, product_name
  end

  def select_category_and_subcategory category, sub_category
    @menu.select_category_and_subcategory category, sub_category
  end

  def get_url
    @driver.current_url
  end

  def find_element_by_partial_link_text link_text
    @driver.find_element(:partial_link_text, link_text)
  end

end