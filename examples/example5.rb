class Blocks < Qt::Widget
  def initialize
    super
    quit = Qt::PushButton.new('Quit')
    quit.font = Qt::Font.new('Times', 18, Qt::Font::Weight::Bold.value)

    lcd = Qt::LCDNumber.new(2)
    lcd.segment_style = Qt::LCDNumber::SegmentStyle::Filled

    slider = Qt::Slider.new(Qt::Orientation::Horizontal)
    slider.set_range(0, 99)
    slider.value = 0

    quit.clicked { Qt::Application.exit }
    slider.value_changed { lcd.display(slider.value) }

    self.layout = Qt::VBoxLayout.new
    [quit, lcd, slider].each { |widget| layout.add_widget(widget) }

    self.window_title = 'Building Blocks'
  end
end

Qt::Application.initialize(ARGV)
Blocks.new.show
Qt::Application.exec