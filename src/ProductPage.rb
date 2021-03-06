require 'forwardable'

class ProductPage
  extend Forwardable

  def_delegator :@menu, :select_category_and_subcategory
  def_delegator :@menu, :select_category

  DEPARTMENT = '#gnf_dept_tree_item_1>span>span'

  def initialize driver, name
    @name   = name
    @driver = driver
    @menu   = Menu.new @driver
  end

  def on_product_page?
    get_url.include? @name
  end

  def get_url
    @driver.current_url
  end

end