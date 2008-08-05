package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal4 extends RubySignal {
    Signal4 signal = new Signal4();

    public void emit(Object a, Object b, Object c,
                     Object d) {
        signal.emit(a, b, c, d);
    }
}
