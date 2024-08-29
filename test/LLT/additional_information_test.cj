// EXEC: cjc %import-path %L %l %f --test  
// EXEC: ./main

import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class AdditionalInformationTest {

    @TestCase
    public func shouldHandleReserved28(): Unit {
        @Assert(AdditionalInformation.RESERVED, AdditionalInformation.ofByte(28))
        @Assert(AdditionalInformation.RESERVED, AdditionalInformation.ofByte(29))
        @Assert(AdditionalInformation.RESERVED, AdditionalInformation.ofByte(30))
    }
}

