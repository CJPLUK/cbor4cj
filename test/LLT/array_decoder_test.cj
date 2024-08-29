// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class ArrayDecoderTest {
    public init() {}

    @TestCase
    public func shouldThrowOnIncompleteArray(): Unit {
        let bytes: Array<UInt8> = [130, 1]
        try {
            CborDecoder.decodeStatic(bytes)
        } catch (e: CborException) {
            return
        }
        @Assert(false)
    }

    @TestCase
    public func shouldThrowInIncompleteIndefiniteLengthArray(): Unit {
        let bytes: Array<UInt8> = [159, 1, 2]
        try {
            CborDecoder.decodeStatic(bytes)
        } catch (e: CborException) {
            return
        }
        @Assert(false)
    }
}
