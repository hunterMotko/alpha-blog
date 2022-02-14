require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  #! instance variables are not available outside of each
  #! test case EQ: local variable now
  #! so instead use setup kind of like
  def setup
    @category = Category.new(name: 'Sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = ' '
    assert_not @category.valid?
  end

  test 'name should be uniq' do
    @category.save
    @category2 = Category.new(name: 'Sports')
    assert_not @category2.valid?
  end

  test 'name should not be too long' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end

  test 'name should not be too short' do
    @category.name = 'aa'
    assert_not @category.valid?
  end

end
