from random import paretovariate
import time
import requests
from web3 import Web3, HTTPProvider


def sendTransaction(_from, _to, privateKey, data):
    signed_txn = web3.eth.account.signTransaction(dict(
        nonce=web3.eth.getTransactionCount(_from),
        gasPrice=0,
        gas=8000000,
        to=_to,
        value=0,
        data=data,
        chainId=101 # 修改为自己的chain id
    ), privateKey)
    _rawTransaction=signed_txn.rawTransaction
    print('_rawTransaction is '+_rawTransaction.hex())
    signed = web3.eth.sendRawTransaction(signed_txn.rawTransaction)
    print("signed is "+signed.hex())
    



if __name__ == '__main__':
    web3 = Web3(HTTPProvider('http://192.168.116.128:22000')) # 修改为对应节点
    _from='0xa5b84c055bb01f9eDA99B3C537cdA1595B34624f'
    _to=''
    _privateKey='807998cafcbe44245f2b5f1887564a95a7a2ea2f423f7b83fef6510419112046'
    byteCode = ''
    if web3.isConnected():
        print("gas price is "+str(web3.eth.gasPrice))
        print("Heco RPC Conntect Success")
        sendTransaction(_from,_to,_privateKey,byteCode)
    else : 
        print(" RPC Conntect Failure")
