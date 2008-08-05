package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal2 extends RubySignal {
    Signal2<Object, Object> signal = new Signal2<Object, Object>();

    public void emit(Object a, Object b) {
        signal.emit(a, b);
    }
}
