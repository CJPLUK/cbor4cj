# cbor4cj 库

### 介绍

cbor4cj是简明二进制对象表示法(Cbor)的Cangjie语言实现。

### 1 Cbor编解码

需求来源：三方库
用户：仓颉开发者
场景：简明二进制对象表示法(Cbor)的Cangjie语言实现
目标：实现Cbor数据的编解码
验收标准：正确实现Cbor数据的编解码

##### 1.1 主要接口

```cangjie
public class CborEncoder {
    /*
     * 初始化 Cbor 编码器
     * 参数 outputStream - 编码数据输出流
     */
    public init(outputStream: OutputStream)

    /*
     * 编码
     * 参数 dataItems - 编码数据类集合
     */
    public func encode(dataItems: Collection<DataItem>): Unit

    /*
     * 编码
     * 参数 dataItem - 编码数据类，空值按 SimpleValue.NULL 进行编码
     */
    public func encode(dataItem: ?DataItem): Unit
}

public class CborDecoder {
    /*
     * 初始化 Cbor 解码器
     * 参数 inputStream - 解码数据输入流
     */
    public init(inputStream: InputStream)

    /*
     * 直接从字节数组中解码
     * 参数 bytes - 解码数据
     */
    public static func decodeStatic(bytes: Array<UInt8>): LinkedList<DataItem> 

    /*
     * 解码
     * 返回值 LinkedList<DataItem> - 解码后的 Cbor 类型集合
     */
    public func decode(): LinkedList<DataItem>

    /*
     * 流式解码
     * 返回值 dataItemListener - 解码后的 Cbor 类型集合
     */
    public func decode(dataItemListener: DataItemListener): Unit

    /*
     * 每次解码一条数据
     * 返回值 ?DataItem - 解码后的DataItem
     */
    public func decodeNext(): ?DataItem

    /*
     * 判断是否自动解码无限长度（无限制长度）的数组
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeInfinitiveArrays(): Bool

    /*
     * 设置是否自动解码无限长度（无限制长度）的数组
     * 参数 autoDecodeInfinitiveArrays - 设置值
     */
    public func setAutoDecodeInfinitiveArrays(autoDecodeInfinitiveArrays: Bool): Unit

    /*
     * 判断是否自动解码无限长度的映射（Map）
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeInfinitiveMaps(): Bool

    /*
     * 设置是否自动解码无限长度的映射（Map）
     * 参数 autoDecodeInfinitiveMaps - 设置值
     */
    public func setAutoDecodeInfinitiveMaps(autoDecodeInfinitiveMaps: Bool): Unit

    /*
     * 判断是否自动解码无限长度的字节串
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeInfinitiveByteStrings(): Bool

    /*
     * 设置是否自动解码无限长度的字节串
     * 参数 autoDecodeInfinitiveByteStrings - 设置值
     */
    public func setAutoDecodeInfinitiveByteStrings(autoDecodeInfinitiveByteStrings: Bool): Unit

    /*
     * 判断是否自动解码无限长度的 Unicode 字符串
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeInfinitiveUnicodeStrings(): Bool

    /*
     * 设置是否自动解码无限长度的 Unicode 字符串
     * 参数 autoDecodeInfinitiveUnicodeStrings - 设置值
     */
    public func setAutoDecodeInfinitiveUnicodeStrings(autoDecodeInfinitiveUnicodeStrings: Bool): Unit

    /*
     * 判断是否自动解码有理数
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeRationalNumbers(): Bool

    /*
     * 设置是否自动解码有理数
     * 参数 autoDecodeRationalNumbers - 设置值
     */
    public func setAutoDecodeRationalNumbers(autoDecodeRationalNumbers: Bool): Unit

    /*
     * 判断是否自动解码带有语言标签的字符串
     * 返回值 Bool - 判断结果
     */
    public func isAutoDecodeLanguageTaggedStrings(): Bool

    /*
     * 设置是否自动解码带有语言标签的字符串
     * 参数 autoDecodeLanguageTaggedStrings - 设置值
     */
    public func setAutoDecodeLanguageTaggedStrings(autoDecodeLanguageTaggedStrings: Bool): Unit

    /*
     * 判断在解析 CBOR 映射（Map）时是否拒绝包含重复键的映射
     * 返回值 Bool - 判断结果
     */
    public func isRejectDuplicateKeys(): Bool

    /*
     * 设置在解析 CBOR 映射（Map）时是否拒绝包含重复键的映射
     * 参数 rejectDuplicateKeys - 设置值
     */
    public func setRejectDuplicateKeys(rejectDuplicateKeys: Bool): Unit
}

public open class DataItem <: Hashable & Equatable<DataItem> {
    /*
     * 获取主类型
     * 参数 MajorType - 主类型
     */
    public func getMajorType(): MajorType

    /*
     * 设置标签
     * 参数 tag - 标签值
     */
    public func setTag(tag: Int32): Unit

    /*
     * 设置标签
     * 参数 tag - 标签值
     */
    public func setTag(tag: Tag): Unit

    /*
     * 移除标签
     */
    public func removeTag(): Unit

    /*
     * 获取标签
     * 参数 ?Tag - 标签值
     */
    public func getTag(): ?Tag

    /*
     * 判断是否存在标签
     * 返回值 Bool - 是否存在
     */
    public func hasTag(): Bool

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public open func equals(object: Object): Bool

    /*
     * 对象判等
     * 参数 rhs - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public operator func ==(rhs: DataItem): Bool

    /*
     * 对象判不等
     * 参数 rhs - 被对比的对象
     * 返回值 Bool - 是否不等
     */
    public operator func !=(rhs: DataItem): Bool

    /*
     * 计算哈希值
     * 返回值 Int64 - 哈希值
     */
    public open func hashCode(): Int64
}

public abstract class AbstractBuilder<T> {
    /*
     * 初始化
     * 参数 parent - 泛型值
     */
    public init(parent: ?T)
}

public abstract class AbstractDecoder<T> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder解码器
     * 参数 inputStream - 输入流
     */
    public init(decoder: ?CborDecoder, inputStream: InputStream)

    /*
     * 解码抽象接口
     * 参数 initialByte - 初始值
     * 返回值 T - 泛型值
     */
    public func decode(initialByte: Int32): T
}

public abstract class AbstractEncoder<T> {
    /*
     * 初始化
     * 参数 encoder - CborDecoder编码器
     * 参数 outputStream - 输出流
     */
    public init(encoder: ?CborEncoder, outputStream: OutputStream)

    /*
     * 编码抽象接口
     * 参数 dataItem - 泛型值
     */
    public open func encode(dataItem: T): Unit
}

public open class AbstractFloat <: Special {
    /*
     * 初始化
     * 参数 specialType - SpecialType类型
     * 参数 value - 存储值
     */
    public init(specialType: SpecialType, value: Float32)

    /*
     * 获取存储的值
     * 返回值 Float32 - 存储值
     */
    public func getValue(): Float32
    
    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class ArrayBuilder<T> <: AbstractBuilder<T> {
    /*
     * 初始化
     * 参数 parent - T
     * 参数 array - CborArray
     */
    public init(parent: T, array: CborArray)

    /*
     * 添加 DataItem 值
     * 参数 dataItem - DataItem值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(dataItem: DataItem): ArrayBuilder<T>

    /*
     * 添加 Int64 值
     * 参数 value - Int64值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(value: Int64): ArrayBuilder<T> 

    /*
     * 添加 Bool 值
     * 参数 value - Bool值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(value: Bool): ArrayBuilder<T>

    /*
     * 添加 Float32 值
     * 参数 value - Float32值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(value: Float32): ArrayBuilder<T>

    /*
     * 添加 Float64 值
     * 参数 value - Float64值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(value: Float64): ArrayBuilder<T>

    /*
     * 添加 Array<UInt8> 值
     * 参数 bytes - Array<UInt8>值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(bytes: Array<UInt8>): ArrayBuilder<T>

    /*
     * 添加 String 值
     * 参数 string - String值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(string: String): ArrayBuilder<T>

    /*
     * 添加 Array 值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func addArray(): ArrayBuilder<Object>

    /*
     * 添加 Array 值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func startArray(): ArrayBuilder<Object>

    /*
     * 添加 Map 值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func addMap(): MapBuilder<Object>

    /*
     * 添加 Map 值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func startMap(): MapBuilder<Object>

    /*
     * 结束添加Map或Array
     * 返回值 ?T - 添加后的对象
     */
    public func end(): ?T
}

public open class CborArray <: ChunkableDataItem {
    /*
     * 初始化
     */
    public init()

    /*
     * 添加 DataItem 类型元素
     * 参数 object - DataItem元素
     * 参数 CborArray - CborArray
     */
    public func add(object: DataItem): CborArray

    /*
     * 获取元素列表
     * 返回值 ArrayList<DataItem> - CborArray
     */
    public func getDataItems(): ArrayList<DataItem>

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class ByteStringBuilder<T> <: AbstractBuilder<T> where T <: AbstractBuilder<T> {
    /*
     * 初始化
     * 参数 parent - T
     */
    public init(parent: T)
    
    /*
     * 添加 Array<UInt8> 值
     * 参数 bytes - Array<UInt8>值
     * 返回值 ArrayBuilder<T> - 添加后的对象
     */
    public func add(bytes: Array<UInt8>): ByteStringBuilder<T>
    
    /*
     * 结束添加
     * 返回值 ?T - 添加后的对象
     */
    public func end(): ?T
}

public class ByteString <: ChunkableDataItem {
    /*
     * 初始化
     * 参数 bytes - ?Array<UInt8>
     */
    public init(bytes: ?Array<UInt8>)

    /*
     * 获取 Array<UInt8>
     * 返回值 ?Array<UInt8> - 获取的值
     */
    public func getBytes(): ?Array<UInt8>

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class CborBuilder <: AbstractBuilder<CborBuilder> {
    /*
     * 初始化
     */
    public init()

    /*
     * 重置
     * 返回值 CborBuilder - CborBuilder
     */
    public func reset(): CborBuilder

    /*
     * 创建
     * 返回值 LinkedList<DataItem> - LinkedList<DataItem>
     */
    public func build(): LinkedList<DataItem>

    /*
     * 添加 DataItem 类型元素
     * 参数 dataItem - DataItem值
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(dataItem: DataItem): CborBuilder

    /*
     * 添加 Int64 类型元素
     * 参数 value - Int64
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(value: Int64): CborBuilder

    /*
     * 添加 BigInt 类型元素
     * 参数 value - BigInt
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(value: BigInt): CborBuilder

    /*
     * 添加 Bool 类型元素
     * 参数 value - Bool
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(value: Bool): CborBuilder

    /*
     * 添加 Float32 类型元素
     * 参数 value - Float32
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(value: Float32): CborBuilder

    /*
     * 添加 Float64 类型元素
     * 参数 value - Float64
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(value: Float64): CborBuilder 

    /*
     * 添加 Array<UInt8> 类型元素
     * 参数 bytes - Array<UInt8>
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(bytes: Array<UInt8>): CborBuilder

    /*
     * 添加 ByteString 类型元素
     * 返回值 ByteStringBuilder<CborBuilder> - ByteStringBuilder<CborBuilder>
     */
    public func startByteString(): ByteStringBuilder<CborBuilder>

    /*
     * 添加 ByteString 类型元素
     * 参数 bytes - Array<UInt8>
     * 返回值 ByteStringBuilder<CborBuilder> - ByteStringBuilder<CborBuilder>
     */
    public func startByteString(bytes: ?Array<UInt8>): ByteStringBuilder<CborBuilder>

    /*
     * 添加 String 类型元素
     * 参数 string - String
     * 返回值 CborBuilder - 添加后的对象
     */
    public func add(string: String): CborBuilder

    /*
     * 添加 UnicodeString 类型元素
     * 返回值 UnicodeStringBuilder<CborBuilder> - UnicodeStringBuilder<CborBuilder>
     */
    public func startString(): UnicodeStringBuilder<CborBuilder>

    /*
     * 添加 String 类型元素
     * 参数 string - ?String
     * 返回值 UnicodeStringBuilder<CborBuilder> - UnicodeStringBuilder<CborBuilder>
     */
    public func startString(string: ?String): UnicodeStringBuilder<CborBuilder>

    /*
     * 添加Tag
     * 参数 value - Int64
     * 返回值 CborBuilder - CborBuilder
     */
    public func addTag(value: Int64): CborBuilder

    /*
     * 添加 Array 类型元素
     * 返回值 ArrayBuilder<CborBuilder> - ArrayBuilder<CborBuilder>
     */
    public func startArray(): ArrayBuilder<CborBuilder>

    /*
     * 添加 Array 类型元素
     * 返回值 ArrayBuilder<CborBuilder> - ArrayBuilder<CborBuilder>
     */
    public func addArray(): ArrayBuilder<CborBuilder>

    /*
     * 添加 Map 类型元素
     * 返回值 MapBuilder<CborBuilder> - MapBuilder<CborBuilder>
     */
    public func addMap(): MapBuilder<CborBuilder>

    /*
     * 添加 Map 类型元素
     * 返回值 MapBuilder<CborBuilder> - MapBuilder<CborBuilder>
     */
    public func startMap(): MapBuilder<CborBuilder>
}

public class CborException <: Exception {
    /*
     * 初始化
     * 参数 message - 异常信息
     */
    public init(message: String)

    /*
     * 初始化
     * 参数 Exception - 异常
     */
    public init(cause: Exception)

    /*
     * 初始化
     * 参数 message - 异常信息
     * 参数 Exception - 异常
     */
    public init(message: String, cause: Exception)

    /*
     * 转字符串
     * 返回值 String - 异常信息
     */
    public func toString(): String
}

public open class ChunkableDataItem <: DataItem {
    /*
     * 初始化
     * 参数 majorType - 主类型
     */
    public init(majorType: MajorType)
    
    /*
     * 检查数据或数据流是否是分块
     * 返回值 Bool - 是否分块
     */
    public func isChunked(): Bool
    
    /*
     * 设置数据或数据流是否是分块
     * 参数 Bool - 是否分块
     * 返回值 ChunkableDataItem - 返回ChunkableDataItem
     */
    public func setChunked(chunked: Bool): ChunkableDataItem

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public open func equals(object: Object): Bool
}

public interface DataItemListener {
    /*
     * 自定义处理
     * 参数 dataItem - DataItem
     */
    func onDataItem(dataItem: DataItem): Unit
}

public class DoublePrecisionFloat <: Special {
    /*
     * 初始化
     * 参数 value - Float64
     */
    public init(value: Float64)

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Float64

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class HalfPrecisionFloat <: AbstractFloat{
    /*
     * 初始化
     * 参数 value - Float32
     */
    public init(value: Float32)
}

public class LanguageTaggedString <: CborArray{
    /*
     * 初始化
     * 参数 language - String
     * 参数 string - String
     */
    public init(language: String, string: String)

    /*
     * 初始化
     * 参数 language - UnicodeString
     * 参数 string - UnicodeString
     */
    public init(language: UnicodeString, string: UnicodeString)

    /*
     * 获取 DataItem
     * 返回值 DataItem - DataItem
     */
    public func getLanguage(): DataItem 

    /*
     * 获取 DataItem
     * 返回值 DataItem - DataItem
     */
    public func getString(): DataItem
}

public class MapBuilder<T> <: AbstractBuilder<T> {
    /*
     * 初始化
     * 参数 parent - T
     * 参数 map - CborMap
     */
    public init(parent: T, map: CborMap)

    /*
     * 添加 <DataItem，DataItem> 键值对
     * 参数 key - DataItem
     * 参数 value - DataItem值
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: DataItem, value: DataItem): MapBuilder<T>

    /*
     * 添加 <Int64，Int64> 键值对
     * 参数 key - Int64
     * 参数 value - Int64
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: Int64): MapBuilder<T>

    /*
     * 添加 <Int64，Bool> 键值对
     * 参数 key - Int64
     * 参数 value - Bool
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: Bool): MapBuilder<T>

    /*
     * 添加 <Int64，Float32> 键值对
     * 参数 key - Int64
     * 参数 value - Float32
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: Float32): MapBuilder<T>

    /*
     * 添加 <Int64，Float64> 键值对
     * 参数 key - Int64
     * 参数 value - Float64
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: Float64): MapBuilder<T>

    /*
     * 添加 <Int64，Array<UInt8>> 键值对
     * 参数 key - Int64
     * 参数 value - Array<UInt8>
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: Array<UInt8>): MapBuilder<T>

    /*
     * 添加 <Int64，String> 键值对
     * 参数 key - Int64
     * 参数 value - String
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: Int64, value: String): MapBuilder<T>

    /*
     * 添加 <String，Int64> 键值对
     * 参数 key - String
     * 参数 value - Int64
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: Int64): MapBuilder<T> 

    /*
     * 添加 <String，Bool> 键值对
     * 参数 key - String
     * 参数 value - Bool
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: Bool): MapBuilder<T>

    /*
     * 添加 <String，Float32> 键值对
     * 参数 key - String
     * 参数 value - Float32
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: Float32): MapBuilder<T>

    /*
     * 添加 <String，Float64> 键值对
     * 参数 key - String
     * 参数 value - Float64
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: Float64): MapBuilder<T>

    /*
     * 添加 <String，Array<UInt8>> 键值对
     * 参数 key - String
     * 参数 value - Array<UInt8>
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: Array<UInt8>): MapBuilder<T>

    /*
     * 添加 <String，String> 键值对
     * 参数 key - String
     * 参数 value - String
     * 返回值 MapBuilder<T> - 添加后的对象
     */
    public func put(key: String, value: String): MapBuilder<T>

    /*
     * 添加 Array 键值
     * 参数 key - DataItem
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func putArray(key: DataItem): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Array 键值
     * 参数 key - Int64
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func putArray(key: Int64): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Array 键值
     * 参数 key - String
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func putArray(key: String): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Array 键值
     * 参数 key - DataItem
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func startArray(key: DataItem): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Array 键值
     * 参数 key - Int64
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func startArray(key: Int64): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Array 键值
     * 参数 key - String
     * 返回值 ArrayBuilder<MapBuilder<T>> - 添加后的对象
     */
    public func startArray(key: String): ArrayBuilder<MapBuilder<T>>

    /*
     * 添加 Map 键值
     * 参数 key - DataItem
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func putMap(key: DataItem): MapBuilder<Object>

    /*
     * 添加 Map 键值
     * 参数 key - Int64
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func putMap(key: Int64): MapBuilder<Object> 

    /*
     * 添加 Map 键值
     * 参数 key - String
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func putMap(key: String): MapBuilder<Object> 

    /*
     * 添加 Map 键值
     * 参数 key - DataItem
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func startMap(key: DataItem): MapBuilder<Object>

    /*
     * 添加 Map 键值
     * 参数 key - Int64
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func startMap(key: Int64): MapBuilder<Object> 

    /*
     * 添加 Map 键值
     * 参数 key - String
     * 返回值 MapBuilder<Object> - 添加后的对象
     */
    public func startMap(key: String): MapBuilder<Object>

    /*
     * 结束添加
     * 返回值 ?T - 添加后的对象
     */
    public func end(): ?T
}

public class CborMap <: ChunkableDataItem {
    /*
     * 初始化
     */
    public init()

    /*
     * 初始化
     * 参数 initialCapacity - 初始容量
     */
    public init(initialCapacity: Int32)

    /*
     * 存值
     * 参数 key - DataItem
     * 参数 value - DataItem
     * 返回值 CborMap - CborMap
     */
    public func put(key: DataItem, value: DataItem): CborMap

    /*
     * 取值
     * 参数 key - DataItem
     * 返回值 ?DataItem - ?DataItem
     */
    public func get(key: DataItem): ?DataItem

    /*
     * 删除值
     * 参数 key - DataItem
     * 返回值 ?DataItem - ?DataItem
     */
    public func remove(key: DataItem): ?DataItem

    /*
     * 获取key集合
     * 返回值 Collection<DataItem> - Collection<DataItem>
     */
    public func getKeys(): Collection<DataItem>

    /*
     * 获取value集合
     * 返回值 Collection<DataItem> - Collection<DataItem>
     */
    public func getValues(): Collection<DataItem>

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool

    /*
     * 计算哈希值
     * 返回值 Int64 - 哈希值
     */
    public override func hashCode(): Int64
}

public class NegativeInteger <: Number {
    /*
     * 初始化
     * 参数 value - Int64
     */
    public init(value: Int64)

    /*
     * 初始化
     * 参数 value - BigInt
     */
    public init(value: BigInt)
}

public abstract class Number <: DataItem {
    /*
     * 获取当前对象Value值
     * 返回值 BigInt - Value值
     */
    public func getValue(): BigInt

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class RationalNumber <: CborArray {
    /*
     * 初始化
     * 参数 numerator - Number
     * 参数 denominator - Number
     */
    public init(numerator: Number, denominator: Number)

    /*
     * 获取当前对象numerator值
     * 返回值 DataItem - numerator值
     */
    public func getNumerator(): DataItem

    /*
     * 获取当前对象denominator值
     * 返回值 DataItem - denominator值
     */
    public func getDenominator(): DataItem
}

public class SimpleValueType <: Enum<SimpleValueType> {
    public static let FALSE
    public static let TRUE
    public static let NULL
    public static let UNDEFINED
    public static let RESERVED
    public static let UNALLOCATED

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Int32

    /*
     * 根据数值获取对应SimpleValueType对象
     * 返回值 b - Int32值
     * 返回值 SimpleValueType - SimpleValueType对象
     */
    public static func ofByte(b: Int32): SimpleValueType
}

public class SimpleValue <: Special {
    public static let FALSE = SimpleValue(SimpleValueType.FALSE)
    public static let TRUE = SimpleValue(SimpleValueType.TRUE)
    public static let NULL = SimpleValue(SimpleValueType.NULL)
    public static let UNDEFINED = SimpleValue(SimpleValueType.UNDEFINED)

    /*
     * 初始化
     * 参数 simpleValueType - SimpleValueType值
     */
    public init(simpleValueType: SimpleValueType)

    /*
     * 初始化
     * 参数 value - Int32值
     */
    public init(value: Int32) {

    /*
     * 获取当前对象SimpleValueType值
     * 返回值 SimpleValueType - SimpleValueType值
     */
    public func getSimpleValueType(): SimpleValueType

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Int32

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class SinglePrecisionFloat <: AbstractFloat {
    /*
     * 初始化
     * 参数 value - Int32值
     */
    public init(value: Float32)
}

public class Tag <: DataItem {
    /*
     * 初始化
     * 参数 value - Int32值
     */
    public init(value: Int64)

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Int64

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override func equals(object: Object): Bool
}

public class UnicodeStringBuilder<T> <: AbstractBuilder<T> where T <: AbstractBuilder<T> {
    /*
     * 初始化
     * 参数 parent - T
     */
    public init(parent: T)

    /*
     * 添加 String 类型元素
     * 参数 string - String
     * 返回值 UnicodeStringBuilder<T> - 添加后的对象
     */
    public func add(string: String): UnicodeStringBuilder<T>

    /*
     * 结束添加
     * 返回值 ?T - 添加后的对象
     */
    public func end(): ?T
}

public class UnicodeString <: ChunkableDataItem {
    /*
     * 初始化
     * 参数 string - ?String
     */
    public init(string: ?String)

    /*
     * 转字符串
     * 返回值 String - 字符串
     */
    public func toString(): String

    /*
     * 获取存储的字符串
     * 返回值 ?String - 字符串
     */
    public func getString(): ?String

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public func equals(object: Object): Bool

    /*
     * 计算哈希值
     * 返回值 Int64 - 哈希值
     */
    public func hashCode(): Int64
}

public class UnsignedInteger <: Number {
    /*
     * 初始化
     * 参数 value - Int64值
     */
    public init(value: Int64)

    /*
     * 初始化
     * 参数 value - BigInt值
     */
    public init(value: BigInt)
}
```

##### 1.2 其他接口

```cangjie
public class AdditionalInformation <: Enum<AdditionalInformation>{
    public static let DIRECT
    public static let ONE_BYTE
    public static let TWO_BYTES
    public static let FOUR_BYTES
    public static let EIGHT_BYTES
    public static let RESERVED
    public static let INDEFINITE

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Int32

    /*
     * 根据数值获取对应AdditionalInformation对象
     * 返回值 b - Int32值
     * 返回值 AdditionalInformation - AdditionalInformation对象
     */
    public static func ofByte(b: Int32): AdditionalInformation
}

public class ArrayDecoder <: AbstractDecoder<CborArray> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * 数组类型解码
     * 参数 initialByte - 初始字节
     * 返回值 CborArray - 解码后的CborArray
     */
    public override func decode(initialByte: Int32): CborArray
}

public class ArrayEncoder <: AbstractEncoder<CborArray> {
    /*
     * 初始化
     * 参数 encoder - CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * 数组类型编码
     * 参数 array - 编码数据
     */
    public override func encode(array: CborArray): Unit 
}

public class ByteStringDecoder <: AbstractDecoder<ByteString> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * 字节编码字符串型解码
     * 参数 initialByte - 初始字节
     * 返回值 ByteString - 解码后的ByteString
     */
    public override func decode(initialByte: Int32): ByteString
}

public class ByteStringEncoder <: AbstractEncoder<ByteString> {
    /*
     * 初始化
     * 参数 encoder - CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * 字节编码字符串型编码
     * 参数 byteString - 编码数据类
     */
    public override func encode(byteString: ByteString): Unit
}

public class DoublePrecisionFloatDecoder <: AbstractDecoder<DoublePrecisionFloat> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder解码器
     * 参数 inputStream - 输入流
     */
    public init(decoder: ?CborDecoder, inputStream: InputStream)

    /*
     * 双精度浮点型解码，该接口入参是实现接口的约束，在该类型解码中无实际作用
     * 返回值 DoublePrecisionFloat - 解码后的DoublePrecisionFloat
     */
    public override func decode(_: Int32): DoublePrecisionFloat
}

public class DoublePrecisionFloatEncoder <: AbstractEncoder<DoublePrecisionFloat> {
    /*
     * 初始化
     * 参数 encoder - CborEncoder编码器
     * 参数 outputStream - 输出流
     */
    public init(encoder: ?CborEncoder, outputStream: OutputStream)

    /*
     * 双精度浮点型编码
     * 参数 dataItem - 编码数据类
     */
    public override func encode(dataItem: DoublePrecisionFloat): Unit
}

public class HalfPrecisionFloatDecoder <: AbstractDecoder<HalfPrecisionFloat> {
    /*
     * 初始化
     * 参数 decoder - ?CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: ?CborDecoder, inputStream: InputStream)

    /*
     * 半精度浮点型解码，该接口入参是实现接口的约束，在该类型解码中无实际作用
     * 返回值 HalfPrecisionFloat - 解码后的 HalfPrecisionFloat
     */
    public override func decode(_: Int32): HalfPrecisionFloat 
}

public open class HalfPrecisionFloatEncoder <: AbstractEncoder<HalfPrecisionFloat>{
    /*
     * 初始化
     * 参数 encoder - ?CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: ?CborEncoder, outputStream: OutputStream)

    /*
     * 半精度浮点型编码
     * 参数 dataItem - 编码数据类
     */
    public open func encode(dataItem: HalfPrecisionFloat): Unit

    /*
     * Float32转Int32
     * 参数 fval - Float32
     * 返回值 Int32 - 转换后的值
     */
    public static func fromFloat(fval: Float32): Int32
}

public class MajorType <: Enum<MajorType> {
    public static let INVALID
    public static let UNSIGNED_INTEGER
    public static let NEGATIVE_INTEGER
    public static let BYTE_STRING
    public static let UNICODE_STRING
    public static let ARRAY
    public static let MAP
    public static let TAG
    public static let SPECIAL

    /*
     * 获取当前对象Value值
     * 返回值 Int32 - Value值
     */
    public func getValue(): Int32

    /*
     * 根据数值获取对应MajorType对象
     * 返回值 b - Int32值
     * 返回值 MajorType - MajorType对象
     */
    public static func ofByte(b: Int32): MajorType 
}

public class MapDecoder <: AbstractDecoder<CborMap> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * Map 类型解码
     * 参数 initialByte - 初始字节
     * 返回值 ByteString - 解码后的ByteString
     */
    public override func decode(initialByte: Int32): CborMap
}

public class MapEncoder <: AbstractEncoder<CborMap> {
    /*
     * 初始化
     * 参数 encoder - CborDecoder编码器
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * Map 类型编码
     * 参数 map - CborMap
     */
    public override func encode(map: CborMap): Unit
}

public class NegativeIntegerDecoder <: AbstractDecoder<NegativeInteger> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * 正数类型解码
     * 参数 initialByte - 初始字节
     * 返回值 NegativeInteger - 解码后的NegativeInteger
     */
    public override func decode(initialByte: Int32): NegativeInteger
}

public class NegativeIntegerEncoder <: AbstractEncoder<NegativeInteger> {
    /*
     * 初始化
     * 参数 encoder - CborDecoder编码器
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * 正数类型编码
     * 参数 dataItem - 编码数据类
     */
    public override func encode(dataItem: NegativeInteger): Unit
}

public class SinglePrecisionFloatDecoder <: AbstractDecoder<SinglePrecisionFloat> {
    /*
     * 初始化
     * 参数 decoder - ?CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: ?CborDecoder, inputStream: InputStream)

    /*
     * 单精度浮点型解码，该接口入参是实现接口的约束，在该类型解码中无实际作用
     * 返回值 HalfPrecisionFloat - 解码后的 HalfPrecisionFloat
     */
    public override func decode(_: Int32): SinglePrecisionFloat
}

public class SinglePrecisionFloatEncoder <: AbstractEncoder<SinglePrecisionFloat> {
    /*
     * 初始化
     * 参数 encoder - ?CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: ?CborEncoder, outputStream: OutputStream)

    /*
     * 单精度浮点型编码
     * 参数 dataItem - 编码数据类
     */
    public func encode(dataItem: SinglePrecisionFloat): Unit
}

public class SpecialDecoder <: AbstractDecoder<Special> {
    /*
     * 初始化
     * 参数 decoder - ?CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: ?CborDecoder, inputStream: InputStream)

    /*
     * 特殊类型解码
     * 参数 initialByte - 初始字节
     * 返回值 NegativeInteger - 解码后的NegativeInteger
     */
    public override func decode(initialByte: Int32): Special
}

public class SpecialEncoder <: AbstractEncoder<Special> {
    /*
     * 初始化
     * 参数 encoder - ?CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: ?CborEncoder, outputStream: OutputStream)

    /*
     * 特殊类型解码
     * 参数 dataItem - 编码数据类
     */
    public override func encode(dataItem: Special): Unit
}

public open class Special <: DataItem {
    public static let BREAK

    /*
     * 获取SpecialType
     * 返回值 SpecialType - SpecialType
     */
    public func getSpecialType(): SpecialType

    /*
     * 对象判等
     * 参数 object - 被对比的对象
     * 返回值 Bool - 是否相等
     */
    public override open func equals(object: Object): Bool
}

public class SpecialType <: Enum<SpecialType> {
    public static let SIMPLE_VALUE
    public static let SIMPLE_VALUE_NEXT_BYTE
    public static let IEEE_754_HALF_PRECISION_FLOAT
    public static let IEEE_754_SINGLE_PRECISION_FLOAT
    public static let IEEE_754_DOUBLE_PRECISION_FLOAT
    public static let UNALLOCATED
    public static let BREAK

    /*
     * 根据数值获取对应SpecialType对象
     * 返回值 b - Int32值
     * 返回值 SpecialType - SpecialType对象
     */
    public static func ofByte(b: Int32): SpecialType
}

public class TagDecoder <: AbstractDecoder<Tag> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * Tag 类型解码
     * 参数 initialByte - 初始字节
     * 返回值 NegativeInteger - 解码后的NegativeInteger
     */
    public override func decode(initialByte: Int32): Tag
}

public class TagEncoder <: AbstractEncoder<Tag> {
    /*
     * 初始化
     * 参数 encoder - CborDecoder编码器
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)
    
    /*
     * Tag 类型编码
     * 参数 tag - Tag数据类
     */
    public override func encode(tag: Tag): Unit
}

public class UnicodeStringDecoder <: AbstractDecoder<UnicodeString> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * 字符串类型解码
     * 参数 initialByte - 初始字节
     * 返回值 UnicodeString - 解码后的UnicodeString
     */
    public override func decode(initialByte: Int32): UnicodeString
}

public class UnicodeStringEncoder <: AbstractEncoder<UnicodeString> {
    /*
     * 初始化
     * 参数 encoder - CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * 字符串类型编码
     * 参数 dataItem - 编码数据类
     */
    public override func encode(dataItem: UnicodeString): Unit
}

public class UnsignedIntegerDecoder <: AbstractDecoder<UnsignedInteger> {
    /*
     * 初始化
     * 参数 decoder - CborDecoder
     * 参数 inputStream - 输入流
     */
    public init(decoder: CborDecoder, inputStream: InputStream)

    /*
     * 无符号整数类型解码
     * 参数 initialByte - 初始字节
     * 返回值 UnsignedInteger - 解码后的UnsignedInteger
     */
    public override func decode(initialByte: Int32): UnsignedInteger
}

public class UnsignedIntegerEncoder <: AbstractEncoder<UnsignedInteger> {
    /*
     * 初始化
     * 参数 encoder - CborEncoder
     * 参数 outputStream - 输出流
     */
    public init(encoder: CborEncoder, outputStream: OutputStream)

    /*
     * 无符号整数类型编码
     * 参数 dataItem - 编码数据类
     */
    public override func encode(dataItem: UnsignedInteger): Unit
}
```

##### 1.3 示例代码

Map示例：
```cangjie
import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class MapBuilderTest {
    @TestCase
    public func testMapBuilder(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addMap().put(UnicodeString("key"), UnicodeString("value")).put(1, true).put(2,
            "value".toArray()).put(3, 1.0).put(4, 1.0).put(5, 1).put(6, "value").put("7", true).put("8",
            "value".toArray()).put("9", 1.0).put("10", 1.0).put("11", 1).put("12", "value").putMap(13).end().getOrThrow(
        )
        let dataItems2 = (((dataItems as MapBuilder<CborBuilder>).getOrThrow().putMap("14").end().getOrThrow()) as MapBuilder<CborBuilder>).
            getOrThrow().putMap(UnsignedInteger(15)).end().getOrThrow()
        let dataItems3 = (((dataItems2 as MapBuilder<CborBuilder>).getOrThrow().putArray(16).end().getOrThrow()) as MapBuilder<CborBuilder>).
            getOrThrow().putArray("17").end().getOrThrow()
        let dataItems4 = (((dataItems3 as MapBuilder<CborBuilder>).getOrThrow().putArray(UnsignedInteger(18)).end().
            getOrThrow()) as MapBuilder<CborBuilder>).getOrThrow().end().getOrThrow()
        let dataItems5 = (dataItems4 as CborBuilder).getOrThrow().startMap().startArray(1).end().getOrThrow().startArray(
            UnsignedInteger(2)).end().getOrThrow().end().getOrThrow().build()
        @Assert(2, dataItems5.size)
        @Assert((dataItems5.first.getOrThrow()) is CborMap)
        let map = (dataItems5.first.getOrThrow() as CborMap).getOrThrow()
        @Assert(19, map.getKeys().size)
    }
}
```

Array示例：
```cangjie
import std.unittest.*
import std.unittest.testmacro.*
import cbor4cj.*

@Test
public class ArrayBuilderTest {
    @TestCase
    public func shouldAddBool(): Unit {
        let builder = CborBuilder()
        let dataItems = builder.addArray().add(true).add(false).end().getOrThrow().build()
        @Assert(1, dataItems.size)
        @Assert(dataItems.first.getOrThrow() is CborArray)
        let array = (dataItems.first.getOrThrow() as CborArray).getOrThrow()
        @Assert(2, array.getDataItems().size)
        @Assert((array.getDataItems()[0]) is SimpleValue)
        @Assert((array.getDataItems()[1]) is SimpleValue)
    }
}
```