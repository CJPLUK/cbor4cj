// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class ChunkableDataItemTest {

    @TestCase
    public func testEquals(): Unit {
        let item1 = ChunkableDataItemTest_TestDataItem(this)
        let item2 = ChunkableDataItemTest_TestDataItem(this)
        @Assert(item1, item2)
        item1.setChunked(true)
        item2.setChunked(false)
        @Assert(!item1.equals(item2))
    }
}


class ChunkableDataItemTest_TestDataItem <: ChunkableDataItem {
    protected init(this_0: ChunkableDataItemTest) {
        super(MajorType.INVALID)
    }
}

