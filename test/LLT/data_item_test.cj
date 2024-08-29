// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class DataItemTest {
    @TestCase
    public func testSetTag_Long(): Unit {
        let di = CborBuilder().addTag(30).build().first.getOrThrow()
        di.setTag(1)
        try {
            di.getTag()
        } catch (e: CborException) {
            @Fail("should not throw")
        }
    }

    @TestCase
    public func testSetTag_Long_negative(): Unit {
        let di = CborBuilder().addTag(30).build().first.getOrThrow()
        try {
            di.setTag(-1)
        } catch (e: IllegalArgumentException) {
            return
        }
        @Assert(false)
    }


    @TestCase
    public func testGetTag(): Unit {
        let di = CborBuilder().addTag(1).build().first.getOrThrow()
        di.setTag(Tag(1))
        let t = di.getTag().getOrThrow()
        @Assert(1, t.getValue())
    }

    @TestCase
    public func testHasTag(): Unit {
        let di = CborBuilder().addTag(1).build().first.getOrThrow()
        di.setTag(Tag(1))
        @Assert(true, di.hasTag())
        di.removeTag()
        @Assert(false, di.hasTag())
    }

    @TestCase
    public func testRemoveTag(): Unit {
        let di = CborBuilder().addTag(1).build().first.getOrThrow()
        di.setTag(Tag(1))
        @Assert(di.getTag().isSome())
        di.removeTag()
        
        @Assert(di.getTag().isNone())
    }

    @TestCase
    public func testEquals(): Unit {
        let a: DataItem = DataItemTest_TestDataItem(this)
        let b: DataItem = DataItemTest_TestDataItem(this)
        @Assert(a, b)
        a.setTag(1)
        @Assert(!a.equals(b))
    }
}

class DataItemTest_TestDataItem <: DataItem {
    protected init(this_0: DataItemTest) {
        super(MajorType.INVALID)
    }
}
