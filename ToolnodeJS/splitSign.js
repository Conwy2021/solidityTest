const ethUtils = require("ethereumjs-util")

var hash = "0xee27fc7058465d4f49bd0f111098c2d80f3a25dfecd98cc783e5788044a4a4bc"
var privKey1 = "0x503f38a9c967ed597e47fe25643985f032b072db8075426a92110f82df48dfcb" //注意这里前面有0x
var sig = ethUtils.ecsign(ethUtils.toBuffer(hash), ethUtils.toBuffer(privKey1))

console.log(sig.hash)

console.log(sig.r.toString('hex'))
console.log(sig.s.toString('hex'))
console.log(sig.v.toString())