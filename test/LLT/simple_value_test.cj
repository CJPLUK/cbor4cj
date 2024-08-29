// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class SimpleValueTest {
    @TestCase
    public func testEquals1(): Unit {
        var i: Int32 = 0
        while (i < 256) {
            let simpleValue1 = SimpleValue(i)
            let simpleValue2 = SimpleValue(i)
            @Assert(simpleValue1.equals(simpleValue2))
            i++
        }
    }

    @TestCase
    public func testEquals2(): Unit {
        let simpleValue = SimpleValue(0)
        @Assert(!simpleValue.equals(SimpleValue(1)))
    }
}
