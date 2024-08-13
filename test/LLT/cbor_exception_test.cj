// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import std.io.*
import cbor4cj.*


@Test
public class CborExceptionTest {

    @TestCase
    public func shouldHaveMessage(): Unit {
        let cborException = CborException("message")
        @Assert("message",(cborException.message))
        @Assert(cborException.toString().contains("CborException:"),true)
    }

    @TestCase
    public func shouldHaveMessageAndThrowable(): Unit {
        let throwable = Exception()
        let cborException = CborException("message", throwable)
        @Assert((cborException.message).contains("Exception"))
    }
}
