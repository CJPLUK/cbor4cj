// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class TagTest {

    @TestCase
    public func testEquals1(): Unit {
        var i = 0
        while (i < 256) {
            let tag1 = Tag(Int64(i))
            let tag2 = Tag(Int64(i))
            @Assert(tag1.equals(tag2))
            i++
        }
    }

    @TestCase
    public func testEquals2(): Unit {
        let tag = Tag(0)
        @Assert(tag.equals(tag))
    }

    @TestCase
    public func testNotEquals(): Unit {
        let tag = Tag(0)
        @Assert(!tag.equals(Tag(1)))
    }
}

