import 'package:starknet/starknet.dart';

final privateKey = Felt.fromHexString("0x7b7eac4d9b868119ad7222a40948552");
final publicKey = Felt.fromHexString(
    "0x745bb9fb15490dd9d9767dff6a0477790f59d8f52e3525adb74927596c549d4");
final accountAddress = Felt.fromHexString(
    "0x156f74a2136c893c61df343a68f1f893857f3ca6454b89688b02ef6a0fba8b8");

// starknet --gateway_url http://127.0.0.1:5050/gateway --feeder_gateway_url http://127.0.0.1:5050/feeder_gateway deploy --contract ./assets/compiled_contracts/erc20.json --no_wallet

void main() async {
  final provider = JsonRpcProvider(nodeUri: devnetUri);

  final signer = Signer(privateKey: privateKey);

  final account = Account(
      provider: provider,
      signer: signer,
      accountAddress: accountAddress,
      chainId: StarknetChainId.testNet);

  final response = await account.execute([
    FunctionCall(
        contractAddress: Felt.fromHexString(
            "0x04f030401f550a49926808a87464aae3cb2e0ec88ae98f3078e4aa5dc45f808a"),
        entryPointSelector: getSelectorByName("mint"),
        calldata: [Felt.fromInt(1)])
  ]);
  print(response);
}
