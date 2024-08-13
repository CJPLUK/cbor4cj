// DEPENDENCE: ./abstract_single_precision_float_test.cj
// EXEC: cjc %import-path %L %l %f ./abstract_single_precision_float_test.cj --test
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*
import std.math.*
import std.math.numeric.BigInt
import std.convert.*

@Test
public class Example05Test {
    @TestCase
    public func Example25Test() {
        var test = AbstractSinglePrecisionFloatTest(
            100000.0,
            [0xfa, 0x47, 0xc3, 0x50, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example35Test() {
        var test = AbstractSinglePrecisionFloatTest(
            Float32.Inf,
            [0xfa, 0x7f, 0x80, 0x00, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example36Test() {
        var test = AbstractSinglePrecisionFloatTest(
            Float32.NaN,
            [0xfa, 0x7f, 0xc0, 0x00, 0x00]
        )
        test.shouldEncode()
    }

    @TestCase
    public func Example37Test() {
        var test = AbstractSinglePrecisionFloatTest(
            -Float32.Inf,
            [0xfa, 0xff, 0x80, 0x00, 0x00]
        )
        test.shouldEncode()
    }
}
