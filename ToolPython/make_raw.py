
from web3 import Web3, HTTPProvider


def sendTransaction(_from, _to, privateKey, data):
    signed_txn = web3.eth.account.signTransaction(dict(
       # nonce=web3.eth.getTransactionCount(_from),
        nonce=8,
        gasPrice=11,
        gas=21000,
        to=_to,
        value=10,
        data=data,
        chainId=15665883188 # 修改为自己的chain id
    ), privateKey)
    _rawTransaction=signed_txn.rawTransaction
    print('_rawTransaction is '+_rawTransaction.hex())
    signed = web3.eth.sendRawTransaction(signed_txn.rawTransaction)
    print("signed is "+signed.hex())

if __name__ == '__main__':
    web3 = Web3(HTTPProvider('http://192.168.116.128:8545')) # 修改为对应节点
    _from2 = web3.toChecksumAddress('0X2DFB1E33C2E793E3C1F64A89B54758E307D5E7E3')
    _from=_from2
    _to2 = web3.toChecksumAddress('0x5fee883711112f99304ad7e3ae4b0c01229232a5')
    _to=_to2
    _privateKey='aff3b2adc09fabdca882fa2b0a69f79528976589575f51bf36b15e3d952d4b70'
    byteCode = ''
    if web3.isConnected():
        print("gas price is "+str(web3.eth.gasPrice))
        print("Heco RPC Conntect Success")
        sendTransaction(_from,_to,_privateKey,byteCode)
    else : 
        print(" RPC Conntect Failure")