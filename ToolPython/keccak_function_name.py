from Crypto.Hash import keccak



#begin1(address) 方法格式 为方法加参数类型（如果有入参） 无 就begin1()

def keccakTest():
    keccak_hash = keccak.new(digest_bits=256)
    keccak_hash.update(b'begin1(address)')
    print(keccak_hash.hexdigest())
    print(keccak_hash.hexdigest()[0:8])
    
if __name__ == "__main__":
    
    keccakTest()
    