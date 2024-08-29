/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package cbor4cj

public class SimpleValueType <: Enum<SimpleValueType> {
    public static let FALSE = SimpleValueType("FALSE", 0, 20)

    public static let TRUE = SimpleValueType("TRUE", 1, 21)

    public static let NULL = SimpleValueType("NULL", 2, 22)

    public static let UNDEFINED = SimpleValueType("UNDEFINED", 3, 23)

    public static let RESERVED = SimpleValueType("RESERVED", 4, 0)

    public static let UNALLOCATED = SimpleValueType("UNALLOCATED", 5, 0)

    private let value: Int32

    private init(_enum_name: String, _enum_ordinal: Int32, value: Int32) {
        super(_enum_name, _enum_ordinal)
        this.value = value
    }

    public func getValue(): Int32 {
        return value
    }

    public static func ofByte(b: Int32): SimpleValueType {
        match (b & 31) {
            case 20 => return FALSE
            case 21 => return TRUE
            case 22 => return NULL
            case 23 => return UNDEFINED
            case 24 | 25 | 26 | 27 | 28 | 29 | 30 | 31 => return RESERVED
            case _ => return UNALLOCATED
        }
    }
}

