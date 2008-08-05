package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal3 extends RubySignal {
    Signal3 signal = new Signal3();

    public void emit(Object a, Object b, Object c) {
        signal.emit(a, b, c);
    }
}
