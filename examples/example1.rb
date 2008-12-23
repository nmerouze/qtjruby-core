Qt::Application.initialize(ARGV)
hello = Qt::PushButton.new 'Hello World!'
hello.resize(120, 40)
hello.window_title = 'Hello World'
hello.show
Qt::Application.exec