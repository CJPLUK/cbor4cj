// DEPENDENCE: ./abstract_half_precision_float_test.cj
// EXEC: cjc %import-path %L %l %f ./abstract_half_precision_float_test.cj --test
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*
import std.math.*
import std.math.numeric.BigInt

@Test
public class Example03Test {
    @TestCase
    public func Example19Test() {
        var test = AbstractHalfPrecisionFloatTest(
            0.0,
            [0xf9, 0x00, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example20Test() {
        var test = AbstractHalfPrecisionFloatTest(
            -0.0,
            [0xf9, 0x80, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example21Test() {
        var test = AbstractHalfPrecisionFloatTest(
            1.0,
            [0xf9, 0x3c, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example23Test() {
        var test = AbstractHalfPrecisionFloatTest(
            1.5,
            [0xf9, 0x3e, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example24Test() {
        var test = AbstractHalfPrecisionFloatTest(
            65504.0,
            [0xf9, 0x7b, 0xff]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example28Test() {
        var test = AbstractHalfPrecisionFloatTest(
            5.960464477539063e-08,
            [0xf9, 0x00, 0x01]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example29Test() {
        var test = AbstractHalfPrecisionFloatTest(
            6.103515625e-05,
            [0xf9, 0x04, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example30Test() {
        var test = AbstractHalfPrecisionFloatTest(
            -4.0,
            [0xf9, 0xc4, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example32Test() {
        var test = AbstractHalfPrecisionFloatTest(
            Float32.Inf,
            [0xf9, 0x7c, 0x00]
        )
        test.shouldDecode()
        test.shouldEncode()
    }

    @TestCase
    public func Example34Test() {
        var test = AbstractHalfPrecisionFloatTest(
            -Float32.Inf,
            [0xf9, 0xfc, 0x00]
        )
        test.shouldEncode()
    }
   
}
