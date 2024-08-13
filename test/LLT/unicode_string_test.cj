// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*
import std.math.numeric.BigInt

@Test
public class UnicodeStringTest {


    @TestCase
    public func shouldEqualsSameObject(): Unit {
        let unicodeString = UnicodeString("string")
        @Assert(unicodeString.equals(unicodeString))
    }

    @TestCase
    public func shouldEqualsBothNull(): Unit {
        let unicodeString1 = UnicodeString(None)
        let unicodeString2 = UnicodeString(None)
        @Assert(unicodeString1.equals(unicodeString2))
        @Assert(unicodeString2.equals(unicodeString1))
    }

    @TestCase
    public func shouldEqualsSameValue(): Unit {
        let unicodeString1 = UnicodeString("string")
        let unicodeString2 = UnicodeString("string")
        @Assert(unicodeString1.equals(unicodeString2))
        @Assert(unicodeString2.equals(unicodeString1))
    }

    @TestCase
    public func shouldHashNull(): Unit {
        @Assert(0, UnicodeString(None).hashCode())
    }

    @TestCase
    public func shouldNotEquals(): Unit {
        let unicodeString1 = UnicodeString(None)
        let unicodeString2 = UnicodeString("")
        @Assert(false, unicodeString1.equals(unicodeString2))
    }
}

