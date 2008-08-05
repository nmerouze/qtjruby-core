package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal8 extends RubySignal {
    Signal8 signal = new Signal8();

    public void emit(Object a, Object b, Object c,
                     Object d, Object e, Object f,
                     Object g, Object h) {
        signal.emit(a, b, c, d, e, f, g, h);
    }
}

