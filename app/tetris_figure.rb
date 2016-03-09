class TetrisFigure
  def initialize data
    @data = data
    validate_data!
  end

  def rotate
    width = @data.first.length
    height = @data.length
    @data = (0...width).inject([]) do |row, y1|
      row << (0...height).inject([]) do |cell, x1|
        cell << @data[height-x1-1][y1]
      end
    end
  end

  def to_a
    @data
  end

  private

  def validate_data!
    error = case
            when !@data.is_a?(Array)
              'data is not an array'
            when @data.any? { |int| !int.is_a? Array }
              'data must contain all arrays'
            when @data.map(&:length).uniq.length != 1
              'data subarrays must be all equal length'
            end

    fail ArgumentError, error if error
  end
end
