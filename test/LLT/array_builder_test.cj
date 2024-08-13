// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class ArrayBuilderTest {
    @TestCase
    public func shouldAddBool(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addArray().add(true).add(false).end().getOrThrow().build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is CborArray)
        let array = (dataItems.first.getOrThrow() as CborArray).getOrThrow()
        @Assert(2, array.getDataItems().size)
        @Assert((array.getDataItems()[0]) is SimpleValue)
        @Assert((array.getDataItems()[1]) is SimpleValue)
    }

    @TestCase
    public func shouldAddFloat(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addArray().add(1.0f32).end().getOrThrow().build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is CborArray)
        let array = (dataItems.first.getOrThrow() as CborArray).getOrThrow()
        @Assert(1, array.getDataItems().size)
        @Assert((array.getDataItems()[0]) is HalfPrecisionFloat)
    }

    @TestCase
    public func shouldAddDouble(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addArray().add(1.0f64).end().getOrThrow().build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is CborArray)
        let array = (dataItems.first.getOrThrow() as CborArray).getOrThrow()
        @Assert(1, array.getDataItems().size)
        @Assert((array.getDataItems()[0]) is DoublePrecisionFloat)
    }

    @TestCase
    public func shouldAddByteArray(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addArray().add([0]).end().getOrThrow().build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is CborArray)
        let array = (dataItems.first.getOrThrow() as CborArray).getOrThrow()
        @Assert(1, array.getDataItems().size)
        @Assert((array.getDataItems()[0]) is ByteString)
    }
}
