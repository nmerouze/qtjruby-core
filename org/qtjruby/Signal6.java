package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal6 extends RubySignal {
    Signal6 signal = new Signal6();

    public void emit(Object a, Object b, Object c,
                     Object d, Object e, Object f) {
        signal.emit(a, b, c, d, e, f);
    }
}

