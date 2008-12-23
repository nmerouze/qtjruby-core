class BlocksGalore < Qt::Widget
  def initialize
    super
    quit = Qt::PushButton.new('Quit')
    quit.font = Qt::Font.new('Times', 18, Qt::Font::Weight::Bold.value)
    quit.clicked { Qt::Application.exit }

    grid = Qt::GridLayout.new
    self.layout = Qt::VBoxLayout.new
    layout.add_widget(quit)
    layout.add_layout(grid)
    self.window_title = 'Building Blocks Galore'

    0.upto(2) do |row|
      0.upto(2) do |column|
        grid.add_widget(LCDRange.new, row, column)
      end
    end
  end
end

class LCDRange < Qt::Widget
  def initialize
    super
    lcd = Qt::LCDNumber.new(2)
    lcd.segment_style = Qt::LCDNumber::SegmentStyle::Filled

    slider = Qt::Slider.new(Qt::Orientation::Horizontal)
    slider.setRange(0, 99)
    slider.value = 0
    slider.value_changed { lcd.display(slider.value) }

    self.layout = Qt::VBoxLayout.new
    [lcd, slider].each { |widget| layout.add_widget(widget) }
  end
end

Qt::Application.initialize(ARGV)
BlocksGalore.new.show
Qt::Application.exec