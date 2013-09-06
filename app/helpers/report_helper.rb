module ReportHelper
  
  def average_time(array)
    sum = array.sum
    length = array.length
    sum / length
  rescue
    MathError 
  end

  MathError = Class.new(StandardError)
end
