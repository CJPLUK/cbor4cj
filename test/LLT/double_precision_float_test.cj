// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class DoublePrecisionFloatTest {
    public init() { }

    @TestCase
    public func testEquals(): Unit {
        let a = DoublePrecisionFloat(1.234)
        let b = DoublePrecisionFloat(0.333)
        @Assert(a, a)
        @Assert(b, b)
    }

    @TestCase
    public func testNotEquals(): Unit {
        let doublePrecisionFloat = DoublePrecisionFloat(1.234)
        @Assert(!doublePrecisionFloat.equals(DoublePrecisionFloat(1.2345)))
    }
}

