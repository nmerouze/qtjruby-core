package org.qtjruby;

import com.trolltech.qt.*;
import org.jruby.*;
import org.jruby.runtime.*;

public class Signals {

    private static String signature(int count) {
        StringBuilder s = new StringBuilder();
        s.append("execute_").append(count).append('(');
        for (int i=0; i<count; ++i) {
            if (i != 0)
                s.append(',');
            s.append("Object");
        }
        s.append(')');
        return s.toString();
    }

    public static void connect(QSignalEmitter.AbstractSignal signal, RubyMethod method) {
        RubySlot receiver = new RubySlot(method);
        if (signal instanceof QSignalEmitter.Signal0)
            ((QSignalEmitter.Signal0) signal).connect(receiver, signature(0));
        else if (signal instanceof QSignalEmitter.Signal1)
            ((QSignalEmitter.Signal1) signal).connect(receiver, signature(1));
        else if (signal instanceof QSignalEmitter.Signal2)
            ((QSignalEmitter.Signal2) signal).connect(receiver, signature(2));
        else if (signal instanceof QSignalEmitter.Signal3)
            ((QSignalEmitter.Signal3) signal).connect(receiver, signature(3));
        else if (signal instanceof QSignalEmitter.Signal4)
            ((QSignalEmitter.Signal4) signal).connect(receiver, signature(4));
        else if (signal instanceof QSignalEmitter.Signal5)
            ((QSignalEmitter.Signal5) signal).connect(receiver, signature(5));
        else if (signal instanceof QSignalEmitter.Signal6)
            ((QSignalEmitter.Signal6) signal).connect(receiver, signature(6));
        else if (signal instanceof QSignalEmitter.Signal7)
            ((QSignalEmitter.Signal7) signal).connect(receiver, signature(7));
        else if (signal instanceof QSignalEmitter.Signal8)
            ((QSignalEmitter.Signal8) signal).connect(receiver, signature(8));
        else if (signal instanceof QSignalEmitter.Signal9)
            ((QSignalEmitter.Signal9) signal).connect(receiver, signature(9));
    }

		public static void connect(QSignalEmitter.AbstractSignal signal, RubyMethod method, RubyProc proc) {
        RubySlot receiver = new RubySlot(method);
				receiver.block = new Block(null, null);
				receiver.block.setProcObject(proc);
        if (signal instanceof QSignalEmitter.Signal0)
            ((QSignalEmitter.Signal0) signal).connect(receiver, signature(0));
        else if (signal instanceof QSignalEmitter.Signal1)
            ((QSignalEmitter.Signal1) signal).connect(receiver, signature(1));
        else if (signal instanceof QSignalEmitter.Signal2)
            ((QSignalEmitter.Signal2) signal).connect(receiver, signature(2));
        else if (signal instanceof QSignalEmitter.Signal3)
            ((QSignalEmitter.Signal3) signal).connect(receiver, signature(3));
        else if (signal instanceof QSignalEmitter.Signal4)
            ((QSignalEmitter.Signal4) signal).connect(receiver, signature(4));
        else if (signal instanceof QSignalEmitter.Signal5)
            ((QSignalEmitter.Signal5) signal).connect(receiver, signature(5));
        else if (signal instanceof QSignalEmitter.Signal6)
            ((QSignalEmitter.Signal6) signal).connect(receiver, signature(6));
        else if (signal instanceof QSignalEmitter.Signal7)
            ((QSignalEmitter.Signal7) signal).connect(receiver, signature(7));
        else if (signal instanceof QSignalEmitter.Signal8)
            ((QSignalEmitter.Signal8) signal).connect(receiver, signature(8));
        else if (signal instanceof QSignalEmitter.Signal9)
            ((QSignalEmitter.Signal9) signal).connect(receiver, signature(9));
    }

    public static void connect(RubySignal signal, RubyMethod method, RubyProc proc) {
        RubySlot receiver = new RubySlot(method);
				receiver.block = new Block(null, null);
				receiver.block.setProcObject(proc);
        if (signal instanceof Signal0) {
            ((Signal0) signal).signal.connect(receiver, signature(0));
        } else if (signal instanceof Signal1) {
            ((Signal1) signal).signal.connect(receiver, signature(1));
        } else if (signal instanceof Signal2) {
            ((Signal2) signal).signal.connect(receiver, signature(2));
        } else if (signal instanceof Signal3) {
            ((Signal3) signal).signal.connect(receiver, signature(3));
        } else if (signal instanceof Signal4) {
            ((Signal4) signal).signal.connect(receiver, signature(4));
        } else if (signal instanceof Signal5) {
            ((Signal5) signal).signal.connect(receiver, signature(5));
        } else if (signal instanceof Signal6) {
            ((Signal6) signal).signal.connect(receiver, signature(6));
        } else if (signal instanceof Signal7) {
            ((Signal7) signal).signal.connect(receiver, signature(7));
        } else if (signal instanceof Signal8) {
            ((Signal8) signal).signal.connect(receiver, signature(8));
        } else if (signal instanceof Signal9) {
            ((Signal9) signal).signal.connect(receiver, signature(9));
        }
    }

		public static void connect(RubySignal signal, RubyMethod method) {
        RubySlot receiver = new RubySlot(method);
        if (signal instanceof Signal0) {
            ((Signal0) signal).signal.connect(receiver, signature(0));
        } else if (signal instanceof Signal1) {
            ((Signal1) signal).signal.connect(receiver, signature(1));
        } else if (signal instanceof Signal2) {
            ((Signal2) signal).signal.connect(receiver, signature(2));
        } else if (signal instanceof Signal3) {
            ((Signal3) signal).signal.connect(receiver, signature(3));
        } else if (signal instanceof Signal4) {
            ((Signal4) signal).signal.connect(receiver, signature(4));
        } else if (signal instanceof Signal5) {
            ((Signal5) signal).signal.connect(receiver, signature(5));
        } else if (signal instanceof Signal6) {
            ((Signal6) signal).signal.connect(receiver, signature(6));
        } else if (signal instanceof Signal7) {
            ((Signal7) signal).signal.connect(receiver, signature(7));
        } else if (signal instanceof Signal8) {
            ((Signal8) signal).signal.connect(receiver, signature(8));
        } else if (signal instanceof Signal9) {
            ((Signal9) signal).signal.connect(receiver, signature(9));
        }
    }

}