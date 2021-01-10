require 'minitest/autorun'

class Exam1Test < Minitest::Test
  def test_result
    expected_value = <<~TEXT
      truck_1:1
      truck_2:2,4
      truck_3:3
    TEXT
    result = `ruby exam_1/main.rb 1:50 2:30 3:40 4:10`
    assert_equal(expected_value, result)
  end
end
