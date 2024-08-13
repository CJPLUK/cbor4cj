// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class MapTest {
    public init() { }

    @TestCase
    public func testRemove(): Unit {
        let key = UnicodeString("key")
        let value = UnicodeString("value")
        let map = CborMap()
        map.put(key, value)
        @Assert(1, map.getValues().size)
        map.remove(key)
        @Assert(0, map.getValues().size)
    }

    @TestCase
    public func testEquals(): Unit {
        let map1 = CborMap()
        @Assert(map1, map1)
    }

    @TestCase
    public func testHashcode(): Unit {
        let map1 = CborMap()
        let map2 = CborMap()
        @Assert(map1.hashCode(), map2.hashCode())
        map1.put(UnicodeString("key"), UnicodeString("value"))
        println(map1.hashCode())
        println(map2.hashCode())
        @Assert(map1.hashCode() == map2.hashCode(), false)
    }
}

