// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class ArrayTest {

    @TestCase
    public func testEquals(): Unit {
        let array = CborArray()
        @Assert(array.equals(array))
    }

    @TestCase
    public func testHashcode(): Unit {
        let array1 = CborArray().add(UnicodeString("string"))
        let array2 = CborArray().add(UnicodeString("string"))
        @Assert(array1.hashCode(), array2.hashCode())
    }

    @TestCase
    public func testToString(): Unit {
        let array = CborArray().add(UnicodeString("a"))
        @Assert("a", UnicodeString("a").toString())
    }
}

