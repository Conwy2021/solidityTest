/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */
import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import type { PromiseOrValue } from "../common";
import type { Test3, Test3Interface } from "../Test3";

const _abi = [
  {
    inputs: [],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [],
    name: "a",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "array",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "num",
        type: "uint256",
      },
    ],
    name: "test",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    name: "voters",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];

const _bytecode =
  "0x60806040526040518060600160405280600060ff168152602001600160ff168152602001600260ff1681525060029060036200003d929190620000a1565b503480156200004b57600080fd5b506040518060400160405280600581526020017f68656c6c6f0000000000000000000000000000000000000000000000000000008152506000908162000092919062000391565b50603260018190555062000478565b828054828255906000526020600020908101928215620000e5579160200282015b82811115620000e4578251829060ff16905591602001919060010190620000c2565b5b509050620000f49190620000f8565b5090565b5b8082111562000113576000816000905550600101620000f9565b5090565b600081519050919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b600060028204905060018216806200019957607f821691505b602082108103620001af57620001ae62000151565b5b50919050565b60008190508160005260206000209050919050565b60006020601f8301049050919050565b600082821b905092915050565b600060088302620002197fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82620001da565b620002258683620001da565b95508019841693508086168417925050509392505050565b6000819050919050565b6000819050919050565b6000620002726200026c62000266846200023d565b62000247565b6200023d565b9050919050565b6000819050919050565b6200028e8362000251565b620002a66200029d8262000279565b848454620001e7565b825550505050565b600090565b620002bd620002ae565b620002ca81848462000283565b505050565b5b81811015620002f257620002e6600082620002b3565b600181019050620002d0565b5050565b601f82111562000341576200030b81620001b5565b6200031684620001ca565b8101602085101562000326578190505b6200033e6200033585620001ca565b830182620002cf565b50505b505050565b600082821c905092915050565b6000620003666000198460080262000346565b1980831691505092915050565b600062000381838362000353565b9150826002028217905092915050565b6200039c8262000117565b67ffffffffffffffff811115620003b857620003b762000122565b5b620003c4825462000180565b620003d1828285620002f6565b600060209050601f831160018114620004095760008415620003f4578287015190505b62000400858262000373565b86555062000470565b601f1984166200041986620001b5565b60005b8281101562000443578489015182556001820191506020850194506020810190506200041c565b868310156200046357848901516200045f601f89168262000353565b8355505b6001600288020188555050505b505050505050565b61068780620004886000396000f3fe608060405234801561001057600080fd5b506004361061004c5760003560e01c80630dbe671f1461005157806329e99f071461006f57806338d941931461009f57806353fa2e64146100cf575b600080fd5b6100596100ff565b6040516100669190610344565b60405180910390f35b610089600480360381019061008491906103b0565b61018d565b60405161009691906103ec565b60405180910390f35b6100b960048036038101906100b491906103b0565b6101da565b6040516100c691906103ec565b60405180910390f35b6100e960048036038101906100e4919061053c565b6101fe565b6040516100f69190610344565b60405180910390f35b6000805461010c906105b4565b80601f0160208091040260200160405190810160405280929190818152602001828054610138906105b4565b80156101855780601f1061015a57610100808354040283529160200191610185565b820191906000526020600020905b81548152906001019060200180831161016857829003601f168201915b505050505081565b6000600582116101d2576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016101c990610631565b60405180910390fd5b819050919050565b600281815481106101ea57600080fd5b906000526020600020016000915090505481565b6003818051602081018201805184825260208301602085012081835280955050505050506000915090508054610233906105b4565b80601f016020809104026020016040519081016040528092919081815260200182805461025f906105b4565b80156102ac5780601f10610281576101008083540402835291602001916102ac565b820191906000526020600020905b81548152906001019060200180831161028f57829003601f168201915b505050505081565b600081519050919050565b600082825260208201905092915050565b60005b838110156102ee5780820151818401526020810190506102d3565b60008484015250505050565b6000601f19601f8301169050919050565b6000610316826102b4565b61032081856102bf565b93506103308185602086016102d0565b610339816102fa565b840191505092915050565b6000602082019050818103600083015261035e818461030b565b905092915050565b6000604051905090565b600080fd5b600080fd5b6000819050919050565b61038d8161037a565b811461039857600080fd5b50565b6000813590506103aa81610384565b92915050565b6000602082840312156103c6576103c5610370565b5b60006103d48482850161039b565b91505092915050565b6103e68161037a565b82525050565b600060208201905061040160008301846103dd565b92915050565b600080fd5b600080fd5b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b610449826102fa565b810181811067ffffffffffffffff8211171561046857610467610411565b5b80604052505050565b600061047b610366565b90506104878282610440565b919050565b600067ffffffffffffffff8211156104a7576104a6610411565b5b6104b0826102fa565b9050602081019050919050565b82818337600083830152505050565b60006104df6104da8461048c565b610471565b9050828152602081018484840111156104fb576104fa61040c565b5b6105068482856104bd565b509392505050565b600082601f83011261052357610522610407565b5b81356105338482602086016104cc565b91505092915050565b60006020828403121561055257610551610370565b5b600082013567ffffffffffffffff8111156105705761056f610375565b5b61057c8482850161050e565b91505092915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052602260045260246000fd5b600060028204905060018216806105cc57607f821691505b6020821081036105df576105de610585565b5b50919050565b7f6572726f72000000000000000000000000000000000000000000000000000000600082015250565b600061061b6005836102bf565b9150610626826105e5565b602082019050919050565b6000602082019050818103600083015261064a8161060e565b905091905056fea2646970667358221220b9e038c81ac25ed28144a9cd404d99746596064848a667adc0022e1ea3e1717c64736f6c63430008110033";

type Test3ConstructorParams =
  | [signer?: Signer]
  | ConstructorParameters<typeof ContractFactory>;

const isSuperArgs = (
  xs: Test3ConstructorParams
): xs is ConstructorParameters<typeof ContractFactory> => xs.length > 1;

export class Test3__factory extends ContractFactory {
  constructor(...args: Test3ConstructorParams) {
    if (isSuperArgs(args)) {
      super(...args);
    } else {
      super(_abi, _bytecode, args[0]);
    }
  }

  override deploy(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): Promise<Test3> {
    return super.deploy(overrides || {}) as Promise<Test3>;
  }
  override getDeployTransaction(
    overrides?: Overrides & { from?: PromiseOrValue<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  override attach(address: string): Test3 {
    return super.attach(address) as Test3;
  }
  override connect(signer: Signer): Test3__factory {
    return super.connect(signer) as Test3__factory;
  }

  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): Test3Interface {
    return new utils.Interface(_abi) as Test3Interface;
  }
  static connect(address: string, signerOrProvider: Signer | Provider): Test3 {
    return new Contract(address, _abi, signerOrProvider) as Test3;
  }
}