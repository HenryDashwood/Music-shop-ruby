require('minitest/autorun')
require ('pry-byebug')
require('minitest/rg')
require_relative('../instruments')
require_relative('../shop')


class TestInstruments < Minitest::Test

  def setup
    @guitar = Instruments.new('guitar', 400, 50)
    @piano = Instruments.new('piano', 1000, 20)
    @drums = Instruments.new('drums', 800, 15)

  end



  def test_if_instruments_added
    assert_equal('guitar', @guitar.name)
    assert_equal('piano', @piano.name)
    assert_equal('drums', @drums.name)
  #binding.pry 

  end

  def test_if_price_added
    assert_equal(400, @guitar.price)
    assert_equal(1000, @piano.price)
    assert_equal(800, @drums.price)
  end

  def test_if_stock_added
    assert_equal(50, @guitar.stock)
    assert_equal(20, @piano.stock)
    assert_equal(15, @drums.stock)
  end

  def test_add_quantity
    @guitar.add(1)
    assert_equal(51, @guitar.stock)
  end

  def test_reduce_quantity
    @guitar.reduce(1)
    assert_equal(49, @guitar.stock)
  end

  

end
