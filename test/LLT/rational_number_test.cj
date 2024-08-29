// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*

@Test
public class RationalNumberTest {
    @TestCase
    public func shouldThrowIfDenominatorIsZero(): Unit {
        try {
            RationalNumber(UnsignedInteger(1), UnsignedInteger(0))
        } catch (e: CborException) {
            return
        }
        @Assert(false)
    }

    @TestCase
    public func shouldSetNumeratorAndDenominator(): Unit {
        let one = UnsignedInteger(1)
        let two = UnsignedInteger(2)
        let rationalNumber = RationalNumber(one, two)
        @Assert(one, rationalNumber.getNumerator())
        @Assert(two, rationalNumber.getDenominator())
    }
}
