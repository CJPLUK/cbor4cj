/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights resvered.
 */
package cbor4cj

public class HalfPrecisionFloat <: AbstractFloat {
    public init(value: Float32) {
        super(SpecialType.IEEE_754_HALF_PRECISION_FLOAT, value)
    }
}

