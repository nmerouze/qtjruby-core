package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;

public class Signal1 extends RubySignal {
    Signal1<Object> signal = new Signal1<Object>();

    public void emit(Object a) { signal.emit(a); }
}
