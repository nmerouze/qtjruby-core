package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal7 extends RubySignal {
    Signal7 signal = new Signal7();

    public void emit(Object a, Object b, Object c,
                     Object d, Object e, Object f,
                     Object g) {
        signal.emit(a, b, c, d, e, f, g);
    }
}

