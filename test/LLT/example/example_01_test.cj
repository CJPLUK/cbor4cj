// DEPENDENCE: ./abstract_number_test.cj
// EXEC: cjc %import-path %L %l %f ./abstract_number_test.cj --test
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class Example01Test {
    @TestCase
    public func Example01Test() {
        var test = AbstractNumberTest(0, [0x00])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example02Test() {
        var test = AbstractNumberTest(1, [0x01])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example03Test() {
        var test = AbstractNumberTest(10, [0x0a])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example04Test() {
        var test = AbstractNumberTest(23, [0x17])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example05Test() {
        var test = AbstractNumberTest(24, [0x18, 0x18])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example06Test() {
        var test = AbstractNumberTest(25, [0x18, 0x19])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example07Test() {
        var test = AbstractNumberTest(100, [0x18, 0x64])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example08Test() {
        var test = AbstractNumberTest(1000, [0x19, 0x03, 0xe8])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example09Test() {
        var test = AbstractNumberTest(1000000, [0x1a, 0x00, 0x0f, 0x42, 0x40])
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example10Test() {
        var test = AbstractNumberTest(
            1000000000000,
            [0x1b, 0x00, 0x00, 0x00, 0xe8, 0xd4, 0xa5, 0x10, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }
}
