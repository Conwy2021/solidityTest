from base64 import b32encode
import hashlib

from Crypto.Hash import keccak

def printTest():
    print('Hello World!')


def hash3():
    sha3=hashlib.sha3_256()#与Keccak256 不是一个函数
    sha3.update(b'0')
    
    print(sha3.hexdigest())

def keccakTest():
    keccak_hash = keccak.new(digest_bits=256)
    #keccak_hash.update(b'0')#044852b2a670ade5407e78fb2863c51de9fcb96542a07186fe3aeda6bb8a116d
    keccak_hash.update(b'a')
    print(keccak_hash.hexdigest())
    
def keccakTest2():
    keccak_hash = keccak.new(digest_bits=256)
    result = bytes('a', 'utf-8').zfill(64)
    print(result)
    keccak_hash.update(result)
    print(keccak_hash.hexdigest())
if __name__ == "__main__":
    #hash3()
    keccakTest()
    keccakTest2()