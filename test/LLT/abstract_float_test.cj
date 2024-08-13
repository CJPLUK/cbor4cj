// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class AbstractFloatTest {

    @TestCase
    public func testEquals(): Unit {
        let a = AbstractFloat(SpecialType.IEEE_754_SINGLE_PRECISION_FLOAT, 0.0)
        let b = AbstractFloat(SpecialType.IEEE_754_SINGLE_PRECISION_FLOAT, 0.3)
        @Assert(a.equals(a))
        @Assert(b.equals(b))
        @Assert(!a.equals(b))
    }
}

