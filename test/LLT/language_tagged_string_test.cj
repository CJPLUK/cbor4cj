// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class LanguageTaggedStringTest {

    @TestCase
    public func shouldInitializeWithStrings(): Unit {
        let lts = LanguageTaggedString("en", "Hello")
        @Assert(38, lts.getTag().getOrThrow().getValue())
    }
}

