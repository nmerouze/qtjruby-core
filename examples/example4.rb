class Widgets < Qt::Widget
  
  def initialize
    super
    set_fixed_size(200, 120)

    quit = Qt::PushButton.new("Quit", self)
    quit.set_geometry(62, 40, 75, 30)
    quit.font = Qt::Font.new("Times", 18, Qt::Font::Weight::Bold.value)
    quit.clicked { Qt::Application.exit }
    
    window_title = 'Let There Be Widgets'
  end
  
end

Qt::Application.initialize(ARGV)
widget = Widgets.new
widget.show
Qt::Application.exec
