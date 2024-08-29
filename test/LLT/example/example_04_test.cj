// DEPENDENCE: ./abstract_double_precision_float_test.cj
// EXEC: cjc %import-path %L %l %f ./abstract_double_precision_float_test.cj --test
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*
import std.math.*
import std.math.numeric.BigInt
import std.convert.*

@Test
public class Example04Test {
    @TestCase
    public func Example22Test() {
        var test = AbstractDoublePrecisionFloatTest(
            1.1,
            [0xfb, 0x3f, 0xf1, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example31Test() {
        var test = AbstractDoublePrecisionFloatTest(
            -4.1,
            [0xfb, 0xc0, 0x10, 0x66, 0x66, 0x66, 0x66,
                        0x66, 0x66]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

     @TestCase
    public func Example38Test() {
        var test = AbstractDoublePrecisionFloatTest(
            Float64.Inf,
            [0xfb, 0x7f, 0xf0, 0x00, 0x00, 0x00, 0x00,
                        0x00, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example39Test() {
        var test = AbstractDoublePrecisionFloatTest(
            Float64.NaN,
            [0xfb, 0x7f, 0xf8, 0x00, 0x00, 0x00, 0x00,
                        0x00, 0x00]
        )
        test.shouldEncode()
    }

    @TestCase
    public func Example40Test() {
        var test = AbstractDoublePrecisionFloatTest(
            -Float64.Inf,
            [ 0xfb, 0xff, 0xf0, 0x00, 0x00,
                        0x00, 0x00, 0x00, 0x00]
        )
        test.shouldEncode()
    }
}
