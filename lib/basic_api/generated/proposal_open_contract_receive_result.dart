import 'package:meta/meta.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';
/// Proposal open contract response model class
abstract class ProposalOpenContractResponseModel {
  /// Initializes
  ProposalOpenContractResponseModel({
    @required this.proposalOpenContract,
    @required this.subscription,
  });

  /// Latest price and other details for an open contract
  final ProposalOpenContract proposalOpenContract;

  /// For subscription requests only.
  final Subscription subscription;
}

/// Proposal open contract response class
class ProposalOpenContractResponse extends ProposalOpenContractResponseModel {
  /// Initializes
  ProposalOpenContractResponse({
    @required ProposalOpenContract proposalOpenContract,
    @required Subscription subscription,
  }) : super(
          proposalOpenContract: proposalOpenContract,
          subscription: subscription,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContractResponse.fromJson(
    Map<String, dynamic> proposalOpenContractJson,
    Map<String, dynamic> subscriptionJson,
  ) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContractJson == null
            ? null
            : ProposalOpenContract.fromJson(proposalOpenContractJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (proposalOpenContract != null) {
      resultMap['proposal_open_contract'] = proposalOpenContract.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ProposalOpenContractResponse copyWith({
    ProposalOpenContract proposalOpenContract,
    Subscription subscription,
  }) =>
      ProposalOpenContractResponse(
        proposalOpenContract: proposalOpenContract ?? this.proposalOpenContract,
        subscription: subscription ?? this.subscription,
      );
}

final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "open": StatusEnum.open,
  "sold": StatusEnum.sold,
  "won": StatusEnum.won,
  "lost": StatusEnum.lost,
  "cancelled": StatusEnum.cancelled,
  "null": StatusEnum._null,
};

/// status Enum
enum StatusEnum {
  open,
  sold,
  won,
  lost,
  cancelled,
  _null,
}
/// Proposal open contract model class
abstract class ProposalOpenContractModel {
  /// Initializes
  ProposalOpenContractModel({
    this.auditDetails,
    this.barrier,
    @required this.barrierCount,
    @required this.bidPrice,
    @required this.buyPrice,
    @required this.cancellation,
    this.commision,
    @required this.contractId,
    @required this.contractType,
    @required this.currency,
    @required this.currentSpot,
    @required this.currentSpotDisplayValue,
    @required this.currentSpotTime,
    @required this.dateExpiry,
    @required this.dateSettlement,
    @required this.dateStart,
    @required this.displayName,
    @required this.displayValue,
    this.entrySpot,
    this.entrySpotDisplayValue,
    @required this.entryTick,
    @required this.entryTickDisplayValue,
    @required this.entryTickTime,
    @required this.exitTick,
    @required this.exitTickDisplayValue,
    @required this.exitTickTime,
    @required this.highBarrier,
    @required this.id,
    @required this.isExpired,
    @required this.isForwardStarting,
    @required this.isIntraday,
    @required this.isPathDependent,
    @required this.isSettleable,
    @required this.isSold,
    @required this.isValidToCancel,
    @required this.isValidToSell,
    @required this.limitOrder,
    @required this.longcode,
    @required this.lowBarrier,
    @required this.multiplier,
    @required this.payout,
    @required this.profit,
    @required this.profitPercentage,
    @required this.purchaseTime,
    @required this.resetTime,
    @required this.sellPrice,
    @required this.sellSpot,
    @required this.sellSpotDisplayValue,
    @required this.sellSpotTime,
    this.sellTime,
    @required this.shortcode,
    this.status,
    @required this.tickCount,
    @required this.tickStream,
    @required this.transactionIds,
    @required this.underlying,
    @required this.validationError,
  });

  /// Tick details around contract start and end time.
  final AuditDetails auditDetails;

  /// Barrier of the contract (if any).
  final String barrier;

  /// The number of barriers a contract has.
  final double barrierCount;

  /// Price at which the contract could be sold back to the company.
  final double bidPrice;

  /// Price at which contract was purchased
  final double buyPrice;

  /// Contains information about contract cancellation option.
  final Cancellation cancellation;

  /// Commission in payout currency amount.
  final double commision;

  /// The internal contract identifier
  final int contractId;

  /// Contract type.
  final String contractType;

  /// The currency code of the contract.
  final String currency;

  /// Spot value if we have license to stream this symbol.
  final double currentSpot;

  /// Spot value with the correct precision if we have license to stream this symbol.
  final String currentSpotDisplayValue;

  /// The corresponding time of the current spot.
  final DateTime currentSpotTime;

  /// Expiry date (epoch) of the Contract. Please note that it is not applicable for tick trade contracts.
  final DateTime dateExpiry;

  /// Settlement date (epoch) of the contract.
  final DateTime dateSettlement;

  /// Start date (epoch) of the contract.
  final DateTime dateStart;

  /// Display name of underlying
  final String displayName;

  /// The `bid_price` with the correct precision
  final String displayValue;

  /// Same as `entry_tick`. For backwards compatibility.
  final double entrySpot;

  /// Same as `entry_tick_display_value`. For backwards compatibility.
  final String entrySpotDisplayValue;

  /// This is the entry spot of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final double entryTick;

  /// This is the entry spot with the correct precision of the contract. For contracts starting immediately it is the next tick after the start time. For forward-starting contracts it is the spot at the start time.
  final String entryTickDisplayValue;

  /// This is the epoch time of the entry tick.
  final DateTime entryTickTime;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final double exitTick;

  /// Exit tick can refer to the latest tick at the end time, the tick that fulfils the contract's winning or losing condition for path dependent contracts (Touch/No Touch and Stays Between/Goes Outside) or the tick at which the contract is sold before expiry.
  final String exitTickDisplayValue;

  /// This is the epoch time of the exit tick. Note that since certain instruments don't tick every second, the exit tick time may be a few seconds before the end time.
  final DateTime exitTickTime;

  /// High barrier of the contract (if any).
  final String highBarrier;

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;

  /// Whether the contract is expired or not.
  final bool isExpired;

  /// Whether the contract is forward-starting or not.
  final bool isForwardStarting;

  /// Whether the contract is an intraday contract.
  final bool isIntraday;

  /// Whether the contract expiry price will depend on the path of the market (e.g. One Touch contract).
  final bool isPathDependent;

  /// Whether the contract is settleable or not.
  final bool isSettleable;

  /// Whether the contract is sold or not.
  final bool isSold;

  /// Whether the contract can be cancelled.
  final bool isValidToCancel;

  /// Whether the contract can be sold back to the company.
  final bool isValidToSell;

  /// Orders are applicable to `MULTUP` and `MULTDOWN` contracts only.
  final LimitOrder limitOrder;

  /// Text description of the contract purchased, Example: Win payout if Volatility 100 Index is strictly higher than entry spot at 10 minutes after contract start time.
  final String longcode;

  /// Low barrier of the contract (if any).
  final String lowBarrier;

  /// [Only for lookback trades] Multiplier applies when calculating the final payoff for each type of lookback. e.g. (Exit spot - Lowest historical price) * multiplier = Payout
  final double multiplier;

  /// Payout value of the contract.
  final double payout;

  /// The latest bid price minus buy price.
  final double profit;

  /// Profit in percentage.
  final double profitPercentage;

  /// Epoch of purchase time, will be same as `date_start` for all contracts except forward starting contracts.
  final DateTime purchaseTime;

  /// [Only for reset trades] The epoch time of a barrier reset.
  final DateTime resetTime;

  /// Price at which contract was sold, only available when contract has been sold.
  final double sellPrice;

  /// Latest spot value at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final double sellSpot;

  /// Latest spot value with the correct precision at the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final String sellSpotDisplayValue;

  /// Epoch time of the sell spot. Note that since certain underlyings don't tick every second, the sell spot time may be a few seconds before the sell time. (only present for contracts already sold). Will no longer be supported in the next API release.
  final DateTime sellSpotTime;

  /// Epoch time of when the contract was sold (only present for contracts already sold)
  final DateTime sellTime;

  /// Coded description of the contract purchased.
  final String shortcode;

  /// Contract status. Will be `sold` if the contract was sold back before expiry, `won` if won and `lost` if lost at expiry. Otherwise will be `open`
  final StatusEnum status;

  /// Only for tick trades, number of ticks
  final int tickCount;

  /// Tick stream from entry to end time.
  final List<TickStreamItem> tickStream;

  /// Every contract has buy and sell transaction ids, i.e. when you purchase a contract we associate it with buy transaction id, and if contract is already sold we associate that with sell transaction id.
  final TransactionIds transactionIds;

  /// The underlying symbol code.
  final String underlying;

  /// Error message if validation fails
  final String validationError;
}

/// Proposal open contract class
class ProposalOpenContract extends ProposalOpenContractModel {
  /// Initializes
  ProposalOpenContract({
    AuditDetails auditDetails,
    String barrier,
    @required double barrierCount,
    @required double bidPrice,
    @required double buyPrice,
    @required Cancellation cancellation,
    double commision,
    @required int contractId,
    @required String contractType,
    @required String currency,
    @required double currentSpot,
    @required String currentSpotDisplayValue,
    @required DateTime currentSpotTime,
    @required DateTime dateExpiry,
    @required DateTime dateSettlement,
    @required DateTime dateStart,
    @required String displayName,
    @required String displayValue,
    double entrySpot,
    String entrySpotDisplayValue,
    @required double entryTick,
    @required String entryTickDisplayValue,
    @required DateTime entryTickTime,
    @required double exitTick,
    @required String exitTickDisplayValue,
    @required DateTime exitTickTime,
    @required String highBarrier,
    @required String id,
    @required bool isExpired,
    @required bool isForwardStarting,
    @required bool isIntraday,
    @required bool isPathDependent,
    @required bool isSettleable,
    @required bool isSold,
    @required bool isValidToCancel,
    @required bool isValidToSell,
    @required LimitOrder limitOrder,
    @required String longcode,
    @required String lowBarrier,
    @required double multiplier,
    @required double payout,
    @required double profit,
    @required double profitPercentage,
    @required DateTime purchaseTime,
    @required DateTime resetTime,
    @required double sellPrice,
    @required double sellSpot,
    @required String sellSpotDisplayValue,
    @required DateTime sellSpotTime,
    DateTime sellTime,
    @required String shortcode,
    StatusEnum status,
    @required int tickCount,
    @required List<TickStreamItem> tickStream,
    @required TransactionIds transactionIds,
    @required String underlying,
    @required String validationError,
  }) : super(
          auditDetails: auditDetails,
          barrier: barrier,
          barrierCount: barrierCount,
          bidPrice: bidPrice,
          buyPrice: buyPrice,
          cancellation: cancellation,
          commision: commision,
          contractId: contractId,
          contractType: contractType,
          currency: currency,
          currentSpot: currentSpot,
          currentSpotDisplayValue: currentSpotDisplayValue,
          currentSpotTime: currentSpotTime,
          dateExpiry: dateExpiry,
          dateSettlement: dateSettlement,
          dateStart: dateStart,
          displayName: displayName,
          displayValue: displayValue,
          entrySpot: entrySpot,
          entrySpotDisplayValue: entrySpotDisplayValue,
          entryTick: entryTick,
          entryTickDisplayValue: entryTickDisplayValue,
          entryTickTime: entryTickTime,
          exitTick: exitTick,
          exitTickDisplayValue: exitTickDisplayValue,
          exitTickTime: exitTickTime,
          highBarrier: highBarrier,
          id: id,
          isExpired: isExpired,
          isForwardStarting: isForwardStarting,
          isIntraday: isIntraday,
          isPathDependent: isPathDependent,
          isSettleable: isSettleable,
          isSold: isSold,
          isValidToCancel: isValidToCancel,
          isValidToSell: isValidToSell,
          limitOrder: limitOrder,
          longcode: longcode,
          lowBarrier: lowBarrier,
          multiplier: multiplier,
          payout: payout,
          profit: profit,
          profitPercentage: profitPercentage,
          purchaseTime: purchaseTime,
          resetTime: resetTime,
          sellPrice: sellPrice,
          sellSpot: sellSpot,
          sellSpotDisplayValue: sellSpotDisplayValue,
          sellSpotTime: sellSpotTime,
          sellTime: sellTime,
          shortcode: shortcode,
          status: status,
          tickCount: tickCount,
          tickStream: tickStream,
          transactionIds: transactionIds,
          underlying: underlying,
          validationError: validationError,
        );

  /// Creates an instance from JSON
  factory ProposalOpenContract.fromJson(Map<String, dynamic> json) =>
      ProposalOpenContract(
        auditDetails: json['audit_details'] == null
            ? null
            : AuditDetails.fromJson(json['audit_details']),
        barrier: json['barrier'],
        barrierCount: getDouble(json['barrier_count']),
        bidPrice: getDouble(json['bid_price']),
        buyPrice: getDouble(json['buy_price']),
        cancellation: json['cancellation'] == null
            ? null
            : Cancellation.fromJson(json['cancellation']),
        commision: getDouble(json['commision']),
        contractId: json['contract_id'],
        contractType: json['contract_type'],
        currency: json['currency'],
        currentSpot: getDouble(json['current_spot']),
        currentSpotDisplayValue: json['current_spot_display_value'],
        currentSpotTime: getDateTime(json['current_spot_time']),
        dateExpiry: getDateTime(json['date_expiry']),
        dateSettlement: getDateTime(json['date_settlement']),
        dateStart: getDateTime(json['date_start']),
        displayName: json['display_name'],
        displayValue: json['display_value'],
        entrySpot: getDouble(json['entry_spot']),
        entrySpotDisplayValue: json['entry_spot_display_value'],
        entryTick: getDouble(json['entry_tick']),
        entryTickDisplayValue: json['entry_tick_display_value'],
        entryTickTime: getDateTime(json['entry_tick_time']),
        exitTick: getDouble(json['exit_tick']),
        exitTickDisplayValue: json['exit_tick_display_value'],
        exitTickTime: getDateTime(json['exit_tick_time']),
        highBarrier: json['high_barrier'],
        id: json['id'],
        isExpired: getBool(json['is_expired']),
        isForwardStarting: getBool(json['is_forward_starting']),
        isIntraday: getBool(json['is_intraday']),
        isPathDependent: getBool(json['is_path_dependent']),
        isSettleable: getBool(json['is_settleable']),
        isSold: getBool(json['is_sold']),
        isValidToCancel: getBool(json['is_valid_to_cancel']),
        isValidToSell: getBool(json['is_valid_to_sell']),
        limitOrder: json['limit_order'] == null
            ? null
            : LimitOrder.fromJson(json['limit_order']),
        longcode: json['longcode'],
        lowBarrier: json['low_barrier'],
        multiplier: getDouble(json['multiplier']),
        payout: getDouble(json['payout']),
        profit: getDouble(json['profit']),
        profitPercentage: getDouble(json['profit_percentage']),
        purchaseTime: getDateTime(json['purchase_time']),
        resetTime: getDateTime(json['reset_time']),
        sellPrice: getDouble(json['sell_price']),
        sellSpot: getDouble(json['sell_spot']),
        sellSpotDisplayValue: json['sell_spot_display_value'],
        sellSpotTime: getDateTime(json['sell_spot_time']),
        sellTime: getDateTime(json['sell_time']),
        shortcode: json['shortcode'],
        status: statusEnumMapper[json['status']],
        tickCount: json['tick_count'],
        tickStream: json['tick_stream'] == null
            ? null
            : List<TickStreamItem>.from(json['tick_stream']
                .map((dynamic item) => TickStreamItem.fromJson(item))),
        transactionIds: json['transaction_ids'] == null
            ? null
            : TransactionIds.fromJson(json['transaction_ids']),
        underlying: json['underlying'],
        validationError: json['validation_error'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (auditDetails != null) {
      resultMap['audit_details'] = auditDetails.toJson();
    }
    resultMap['barrier'] = barrier;
    resultMap['barrier_count'] = barrierCount;
    resultMap['bid_price'] = bidPrice;
    resultMap['buy_price'] = buyPrice;
    if (cancellation != null) {
      resultMap['cancellation'] = cancellation.toJson();
    }
    resultMap['commision'] = commision;
    resultMap['contract_id'] = contractId;
    resultMap['contract_type'] = contractType;
    resultMap['currency'] = currency;
    resultMap['current_spot'] = currentSpot;
    resultMap['current_spot_display_value'] = currentSpotDisplayValue;
    resultMap['current_spot_time'] =
        getSecondsSinceEpochDateTime(currentSpotTime);
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);
    resultMap['date_settlement'] = getSecondsSinceEpochDateTime(dateSettlement);
    resultMap['date_start'] = getSecondsSinceEpochDateTime(dateStart);
    resultMap['display_name'] = displayName;
    resultMap['display_value'] = displayValue;
    resultMap['entry_spot'] = entrySpot;
    resultMap['entry_spot_display_value'] = entrySpotDisplayValue;
    resultMap['entry_tick'] = entryTick;
    resultMap['entry_tick_display_value'] = entryTickDisplayValue;
    resultMap['entry_tick_time'] = getSecondsSinceEpochDateTime(entryTickTime);
    resultMap['exit_tick'] = exitTick;
    resultMap['exit_tick_display_value'] = exitTickDisplayValue;
    resultMap['exit_tick_time'] = getSecondsSinceEpochDateTime(exitTickTime);
    resultMap['high_barrier'] = highBarrier;
    resultMap['id'] = id;
    resultMap['is_expired'] = isExpired;
    resultMap['is_forward_starting'] = isForwardStarting;
    resultMap['is_intraday'] = isIntraday;
    resultMap['is_path_dependent'] = isPathDependent;
    resultMap['is_settleable'] = isSettleable;
    resultMap['is_sold'] = isSold;
    resultMap['is_valid_to_cancel'] = isValidToCancel;
    resultMap['is_valid_to_sell'] = isValidToSell;
    if (limitOrder != null) {
      resultMap['limit_order'] = limitOrder.toJson();
    }
    resultMap['longcode'] = longcode;
    resultMap['low_barrier'] = lowBarrier;
    resultMap['multiplier'] = multiplier;
    resultMap['payout'] = payout;
    resultMap['profit'] = profit;
    resultMap['profit_percentage'] = profitPercentage;
    resultMap['purchase_time'] = getSecondsSinceEpochDateTime(purchaseTime);
    resultMap['reset_time'] = getSecondsSinceEpochDateTime(resetTime);
    resultMap['sell_price'] = sellPrice;
    resultMap['sell_spot'] = sellSpot;
    resultMap['sell_spot_display_value'] = sellSpotDisplayValue;
    resultMap['sell_spot_time'] = getSecondsSinceEpochDateTime(sellSpotTime);
    resultMap['sell_time'] = getSecondsSinceEpochDateTime(sellTime);
    resultMap['shortcode'] = shortcode;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere((entry) => entry.value == status, orElse: () => null)
        ?.key;
    resultMap['tick_count'] = tickCount;
    if (tickStream != null) {
      resultMap['tick_stream'] = tickStream
          .map<dynamic>((TickStreamItem item) => item.toJson())
          .toList();
    }
    if (transactionIds != null) {
      resultMap['transaction_ids'] = transactionIds.toJson();
    }
    resultMap['underlying'] = underlying;
    resultMap['validation_error'] = validationError;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ProposalOpenContract copyWith({
    AuditDetails auditDetails,
    String barrier,
    double barrierCount,
    double bidPrice,
    double buyPrice,
    Cancellation cancellation,
    double commision,
    int contractId,
    String contractType,
    String currency,
    double currentSpot,
    String currentSpotDisplayValue,
    DateTime currentSpotTime,
    DateTime dateExpiry,
    DateTime dateSettlement,
    DateTime dateStart,
    String displayName,
    String displayValue,
    double entrySpot,
    String entrySpotDisplayValue,
    double entryTick,
    String entryTickDisplayValue,
    DateTime entryTickTime,
    double exitTick,
    String exitTickDisplayValue,
    DateTime exitTickTime,
    String highBarrier,
    String id,
    bool isExpired,
    bool isForwardStarting,
    bool isIntraday,
    bool isPathDependent,
    bool isSettleable,
    bool isSold,
    bool isValidToCancel,
    bool isValidToSell,
    LimitOrder limitOrder,
    String longcode,
    String lowBarrier,
    double multiplier,
    double payout,
    double profit,
    double profitPercentage,
    DateTime purchaseTime,
    DateTime resetTime,
    double sellPrice,
    double sellSpot,
    String sellSpotDisplayValue,
    DateTime sellSpotTime,
    DateTime sellTime,
    String shortcode,
    StatusEnum status,
    int tickCount,
    List<TickStreamItem> tickStream,
    TransactionIds transactionIds,
    String underlying,
    String validationError,
  }) =>
      ProposalOpenContract(
        auditDetails: auditDetails ?? this.auditDetails,
        barrier: barrier ?? this.barrier,
        barrierCount: barrierCount ?? this.barrierCount,
        bidPrice: bidPrice ?? this.bidPrice,
        buyPrice: buyPrice ?? this.buyPrice,
        cancellation: cancellation ?? this.cancellation,
        commision: commision ?? this.commision,
        contractId: contractId ?? this.contractId,
        contractType: contractType ?? this.contractType,
        currency: currency ?? this.currency,
        currentSpot: currentSpot ?? this.currentSpot,
        currentSpotDisplayValue:
            currentSpotDisplayValue ?? this.currentSpotDisplayValue,
        currentSpotTime: currentSpotTime ?? this.currentSpotTime,
        dateExpiry: dateExpiry ?? this.dateExpiry,
        dateSettlement: dateSettlement ?? this.dateSettlement,
        dateStart: dateStart ?? this.dateStart,
        displayName: displayName ?? this.displayName,
        displayValue: displayValue ?? this.displayValue,
        entrySpot: entrySpot ?? this.entrySpot,
        entrySpotDisplayValue:
            entrySpotDisplayValue ?? this.entrySpotDisplayValue,
        entryTick: entryTick ?? this.entryTick,
        entryTickDisplayValue:
            entryTickDisplayValue ?? this.entryTickDisplayValue,
        entryTickTime: entryTickTime ?? this.entryTickTime,
        exitTick: exitTick ?? this.exitTick,
        exitTickDisplayValue: exitTickDisplayValue ?? this.exitTickDisplayValue,
        exitTickTime: exitTickTime ?? this.exitTickTime,
        highBarrier: highBarrier ?? this.highBarrier,
        id: id ?? this.id,
        isExpired: isExpired ?? this.isExpired,
        isForwardStarting: isForwardStarting ?? this.isForwardStarting,
        isIntraday: isIntraday ?? this.isIntraday,
        isPathDependent: isPathDependent ?? this.isPathDependent,
        isSettleable: isSettleable ?? this.isSettleable,
        isSold: isSold ?? this.isSold,
        isValidToCancel: isValidToCancel ?? this.isValidToCancel,
        isValidToSell: isValidToSell ?? this.isValidToSell,
        limitOrder: limitOrder ?? this.limitOrder,
        longcode: longcode ?? this.longcode,
        lowBarrier: lowBarrier ?? this.lowBarrier,
        multiplier: multiplier ?? this.multiplier,
        payout: payout ?? this.payout,
        profit: profit ?? this.profit,
        profitPercentage: profitPercentage ?? this.profitPercentage,
        purchaseTime: purchaseTime ?? this.purchaseTime,
        resetTime: resetTime ?? this.resetTime,
        sellPrice: sellPrice ?? this.sellPrice,
        sellSpot: sellSpot ?? this.sellSpot,
        sellSpotDisplayValue: sellSpotDisplayValue ?? this.sellSpotDisplayValue,
        sellSpotTime: sellSpotTime ?? this.sellSpotTime,
        sellTime: sellTime ?? this.sellTime,
        shortcode: shortcode ?? this.shortcode,
        status: status ?? this.status,
        tickCount: tickCount ?? this.tickCount,
        tickStream: tickStream ?? this.tickStream,
        transactionIds: transactionIds ?? this.transactionIds,
        underlying: underlying ?? this.underlying,
        validationError: validationError ?? this.validationError,
      );
}
/// Audit details model class
abstract class AuditDetailsModel {
  /// Initializes
  AuditDetailsModel({
    @required this.allTicks,
    @required this.contractEnd,
    @required this.contractStart,
  });

  /// Ticks for tick expiry contract from start time till expiry.
  final List<AllTicksItem> allTicks;

  /// Ticks around contract end time.
  final List<ContractEndItem> contractEnd;

  /// Ticks around contract start time.
  final List<ContractStartItem> contractStart;
}

/// Audit details class
class AuditDetails extends AuditDetailsModel {
  /// Initializes
  AuditDetails({
    @required List<AllTicksItem> allTicks,
    @required List<ContractEndItem> contractEnd,
    @required List<ContractStartItem> contractStart,
  }) : super(
          allTicks: allTicks,
          contractEnd: contractEnd,
          contractStart: contractStart,
        );

  /// Creates an instance from JSON
  factory AuditDetails.fromJson(Map<String, dynamic> json) => AuditDetails(
        allTicks: json['all_ticks'] == null
            ? null
            : List<AllTicksItem>.from(json['all_ticks']
                .map((dynamic item) => AllTicksItem.fromJson(item))),
        contractEnd: json['contract_end'] == null
            ? null
            : List<ContractEndItem>.from(json['contract_end']
                .map((dynamic item) => ContractEndItem.fromJson(item))),
        contractStart: json['contract_start'] == null
            ? null
            : List<ContractStartItem>.from(json['contract_start']
                .map((dynamic item) => ContractStartItem.fromJson(item))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (allTicks != null) {
      resultMap['all_ticks'] =
          allTicks.map<dynamic>((AllTicksItem item) => item.toJson()).toList();
    }
    if (contractEnd != null) {
      resultMap['contract_end'] = contractEnd
          .map<dynamic>((ContractEndItem item) => item.toJson())
          .toList();
    }
    if (contractStart != null) {
      resultMap['contract_start'] = contractStart
          .map<dynamic>((ContractStartItem item) => item.toJson())
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AuditDetails copyWith({
    List<AllTicksItem> allTicks,
    List<ContractEndItem> contractEnd,
    List<ContractStartItem> contractStart,
  }) =>
      AuditDetails(
        allTicks: allTicks ?? this.allTicks,
        contractEnd: contractEnd ?? this.contractEnd,
        contractStart: contractStart ?? this.contractStart,
      );
}
/// All ticks item model class
abstract class AllTicksItemModel {
  /// Initializes
  AllTicksItemModel({
    @required this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// A flag used to highlight the record in front-end applications.
  final String flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String name;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;
}

/// All ticks item class
class AllTicksItem extends AllTicksItemModel {
  /// Initializes
  AllTicksItem({
    @required DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON
  factory AllTicksItem.fromJson(Map<String, dynamic> json) => AllTicksItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  AllTicksItem copyWith({
    DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) =>
      AllTicksItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
/// Contract end item model class
abstract class ContractEndItemModel {
  /// Initializes
  ContractEndItemModel({
    @required this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// A flag used to highlight the record in front-end applications.
  final String flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String name;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;
}

/// Contract end item class
class ContractEndItem extends ContractEndItemModel {
  /// Initializes
  ContractEndItem({
    @required DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON
  factory ContractEndItem.fromJson(Map<String, dynamic> json) =>
      ContractEndItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ContractEndItem copyWith({
    DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) =>
      ContractEndItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
/// Contract start item model class
abstract class ContractStartItemModel {
  /// Initializes
  ContractStartItemModel({
    @required this.epoch,
    this.flag,
    this.name,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// A flag used to highlight the record in front-end applications.
  final String flag;

  /// A short description of the data. It could be a tick or a time associated with the contract.
  final String name;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;
}

/// Contract start item class
class ContractStartItem extends ContractStartItemModel {
  /// Initializes
  ContractStartItem({
    @required DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) : super(
          epoch: epoch,
          flag: flag,
          name: name,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON
  factory ContractStartItem.fromJson(Map<String, dynamic> json) =>
      ContractStartItem(
        epoch: getDateTime(json['epoch']),
        flag: json['flag'],
        name: json['name'],
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['flag'] = flag;
    resultMap['name'] = name;
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  ContractStartItem copyWith({
    DateTime epoch,
    String flag,
    String name,
    double tick,
    String tickDisplayValue,
  }) =>
      ContractStartItem(
        epoch: epoch ?? this.epoch,
        flag: flag ?? this.flag,
        name: name ?? this.name,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
/// Cancellation model class
abstract class CancellationModel {
  /// Initializes
  CancellationModel({
    @required this.askPrice,
    @required this.dateExpiry,
  });

  /// Ask price of contract cancellation option.
  final double askPrice;

  /// Expiry time in epoch for contract cancellation option.
  final DateTime dateExpiry;
}

/// Cancellation class
class Cancellation extends CancellationModel {
  /// Initializes
  Cancellation({
    @required double askPrice,
    @required DateTime dateExpiry,
  }) : super(
          askPrice: askPrice,
          dateExpiry: dateExpiry,
        );

  /// Creates an instance from JSON
  factory Cancellation.fromJson(Map<String, dynamic> json) => Cancellation(
        askPrice: getDouble(json['ask_price']),
        dateExpiry: getDateTime(json['date_expiry']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['ask_price'] = askPrice;
    resultMap['date_expiry'] = getSecondsSinceEpochDateTime(dateExpiry);

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Cancellation copyWith({
    double askPrice,
    DateTime dateExpiry,
  }) =>
      Cancellation(
        askPrice: askPrice ?? this.askPrice,
        dateExpiry: dateExpiry ?? this.dateExpiry,
      );
}
/// Limit order model class
abstract class LimitOrderModel {
  /// Initializes
  LimitOrderModel({
    @required this.stopLoss,
    @required this.stopOut,
    @required this.takeProfit,
  });

  /// Contains information where the contract will be closed automatically at the loss specified by the user.
  final StopLoss stopLoss;

  /// Contains information where the contract will be closed automatically when the value of the contract is close to zero. This is set by the us.
  final StopOut stopOut;

  /// Contain information where the contract will be closed automatically at the profit specified by the user.
  final TakeProfit takeProfit;
}

/// Limit order class
class LimitOrder extends LimitOrderModel {
  /// Initializes
  LimitOrder({
    @required StopLoss stopLoss,
    @required StopOut stopOut,
    @required TakeProfit takeProfit,
  }) : super(
          stopLoss: stopLoss,
          stopOut: stopOut,
          takeProfit: takeProfit,
        );

  /// Creates an instance from JSON
  factory LimitOrder.fromJson(Map<String, dynamic> json) => LimitOrder(
        stopLoss: json['stop_loss'] == null
            ? null
            : StopLoss.fromJson(json['stop_loss']),
        stopOut: json['stop_out'] == null
            ? null
            : StopOut.fromJson(json['stop_out']),
        takeProfit: json['take_profit'] == null
            ? null
            : TakeProfit.fromJson(json['take_profit']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (stopLoss != null) {
      resultMap['stop_loss'] = stopLoss.toJson();
    }
    if (stopOut != null) {
      resultMap['stop_out'] = stopOut.toJson();
    }
    if (takeProfit != null) {
      resultMap['take_profit'] = takeProfit.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  LimitOrder copyWith({
    StopLoss stopLoss,
    StopOut stopOut,
    TakeProfit takeProfit,
  }) =>
      LimitOrder(
        stopLoss: stopLoss ?? this.stopLoss,
        stopOut: stopOut ?? this.stopOut,
        takeProfit: takeProfit ?? this.takeProfit,
      );
}
/// Stop loss model class
abstract class StopLossModel {
  /// Initializes
  StopLossModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Stop loss amount
  final double orderAmount;

  /// Stop loss order epoch
  final DateTime orderDate;

  /// Pip-sized barrier value
  final String value;
}

/// Stop loss class
class StopLoss extends StopLossModel {
  /// Initializes
  StopLoss({
    @required String displayName,
    double orderAmount,
    @required DateTime orderDate,
    String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopLoss.fromJson(Map<String, dynamic> json) => StopLoss(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  StopLoss copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      StopLoss(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Stop out model class
abstract class StopOutModel {
  /// Initializes
  StopOutModel({
    @required this.displayName,
    @required this.orderAmount,
    @required this.orderDate,
    @required this.value,
  });

  /// Localized display name
  final String displayName;

  /// Stop out amount
  final double orderAmount;

  /// Stop out order epoch
  final DateTime orderDate;

  /// Pip-sized barrier value
  final String value;
}

/// Stop out class
class StopOut extends StopOutModel {
  /// Initializes
  StopOut({
    @required String displayName,
    @required double orderAmount,
    @required DateTime orderDate,
    @required String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory StopOut.fromJson(Map<String, dynamic> json) => StopOut(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  StopOut copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      StopOut(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Take profit model class
abstract class TakeProfitModel {
  /// Initializes
  TakeProfitModel({
    @required this.displayName,
    this.orderAmount,
    @required this.orderDate,
    this.value,
  });

  /// Localized display name
  final String displayName;

  /// Take profit amount
  final double orderAmount;

  /// Take profit order epoch
  final DateTime orderDate;

  /// Pip-sized barrier value
  final String value;
}

/// Take profit class
class TakeProfit extends TakeProfitModel {
  /// Initializes
  TakeProfit({
    @required String displayName,
    double orderAmount,
    @required DateTime orderDate,
    String value,
  }) : super(
          displayName: displayName,
          orderAmount: orderAmount,
          orderDate: orderDate,
          value: value,
        );

  /// Creates an instance from JSON
  factory TakeProfit.fromJson(Map<String, dynamic> json) => TakeProfit(
        displayName: json['display_name'],
        orderAmount: getDouble(json['order_amount']),
        orderDate: getDateTime(json['order_date']),
        value: json['value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['order_amount'] = orderAmount;
    resultMap['order_date'] = getSecondsSinceEpochDateTime(orderDate);
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TakeProfit copyWith({
    String displayName,
    double orderAmount,
    DateTime orderDate,
    String value,
  }) =>
      TakeProfit(
        displayName: displayName ?? this.displayName,
        orderAmount: orderAmount ?? this.orderAmount,
        orderDate: orderDate ?? this.orderDate,
        value: value ?? this.value,
      );
}
/// Tick stream item model class
abstract class TickStreamItemModel {
  /// Initializes
  TickStreamItemModel({
    @required this.epoch,
    this.tick,
    this.tickDisplayValue,
  });

  /// Epoch time of a tick or the contract start or end time.
  final DateTime epoch;

  /// The spot value at the given epoch.
  final double tick;

  /// The spot value with the correct precision at the given epoch.
  final String tickDisplayValue;
}

/// Tick stream item class
class TickStreamItem extends TickStreamItemModel {
  /// Initializes
  TickStreamItem({
    @required DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) : super(
          epoch: epoch,
          tick: tick,
          tickDisplayValue: tickDisplayValue,
        );

  /// Creates an instance from JSON
  factory TickStreamItem.fromJson(Map<String, dynamic> json) => TickStreamItem(
        epoch: getDateTime(json['epoch']),
        tick: getDouble(json['tick']),
        tickDisplayValue: json['tick_display_value'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['epoch'] = getSecondsSinceEpochDateTime(epoch);
    resultMap['tick'] = tick;
    resultMap['tick_display_value'] = tickDisplayValue;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TickStreamItem copyWith({
    DateTime epoch,
    double tick,
    String tickDisplayValue,
  }) =>
      TickStreamItem(
        epoch: epoch ?? this.epoch,
        tick: tick ?? this.tick,
        tickDisplayValue: tickDisplayValue ?? this.tickDisplayValue,
      );
}
/// Transaction ids model class
abstract class TransactionIdsModel {
  /// Initializes
  TransactionIdsModel({
    @required this.buy,
    @required this.sell,
  });

  /// Buy transaction ID for that contract
  final int buy;

  /// Sell transaction ID for that contract, only present when contract is already sold.
  final int sell;
}

/// Transaction ids class
class TransactionIds extends TransactionIdsModel {
  /// Initializes
  TransactionIds({
    @required int buy,
    @required int sell,
  }) : super(
          buy: buy,
          sell: sell,
        );

  /// Creates an instance from JSON
  factory TransactionIds.fromJson(Map<String, dynamic> json) => TransactionIds(
        buy: json['buy'],
        sell: json['sell'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['buy'] = buy;
    resultMap['sell'] = sell;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  TransactionIds copyWith({
    int buy,
    int sell,
  }) =>
      TransactionIds(
        buy: buy ?? this.buy,
        sell: sell ?? this.sell,
      );
}
/// Subscription model class
abstract class SubscriptionModel {
  /// Initializes
  SubscriptionModel({
    @required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class
class Subscription extends SubscriptionModel {
  /// Initializes
  Subscription({
    @required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters
  Subscription copyWith({
    String id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
