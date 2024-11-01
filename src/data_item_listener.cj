/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2024. All rights reserved.
 */
package cbor4cj

public interface DataItemListener {
    func onDataItem(dataItem: DataItem): Unit
}
