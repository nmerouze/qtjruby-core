Qt::Application.initialize(ARGV)
quit = Qt::PushButton.new 'Quit'
quit.resize(80, 40)
quit.font = Qt::Font.new("Times", 18, Qt::Font::Weight::Bold.value)
quit.clicked { Qt::Application.exit }
quit.window_title = 'Calling It Quits'
quit.show
Qt::Application.exec
