require 'pry'
class Menu

  DEPARTMENT = '#gnf_dept_tree_item_1'

  def initialize driver
    @driver = driver
  end

  def select_category_and_subcategory(category, sub_category)
    binding.pry
    move_to_category category
    subcategory_element = find_element_by_partial_link_text sub_category
    subcategory_element.click
    SubCategoryPage.new(@driver, sub_category)
  end

  def select_category category
    # @driver.wait_for_element DEPARTMENT
    catagory_element = find_element_by_css DEPARTMENT
    move_to_element catagory_element
    element = find_element_by_partial_link_text category
    element.click
    CategoryPage.new(@driver, category)
  end

  private
  def move_to_category category_name
    catagory_element = find_element_by_css DEPARTMENT
    move_to_element catagory_element
    category_element = find_element_by_partial_link_text category_name
    move_to_element category_element
  end

  def find_element_by_css css_selector
    @driver.find_element(:css, css_selector)
  end

  def find_element_by_partial_link_text link_text
    @driver.find_element(:partial_link_text, link_text)
  end

  def move_to_element element
    @driver.action.move_to(element).perform
  end
end