const { keccak256, ecsign,isValidPrivate,privateToPublic,toBuffer} = require('ethereumjs-util')

const privKey = Buffer.alloc(32, '503f38a9c967ed597e47fe25643985f032b072db8075426a92110f82df48dfcb', 'hex')
const pubKey = privateToPublic(privKey)
console.log("privKey",privKey.toString('hex'))
console.log("pubKey",pubKey.toString('hex'))
//检查私钥是否满足曲线secp256k1的规则。
console.log(isValidPrivate(privKey))

const sign = (msgHash, privKey) => {
  if (typeof msgHash === 'string' && msgHash.slice(0, 2) === '0x') {
    msgHash = Buffer.alloc(32, msgHash.slice(2), 'hex')
  }
 const sig = ecsign(msgHash, privKey)
  return `0x${sig.r.toString('hex')}${sig.s.toString('hex')}${sig.v.toString(16)}`
}



// var aa = keccak256(1,"no1", "0x2Bf4c84F9d5EACe1C306e1d6dc898efd1cAb452C");
// console.log(aa.to);

const hash = "0xee27fc7058465d4f49bd0f111098c2d80f3a25dfecd98cc783e5788044a4a4bc"

const sig = sign(hash, privKey)

console.log('keccak256("hash"): ' + hash)
console.log('signature: ' + sig)



