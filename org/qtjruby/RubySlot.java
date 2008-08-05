package org.qtjruby;

import org.jruby.*;
import org.jruby.runtime.*;
import org.jruby.javasupport.*;

class RubySlot {
		public Block block = Block.NULL_BLOCK;

    public RubySlot(RubyMethod slot) {
        this.slot = slot;
    }
		
    private RubyObject wrap(Object x) {
			return (RubyObject)JavaEmbedUtils.javaToRuby(slot.getRuntime(), x);
		}
		
		public void execute_0() {
				RubyObject rbs[] = new RubyObject[0];
				slot.call(rbs, block);
    }

		private void genericExecute(Object ... vals) {
        RubyObject rbs[] = new RubyObject[vals.length];
        for (int i=0; i<vals.length; ++i) {
            rbs[i] = wrap(vals[i]);
        }
        slot.call(rbs, block);
    }

		public void execute_1(Object a) {
        genericExecute(a);
    }

    public void execute_2(Object a, Object b) {
        genericExecute(a, b);
    }

    public void execute_3(Object a, Object b, Object c) {
        genericExecute(a, b, c);
    }

    public void execute_4(Object a, Object b, Object c, Object d) {
        genericExecute(a, b, c, d);
    }

    public void execute_5(Object a, Object b, Object c, Object d, Object e) {
        genericExecute(a, b, c, d, e);
    }

    public void execute_6(Object a, Object b, Object c, Object d, Object e, Object f) {
        genericExecute(a, b, c, d, e, f);
    }

    public void execute_7(Object a, Object b, Object c, Object d, Object e, Object f, Object g) {
        genericExecute(a, b, c, d, e, f, g);
    }

    public void execute_8(Object a, Object b, Object c, Object d, Object e, Object f, Object g, Object h) {
        genericExecute(a, b, c, d, e, f, g, h);
    }

    public void execute_9(Object a, Object b, Object c, Object d, Object e, Object f, Object g, Object h, Object i) {
        genericExecute(a, b, c, d, e, f, g, h, i);
    }

    public static String signature(int count) {
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

    private RubyMethod slot;
}