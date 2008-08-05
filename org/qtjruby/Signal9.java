package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal9 extends RubySignal {
    Signal9 signal = new Signal9();

    public void emit(Object a, Object b, Object c,
                     Object d, Object e, Object f,
                     Object g, Object h, Object i) {
        signal.emit(a, b, c, d, e, f, g, h, i);
    }
}

