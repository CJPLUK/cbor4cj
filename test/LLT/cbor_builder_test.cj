// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class CborBuilderTest {
    @TestCase
    public func shouldResetDataItems(): Unit {
        let builder = CborBuilder()
        builder.add(true)
        builder.add(1.0)
        @Assert(2, builder.build().size)
        builder.reset()
        @Assert(0, builder.build().size)
    }

    @TestCase
    public func shouldAddTag(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addTag(1234).build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is Tag)
        @Assert(1234, (dataItems.first.getOrThrow() as Tag).getOrThrow().getValue())
    }
}
