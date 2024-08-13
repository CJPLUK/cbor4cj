// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.OutputStream
import cbor4cj.*

@Test
public class AbstractBuilderTest {
    @TestCase
    public func shouldCallIsHalfPrecisionEnough(): Unit {
        let builder = AbstractBuilderTest_TestBuilder(this)
        @Assert((builder.testConvert(0.0) is HalfPrecisionFloat))
        @Assert(0.0 , (builder.testConvert(0.0) as  HalfPrecisionFloat).getOrThrow().getValue())
        @Assert(builder.testConvert(0.3) is SinglePrecisionFloat)
        @Assert(0.3 , (builder.testConvert(0.3) as  SinglePrecisionFloat).getOrThrow().getValue())
    }

    @TestCase
    public func shouldThrowExceptionOnAddChunk(): Unit {
        try {
            AbstractBuilderTest_TestBuilder(this).testAddChunk()
        } catch (e: Exception) {
            @Assert(true)
            return
        }
        @Assert(false)
    }

    @TestCase
    public func IsHalfPrecisionEnoughShallReturnFalseOnException(): Unit {
        let builder = AbstractBuilderTest_TestBuilder(this)
        builder.setEncoderThrowsException()
        @Assert((builder.testConvert(0.0) is SinglePrecisionFloat))
        @Assert(0.0 , (builder.testConvert(0.0) as  SinglePrecisionFloat).getOrThrow().getValue())
    }
}

class AbstractBuilderTest_TestBuilder <: AbstractBuilder<Object> {
    private var encoderThrowsException = false

    public init(this_0: AbstractBuilderTest) {
        super(None)
    }

    public func testConvert(value: Float32): DataItem {
        return convert(value)
    }

    public func testAddChunk(): Unit {
        addChunk(None)
    }

    public func setEncoderThrowsException(): Unit {
        encoderThrowsException = true
    }

    protected override func getHalfPrecisionFloatEncoder(outputStream: OutputStream): HalfPrecisionFloatEncoder {
        if (encoderThrowsException) {
            return AbstractBuilderTest_TestBuilder_1(this, None, outputStream)
        } else {
            return super.getHalfPrecisionFloatEncoder(outputStream)
        }
    }
}

class AbstractBuilderTest_TestBuilder_1 <: HalfPrecisionFloatEncoder {
    init(this_1: AbstractBuilderTest_TestBuilder, encoder: ?CborEncoder, outputStream: OutputStream) {
        super(encoder, outputStream)
    }

    public func encode(dataItem: HalfPrecisionFloat): Unit {
        throw CborException("test")
    }
}
