package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal5 extends RubySignal {
    Signal5 signal = new Signal5();

    public void emit(Object a, Object b, Object c,
                     Object d, Object e) {
        signal.emit(a, b, c, d, e);
    }
}

