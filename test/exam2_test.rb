require 'minitest/autorun'

class Exam2Test < Minitest::Test
  def test_result
    expected_value = <<~TEXT
      ==== RESULT ====
      No.1: troll
      No.2: dragon
      No.3: medusa
      No.4: griffin
      No.5: vampire
    TEXT
    result = `ruby exam_2/main.rb griffin vampire dragon troll medusa`
    assert_equal(expected_value, result)
  end
end
