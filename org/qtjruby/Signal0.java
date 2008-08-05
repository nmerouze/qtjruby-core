package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal0 extends RubySignal {
    Signal0 signal = new Signal0();

    public void emit() { signal.emit(); }
}
