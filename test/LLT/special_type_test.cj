// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class SpecialTypeTest {

    @TestCase
    public func shouldDetectUnallocated(): Unit {
        @Assert(refEq(SpecialType.ofByte(28), SpecialType.UNALLOCATED))
        @Assert(refEq(SpecialType.ofByte(29), SpecialType.UNALLOCATED))
        @Assert(refEq(SpecialType.ofByte(30), SpecialType.UNALLOCATED))
    }
}

