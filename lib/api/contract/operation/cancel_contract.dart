import 'package:flutter_deriv_api/api/contract/models/cancel_contract_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'exceptions/contract_operations_exception.dart';

/// Cancel contract class
class CancelContract extends CancelContractModel {
  /// Initializes
  CancelContract({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) : super(
          balanceAfter: balanceAfter,
          contractId: contractId,
          referenceId: referenceId,
          soldFor: soldFor,
          transactionId: transactionId,
        );

  /// Creates an instance from JSON
  factory CancelContract.fromJson(Map<String, dynamic> json) => CancelContract(
        balanceAfter: json['balance_after']?.toDouble(),
        contractId: json['contract_id'],
        referenceId: json['reference_id'],
        soldFor: json['sold_for']?.toDouble(),
        transactionId: json['transaction_id'],
      );

  /// API instance
  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Cancel a contract with parameters specified in [CancelRequest]
  static Future<CancelContract> cancelContract(CancelRequest request) async {
    final CancelResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw ContractOperationException(message: response.error['message']);
    }

    return CancelContract.fromJson(response.cancel);
  }

  /// Creates a copy of instance with given parameters
  CancelContract copyWith({
    double balanceAfter,
    int contractId,
    int referenceId,
    double soldFor,
    int transactionId,
  }) =>
      CancelContract(
        balanceAfter: balanceAfter ?? this.balanceAfter,
        contractId: contractId ?? this.contractId,
        referenceId: referenceId ?? this.referenceId,
        soldFor: soldFor ?? this.soldFor,
        transactionId: transactionId ?? this.transactionId,
      );
}
