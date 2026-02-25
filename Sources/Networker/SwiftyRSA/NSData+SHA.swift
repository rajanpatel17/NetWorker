import Foundation
import CommonCrypto

extension NSData {
    @objc func swiftyRSASHA1() -> NSData {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(bytes, CC_LONG(length), &digest)
        return NSData(bytes: digest, length: digest.count)
    }
    
    @objc func swiftyRSASHA224() -> NSData {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA224_DIGEST_LENGTH))
        CC_SHA224(bytes, CC_LONG(length), &digest)
        return NSData(bytes: digest, length: digest.count)
    }
    
    @objc func swiftyRSASHA256() -> NSData {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(bytes, CC_LONG(length), &digest)
        return NSData(bytes: digest, length: digest.count)
    }
    
    @objc func swiftyRSASHA384() -> NSData {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA384_DIGEST_LENGTH))
        CC_SHA384(bytes, CC_LONG(length), &digest)
        return NSData(bytes: digest, length: digest.count)
    }
    
    @objc func swiftyRSASHA512() -> NSData {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        CC_SHA512(bytes, CC_LONG(length), &digest)
        return NSData(bytes: digest, length: digest.count)
    }
}
