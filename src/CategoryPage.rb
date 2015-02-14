require 'forwardable'

class CategoryPage
  extend Forwardable

  def_delegator :@menu, :select_category_and_subcategory
  def_delegator :@menu, :select_category

  def initialize driver, name
    @name   = name
    @driver = driver
    @menu   = Menu.new @driver
  end

  def get_analytics
    execute_script expected_analytics.keys.first.to_s
  end

  def expected_analytics
    {:catArray => [@name]}
  end

  def execute_script data
    data = @driver.execute_script("return window.shc.#{data}")
    data
  end

  def on_category_page?
    get_url.include? @name
  end

  def get_url
    @driver.current_url
  end


end