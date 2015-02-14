require_relative '../src/SubCategoryPage'
require_relative '../src/Menu'
require 'forwardable'

class HomePage
  extend Forwardable

  def_delegator :@menu, :select_category_and_subcategory
  def_delegator :@menu, :select_category

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

end