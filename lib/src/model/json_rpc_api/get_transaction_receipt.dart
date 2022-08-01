import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starknet/src/model/json_rpc_api/event.dart';
import 'package:starknet/src/model/json_rpc_api/json_rpc_api_error.dart';
import 'package:starknet/src/model/json_rpc_api/msg_to_l1.dart';
import 'package:starknet/src/model/json_rpc_api/msg_to_l2.dart';
import 'package:starknet/starknet.dart';

part 'get_transaction_receipt.freezed.dart';
part 'get_transaction_receipt.g.dart';

@freezed
class GetTransactionReceipt with _$GetTransactionReceipt {
  const factory GetTransactionReceipt.result({
    required TxnReceipt result,
  }) = GetTransactionReceiptResult;
  const factory GetTransactionReceipt.error({
    required JsonRpcApiError error,
  }) = GetTransactionReceiptError;

  factory GetTransactionReceipt.fromJson(Map<String, Object?> json) =>
      json.containsKey('error')
          ? GetTransactionReceiptError.fromJson(json)
          : GetTransactionReceiptResult.fromJson(json);
}

@freezed
class TxnReceipt with _$TxnReceipt {
  const factory TxnReceipt.invokeTxnReceipt({
    // start of COMMON_RECEIPT_PROPERTIES
    required StarknetFieldElement txnHash,
    required StarknetFieldElement actualFee,
    required String status,
    required String? statusData,
    required StarknetFieldElement? blockHash,
    required int? blockNumber,
    // end of COMMON_RECEIPT_PROPERTIES
    // start of INVOKE_TXN_RECEIPT_PROPERTIES
    required List<MsgToL1> messagesSent,
    required MsgToL2? l1OriginMessage,
    required List<Event> events,
    // end of INVOKE_TXN_RECEIPT_PROPERTIES
  }) = InvokeTxnReceipt;

  const factory TxnReceipt.declareTxnReceipt({
    // start of COMMON_RECEIPT_PROPERTIES
    required StarknetFieldElement txnHash,
    required StarknetFieldElement actualFee,
    required String status,
    required String? statusData,
    required StarknetFieldElement? blockHash,
    required int? blockNumber,
    // end of COMMON_RECEIPT_PROPERTIES
  }) = DeclareTxnReceipt;

  const factory TxnReceipt.deployTxnReceipt({
    // start of COMMON_RECEIPT_PROPERTIES
    required StarknetFieldElement txnHash,
    required StarknetFieldElement actualFee,
    required String status,
    required String? statusData,
    required StarknetFieldElement? blockHash,
    required int? blockNumber,
    // end of COMMON_RECEIPT_PROPERTIES
  }) = DeployTxnReceipt;

  const factory TxnReceipt.pendingInvokeTxnReceipt({
    // start of PENDING_COMMON_RECEIPT_PROPERTIES
    required StarknetFieldElement txnHash,
    required StarknetFieldElement actualFee,
    // end of PENDING_COMMON_RECEIPT_PROPERTIES
    // start of INVOKE_TXN_RECEIPT_PROPERTIES
    required List<MsgToL1> messagesSent,
    required MsgToL2? l1OriginMessage,
    required List<Event> events,
    // end of INVOKE_TXN_RECEIPT_PROPERTIES
  }) = PendingInvokeTxnReceipt;

  const factory TxnReceipt.pendingCommonReceiptProperties({
    required StarknetFieldElement txnHash,
    required StarknetFieldElement actualFee,
  }) = PendingCommonReceiptProperties;

  // TODO: Better way to classify json.
  factory TxnReceipt.fromJson(Map<String, Object?> json) =>
      json['status'] == 'PENDING'
          ? json.containsKey('messages_sent')
              ? PendingInvokeTxnReceipt.fromJson(json)
              : PendingCommonReceiptProperties.fromJson(json)
          : json.containsKey('events')
              ? InvokeTxnReceipt.fromJson(json)
              : DeclareTxnReceipt.fromJson(json);
}

// abstract class CommonReceiptProperties {
//   final StarknetFieldElement txnHash;
//   final StarknetFieldElement actualFee;
//   final String status;
//   final String? statusData;
//   final StarknetFieldElement blockHash;
//   final int blockNumber;
//
//   CommonReceiptProperties({
//     required this.txnHash,
//     required this.actualFee,
//     required this.status,
//     this.statusData,
//     required this.blockHash,
//     required this.blockNumber,
//   });
// }
//
// abstract class InvokeTxnReceiptProperties {
//   final List<MsgToL1> messagesSent;
//   final MsgToL2? l1OriginMessage;
//   final List<Event> events;
//   final int blockNumber;
//
//   InvokeTxnReceiptProperties({
//     required this.messagesSent,
//     this.l1OriginMessage,
//     required this.events,
//     required this.blockNumber,
//   });
// }
//
// class InvokeTxnReceipt
//     implements CommonReceiptProperties, InvokeTxnReceiptProperties {
//   @override
//   // TODO: implement actualFee
//   StarknetFieldElement get actualFee => throw UnimplementedError();
//
//   @override
//   // TODO: implement blockHash
//   StarknetFieldElement get blockHash => throw UnimplementedError();
//
//   @override
//   // TODO: implement blockNumber
//   int get blockNumber => throw UnimplementedError();
//
//   @override
//   // TODO: implement events
//   List<Event> get events => throw UnimplementedError();
//
//   @override
//   // TODO: implement l1OriginMessage
//   MsgToL2? get l1OriginMessage => throw UnimplementedError();
//
//   @override
//   // TODO: implement messagesSent
//   List<MsgToL1> get messagesSent => throw UnimplementedError();
//
//   @override
//   // TODO: implement status
//   String get status => throw UnimplementedError();
//
//   @override
//   // TODO: implement statusData
//   String? get statusData => throw UnimplementedError();
//
//   @override
//   // TODO: implement txnHash
//   StarknetFieldElement get txnHash => throw UnimplementedError();
// }