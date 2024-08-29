// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class MajorTypeTest {

    @TestCase
    public func shouldParseUnsignedInteger(): Unit {
        @Assert(MajorType.UNSIGNED_INTEGER, MajorType.ofByte(0))
    }

    @TestCase
    public func shouldParseNegativeInteger(): Unit {
        @Assert(MajorType.NEGATIVE_INTEGER, MajorType.ofByte(32))
    }

    @TestCase
    public func shouldParseByteString(): Unit {
        @Assert(MajorType.BYTE_STRING, MajorType.ofByte(64))
    }

    @TestCase
    public func shouldParseUnicodeString(): Unit {
        @Assert(MajorType.UNICODE_STRING, MajorType.ofByte(96))
    }

    @TestCase
    public func shouldParseArray(): Unit {
        @Assert(MajorType.ARRAY, MajorType.ofByte(128))
    }

    @TestCase
    public func shouldParseMap(): Unit {
        @Assert(MajorType.MAP, MajorType.ofByte(160))
    }

    @TestCase
    public func shouldParseTag(): Unit {
        @Assert(MajorType.TAG, MajorType.ofByte(192))
    }

    @TestCase
    public func shouldParseSpecial(): Unit {
        @Assert(MajorType.SPECIAL, MajorType.ofByte(224))
    }

    @TestCase
    public func shouldReturnInvalidOnInvalidByteValue(): Unit {
        @Assert(MajorType.INVALID, MajorType.ofByte(-1))
    }
}

