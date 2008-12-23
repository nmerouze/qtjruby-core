Qt::Application.initialize(ARGV)
window = Qt::Widget.new
window.resize(200, 120)
quit = Qt::PushButton.new("Quit", window)
quit.font = Qt::Font.new("Times", 18, Qt::Font::Weight::Bold.value)
quit.set_geometry(10, 40, 180, 40)
quit.clicked { Qt::Application.exit }
window.window_title = 'FamilyValues'
window.show
Qt::Application.exec
