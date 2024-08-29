// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class MapBuilderTest {
    @TestCase
    public func testMapBuilder(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addMap().put(UnicodeString("key"), UnicodeString("value")).put(1, true).put(2,
            "value".toArray()).put(3, 1.0).put(4, 1.0).put(5, 1).put(6, "value").put("7", true).put("8",
            "value".toArray()).put("9", 1.0).put("10", 1.0).put("11", 1).put("12", "value").putMap(13).end().getOrThrow(
        )
        let dataItems2 = (((dataItems as MapBuilder<CborBuilder>).getOrThrow().putMap("14").end().getOrThrow()) as MapBuilder<CborBuilder>).
            getOrThrow().putMap(UnsignedInteger(15)).end().getOrThrow()
        let dataItems3 = (((dataItems2 as MapBuilder<CborBuilder>).getOrThrow().putArray(16).end().getOrThrow()) as MapBuilder<CborBuilder>).
            getOrThrow().putArray("17").end().getOrThrow()
        let dataItems4 = (((dataItems3 as MapBuilder<CborBuilder>).getOrThrow().putArray(UnsignedInteger(18)).end().
            getOrThrow()) as MapBuilder<CborBuilder>).getOrThrow().end().getOrThrow()
        let dataItems5 = (dataItems4 as CborBuilder).getOrThrow().startMap().startArray(1).end().getOrThrow().startArray(
            UnsignedInteger(2)).end().getOrThrow().end().getOrThrow().build()
        @Assert(2, dataItems5.size)
        @Assert((dataItems5.first.getOrThrow()) is CborMap)
        let map = (dataItems5.first.getOrThrow() as CborMap).getOrThrow()
        @Assert(19, map.getKeys().size)
    }

    @TestCase
    public func startMapInMap(): Unit {
        let builder = CborBuilder()
        let dataItems = (((((builder.addMap().startMap(ByteString([1])).put(1, 2).end().getOrThrow()) as MapBuilder<CborBuilder>).
            getOrThrow().startMap(1).end().getOrThrow() as MapBuilder<CborBuilder>).getOrThrow().startMap("asdf").end().
            getOrThrow() as MapBuilder<CborBuilder>).getOrThrow().end().getOrThrow() as CborBuilder).getOrThrow().build(
        )
        let rootMap = (dataItems.first.getOrThrow() as CborMap).getOrThrow()
        let keys = rootMap.getKeys().toArray()
        @Assert(keys[0], ByteString([1]))
        @Assert(keys[1], UnsignedInteger(1))
        @Assert(keys[2], UnicodeString("asdf"))
        @Assert((rootMap.get(keys[0])).getOrThrow() is CborMap)
        @Assert((rootMap.get(keys[1])).getOrThrow() is CborMap)
        @Assert((rootMap.get(keys[2])).getOrThrow() is CborMap)
    }
}
