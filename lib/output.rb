class Output
  def field_and_figure field, figure
    data = figure.inject([]) do |result, figure_line|
      result << field[result.length] + [0] + figure_line
    end

    field[figure.length..-1].inject(data) do |data|
      data << field[data.length] + Array.new(figure.first.length+1, 0)
    end
  end
end
