import 'package:json_annotation/json_annotation.dart';

part 'verify_receipt_response.g.dart';

@JsonSerializable()
class VerifyReceiptResponse {
  /// Either 0 if the receipt is valid, or a status code if there is an error.
  /// The status code reflects the status of the app receipt as a whole.
  /// See status for possible status codes and descriptions.
  final int status;

  /// The environment for which the receipt was generated.
  /// Possible values: Sandbox, Production
  final String? environment;

  /// An indicator that an error occurred during the request. A value of 1
  /// indicates a temporary issue; retry validation for this receipt at a later
  /// time. A value of 0 indicates an unresolvable issue; do not retry
  /// validation for this receipt. Only applicable to status codes 21100-21199.
  @JsonKey(name: 'is-retryable')
  final bool? isRetryable;

  /// A JSON representation of the receipt that was sent for verification.
  final Receipt? receipt;

  /// An array that contains all in-app purchase transactions. This excludes
  /// transactions for consumable products that have been marked as finished by
  /// your app. Only returned for receipts that contain auto-renewable
  /// subscriptions.
  @JsonKey(name: 'latest_receipt_info')
  final List<ReceiptInfo>? latestReceiptInfo;

  /// The latest Base64 encoded app receipt. Only returned for receipts that
  /// contain auto-renewable subscriptions.
  @JsonKey(name: 'latest_receipt')
  final String? latestReceipt;

  /// In the JSON file, an array where each element contains the pending renewal
  /// information for each auto-renewable subscription identified by the
  /// product_id. Only returned for app receipts that contain auto-renewable
  /// subscriptions.
  @JsonKey(name: 'pending_renewal_info')
  final List<PendingRenewalInfo>? pendingRenewalInfo;

  VerifyReceiptResponse(
      {required this.status,
      required this.environment,
      this.isRetryable,
      this.receipt,
      this.latestReceiptInfo,
      this.latestReceipt,
      this.pendingRenewalInfo});

  Map<String, dynamic> toJson() => _$VerifyReceiptResponseToJson(this);

  factory VerifyReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyReceiptResponseFromJson(json);

  @override
  String toString() {
    return 'VerifyReceiptResponse{status: $status, environment: $environment, '
        'receipt: $receipt, latestReceiptInfo: $latestReceiptInfo, '
        'latestReceipt: $latestReceipt, '
        'pendingRenewalInfo: $pendingRenewalInfo}';
  }
}

@JsonSerializable()
class Receipt {
  @JsonKey(name: 'receipt_type')
  final String? receiptType;

  @JsonKey(name: 'adam_id')
  final int? adamId;

  /// Generated by App Store Connect and used by the App Store to uniquely identify
  /// the app purchased. Apps are assigned this identifier only in production.
  /// Treat this value as a 64-bit long integer.
  @JsonKey(name: 'app_item_id')
  final int? appItemId;

  /// The bundle identifier for the app to which the receipt belongs. You
  /// provide this string on App Store Connect. This corresponds to the value of
  /// CFBundleIdentifier in the Info.plist file of the app.
  @JsonKey(name: 'bundle_id')
  final String? bundleId;

  /// The app’s version number. The app's version number corresponds to the value
  /// of CFBundleVersion (in iOS) or CFBundleShortVersionString (in macOS) in
  /// the Info.plist. In production, this value is the current version of the
  /// app on the device based on the receipt_creation_date_ms. In the sandbox,
  /// the value is always "1.0".
  @JsonKey(name: 'application_version')
  final String? applicationVersion;

  /// A unique identifier for the app download transaction.
  @JsonKey(name: 'download_id')
  final int? downloadId;

  /// An arbitrary number that identifies a revision of your app. In the sandbox,
  /// this key's value is “0”.
  @JsonKey(name: 'version_external_identifier')
  final int? versionExternalIdentifier;

  /// The time the App Store generated the receipt, in a date-time format
  /// similar to ISO 8601.
  @JsonKey(name: 'receipt_creation_date')
  final String? receiptCreationDate;

  /// The time the App Store generated the receipt, in UNIX epoch time format,
  /// in milliseconds. Use this time format for processing dates. This value
  /// does not change.
  @JsonKey(name: 'receipt_creation_date_ms')
  final String? receiptCreationDateMs;

  /// The time the user ordered the app available for pre-order, in the
  /// Pacific Time zone.
  @JsonKey(name: 'receipt_creation_date_pst')
  final String? receiptCreationDatePst;

  /// The time the request to the verifyReceipt endpoint was processed and the
  /// response was generated, in a date-time format similar to ISO 8601.
  @JsonKey(name: 'request_date')
  final String? requestDate;

  /// The time the request to the verifyReceipt endpoint was processed and the
  /// response was generated, in UNIX epoch time format, in milliseconds. Use
  /// this time format for processing dates.
  @JsonKey(name: 'request_date_ms')
  final String? requestDateMs;

  /// The time the request to the verifyReceipt endpoint was processed and the
  /// response was generated, in the Pacific Time zone.
  @JsonKey(name: 'request_date_pst')
  final String? requestDatePst;

  /// The time of the original app purchase, in a date-time format similar to
  /// ISO 8601.
  @JsonKey(name: 'original_purchase_date')
  final String? originalPurchaseDate;

  /// The time of the original app purchase, in UNIX epoch time format, in
  /// milliseconds. Use this time format for processing dates.
  @JsonKey(name: 'original_purchase_date_ms')
  final String? originalPurchaseDateMs;

  /// The time of the original app purchase, in the Pacific Time zone.
  @JsonKey(name: 'original_purchase_date_pst')
  final String? originalPurchaseDatePst;

  /// The version of the app that the user originally purchased. This value does
  /// not change, and corresponds to the value of CFBundleVersion (in iOS) or
  /// CFBundleShortVersionString (in macOS) in the Info.plist file of the
  /// original purchase. In the sandbox environment, the value is always "1.0".
  @JsonKey(name: 'original_application_version')
  final String? originalApplicationVersion;

  /// An array that contains the in-app purchase receipt fields for all in-app
  /// purchase transactions.
  @JsonKey(name: 'in_app')
  final List<ReceiptInfo>? inApp;

  Receipt(
      {this.receiptType,
      this.adamId,
      this.appItemId,
      this.bundleId,
      this.applicationVersion,
      this.downloadId,
      this.versionExternalIdentifier,
      this.receiptCreationDate,
      this.receiptCreationDateMs,
      this.receiptCreationDatePst,
      this.requestDate,
      this.requestDateMs,
      this.requestDatePst,
      this.originalPurchaseDate,
      this.originalPurchaseDateMs,
      this.originalPurchaseDatePst,
      this.originalApplicationVersion,
      this.inApp});

  Map<String, dynamic> toJson() => _$ReceiptToJson(this);

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  @override
  String toString() {
    return 'Receipt{receiptType: $receiptType, adamId: $adamId, appItemId: '
        '$appItemId, bundleId: $bundleId, applicationVersion: '
        '$applicationVersion, downloadId: $downloadId, '
        'versionExternalIdentifier: $versionExternalIdentifier, '
        'receiptCreationDate: $receiptCreationDate, receiptCreationDateMs: '
        '$receiptCreationDateMs, receiptCreationDatePst: '
        '$receiptCreationDatePst, requestDate: $requestDate, requestDateMs: '
        '$requestDateMs, requestDatePst: $requestDatePst, originalPurchaseDate:'
        ' $originalPurchaseDate, originalPurchaseDateMs: '
        '$originalPurchaseDateMs, originalPurchaseDatePst: '
        '$originalPurchaseDatePst, originalApplicationVersion: '
        '$originalApplicationVersion, inApp: $inApp}';
  }
}

@JsonSerializable()
class ReceiptInfo {
  /// The time the App Store refunded a transaction or revoked it from family
  /// sharing, in a date-time format similar to the ISO 8601.
  /// This field is present only for refunded or revoked transactions.
  @JsonKey(name: 'cancellation_date')
  final String? cancellationDate;

  /// The time the App Store refunded a transaction or revoked it from family
  /// sharing, in UNIX epoch time format, in milliseconds. This field
  /// is present only for refunded or revoked transactions. Use this time
  /// format for processing dates. See cancellation_date_ms for more information.
  @JsonKey(name: 'cancellation_date_ms')
  final String? cancellationDateMs;

  /// The time the App Store refunded a transaction or revoked it from family
  /// sharing, in the Pacific Time zone. This field is present only for refunded
  /// or revoked transactions.
  @JsonKey(name: 'cancellation_date_pst')
  final String? cancellationDatePst;

  /// The reason for a refunded or revoked transaction. A value of “1” indicates
  /// that the customer canceled their transaction due to an actual or perceived
  /// issue within your app. A value of “0” indicates that the transaction was
  /// canceled for another reason; for example, if the customer made the purchase
  /// accidentally.
  @JsonKey(name: 'cancellation_reason')
  final String? cancellationReason;

  /// The number of consumable products purchased. This value corresponds to the
  /// quantity property of the SKPayment object stored in the transaction's
  /// payment property. The value is usually “1” unless modified with a mutable
  /// payment. The maximum value is 10.
  final String? quantity;

  /// The unique identifier of the product purchased. You provide this value when
  /// creating the product in App Store Connect, and it corresponds to the
  /// productIdentifier property of the SKPayment object stored in the
  /// transaction's payment property.
  @JsonKey(name: 'product_id')
  final String? productId;

  /// A unique identifier for a transaction such as a purchase, restore, or
  /// renewal. See transaction_id for more information.
  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  /// The transaction identifier of the original purchase. See
  /// original_transaction_id for more information.
  @JsonKey(name: 'original_transaction_id')
  final String? originalTransactionId;

  /// The time the App Store charged the user's account for a purchased or
  /// restored product, or the time the App Store charged the user’s account
  /// for a subscription purchase or renewal after a lapse, in a date-time
  /// format similar to ISO 8601.
  @JsonKey(name: 'purchase_date')
  final String? purchaseDate;

  /// For consumable, non-consumable, and non-renewing subscription products,
  /// the time the App Store charged the user's account for a purchased or
  /// restored product, in the UNIX epoch time format, in milliseconds. For
  /// auto-renewable subscriptions, the time the App Store charged the user’s
  /// account for a subscription purchase or renewal after a lapse, in the UNIX
  /// epoch time format, in milliseconds. Use this time format for processing dates.
  @JsonKey(name: 'purchase_date_ms')
  final String? purchaseDateMs;

  /// The time the App Store charged the user's account for a purchased or restored
  /// product, or the time the App Store charged the user’s account for a subscription
  /// purchase or renewal after a lapse, in the Pacific Time zone.
  @JsonKey(name: 'purchase_date_pst')
  final String? purchaseDatePst;

  /// The time of the original in-app purchase, in a date-time format similar to
  /// ISO 8601.
  @JsonKey(name: 'original_purchase_date')
  final String? originalPurchaseDate;

  /// The time of the original in-app purchase, in UNIX epoch time format, in
  /// milliseconds. For an auto-renewable subscription, this value indicates the
  /// date of the subscription's initial purchase. The original purchase date
  /// applies to all product types and remains the same in all transactions for
  /// the same product ID. This value corresponds to the original transaction’s
  /// transactionDate property in StoreKit. Use this time format for processing
  /// dates.
  @JsonKey(name: 'original_purchase_date_ms')
  final String? originalPurchaseDateMs;

  /// The time of the original in-app purchase, in the Pacific Time zone.
  @JsonKey(name: 'original_purchase_date_pst')
  final String? originalPurchaseDatePst;

  /// The time a subscription expires or when it will renew, in a date-time
  /// format similar to the ISO 8601.
  @JsonKey(name: 'expires_date')
  final String? expiresDate;

  /// The time a subscription expires or when it will renew, in UNIX epoch time
  /// format, in milliseconds. Use this time format for processing dates.
  /// See expires_date_ms for more information.
  @JsonKey(name: 'expires_date_ms')
  final String? expiresDateMs;

  /// The time a subscription expires or when it will renew, in the Pacific
  /// Time zone.
  @JsonKey(name: 'expires_date_pst')
  final String? expiresDatePst;

  /// A unique identifier for purchase events across devices, including
  /// subscription-renewal events. This value is the primary key for identifying
  /// subscription purchases.
  @JsonKey(name: 'web_order_line_item_id')
  final String? webOrderLineItemId;

  /// An indication of whether a subscription is in the free trial period.
  /// See is_trial_period for more information.
  @JsonKey(name: 'is_trial_period')
  final String? isTrialPeriod;

  /// An indicator of whether an auto-renewable subscription is in the introductory
  /// price period. See is_in_intro_offer_period for more information.
  @JsonKey(name: 'is_in_intro_offer_period')
  final String? isInIntroOfferPeriod;

  @JsonKey(name: 'in_app_ownership_type')
  final String? inAppOwnershipType;

  @JsonKey(name: 'subscription_group_identifier')
  final String? subscriptionGroupIdentifier;

  ReceiptInfo({
    this.cancellationDate,
    this.cancellationDateMs,
    this.cancellationDatePst,
    this.cancellationReason,
    this.quantity,
    this.productId,
    this.transactionId,
    this.originalTransactionId,
    this.purchaseDate,
    this.purchaseDateMs,
    this.purchaseDatePst,
    this.originalPurchaseDate,
    this.originalPurchaseDateMs,
    this.originalPurchaseDatePst,
    this.expiresDate,
    this.expiresDateMs,
    this.expiresDatePst,
    this.webOrderLineItemId,
    this.isTrialPeriod,
    this.isInIntroOfferPeriod,
    this.inAppOwnershipType,
    this.subscriptionGroupIdentifier,
  });

  Map<String, dynamic> toJson() => _$ReceiptInfoToJson(this);

  factory ReceiptInfo.fromJson(Map<String, dynamic> json) =>
      _$ReceiptInfoFromJson(json);

  @override
  String toString() {
    return 'ReceiptInfo{cancellationDate: $cancellationDate, '
        'cancellationDateMs: $cancellationDateMs, cancellationDatePst: '
        '$cancellationDatePst, cancellationReason: $cancellationReason, '
        'quantity: $quantity, productId: $productId, transactionId: '
        '$transactionId, originalTransactionId: $originalTransactionId, '
        'purchaseDate: $purchaseDate, purchaseDateMs: $purchaseDateMs, '
        'purchaseDatePst: $purchaseDatePst, originalPurchaseDate: '
        '$originalPurchaseDate, originalPurchaseDateMs: '
        '$originalPurchaseDateMs, originalPurchaseDatePst: '
        '$originalPurchaseDatePst, expiresDate: $expiresDate, expiresDateMs: '
        '$expiresDateMs, expiresDatePst: $expiresDatePst, webOrderLineItemId: '
        '$webOrderLineItemId, isTrialPeriod: $isTrialPeriod, '
        'isInIntroOfferPeriod: $isInIntroOfferPeriod, inAppOwnershipType: '
        '$inAppOwnershipType, subscriptionGroupIdentifier:'
        ' $subscriptionGroupIdentifier}';
  }
}

@JsonSerializable()
class PendingRenewalInfo {
  /// The reason a subscription expired. This field is only present for a receipt
  /// that contains an expired auto-renewable subscription.
  @JsonKey(name: 'expiration_intent')
  final String? expirationIntent;

  /// The time at which the grace period for subscription renewals expires, in a
  /// date-time format similar to the ISO 8601.
  @JsonKey(name: 'grace_period_expires_date')
  final String? gracePeriodExpiresDate;

  /// The time at which the grace period for subscription renewals expires, in
  /// UNIX epoch time format, in milliseconds. This key is only present for apps
  /// that have Billing Grace Period enabled and when the user experiences a
  /// billing error at the time of renewal. Use this time format for processing dates.
  @JsonKey(name: 'grace_period_expires_date_ms')
  final String? gracePeriodExpiresDateMs;

  /// The time at which the grace period for subscription renewals expires, in
  /// the Pacific Time zone.
  @JsonKey(name: 'grace_period_expires_date_pst')
  final String? gracePeriodExpiresDatePst;

  /// The value for this key corresponds to the productIdentifier property of
  /// the product that the customer’s subscription renews.
  @JsonKey(name: 'auto_renew_product_id')
  final String? autoRenewProductId;

  /// A flag that indicates Apple is attempting to renew an expired subscription
  /// automatically. This field is only present if an auto-renewable subscription
  /// is in the billing retry state. See is_in_billing_retry_period for more
  /// information.
  @JsonKey(name: 'is_in_billing_retry_period')
  final String? isInBillingRetryPeriod;

  /// The reference name of a subscription offer that you configured in App Store
  /// Connect. This field is present when a customer redeemed a subscription
  /// offer code. For more information, see offer_code_ref_name.
  @JsonKey(name: 'offer_code_ref_name')
  final String? offerCodeRefName;

  /// The unique identifier of the product purchased. You provide this value
  /// when creating the product in App Store Connect, and it corresponds to the
  /// productIdentifier property of the SKPayment object stored in the
  /// transaction's payment property.
  @JsonKey(name: 'product_id')
  final String? productId;

  /// The transaction identifier of the original purchase.
  @JsonKey(name: 'original_transaction_id')
  final String? originalTransactionId;

  /// The price consent status for a subscription price increase. This field is
  /// only present if the customer was notified of the price increase. The
  /// default value is "0" and changes to "1" if the customer consents.
  @JsonKey(name: 'price_consent_status')
  final String? priceConsentStatus;

  /// The identifier of the promotional offer for an auto-renewable subscription
  /// that the user redeemed. You provide this value in the Promotional Offer
  /// Identifier field when you create the promotional offer in App Store Connect.
  @JsonKey(name: 'promotional_offer_id')
  final String? promotionalOfferId;

  /// The current renewal status for the auto-renewable subscription. See
  /// auto_renew_status for more information.
  @JsonKey(name: 'auto_renew_status')
  final String? autoRenewStatus;

  PendingRenewalInfo(
      {this.expirationIntent,
      this.gracePeriodExpiresDate,
      this.gracePeriodExpiresDateMs,
      this.gracePeriodExpiresDatePst,
      this.autoRenewProductId,
      this.isInBillingRetryPeriod,
      this.offerCodeRefName,
      this.productId,
      this.originalTransactionId,
      this.priceConsentStatus,
      this.promotionalOfferId,
      this.autoRenewStatus});

  Map<String, dynamic> toJson() => _$PendingRenewalInfoToJson(this);

  factory PendingRenewalInfo.fromJson(Map<String, dynamic> json) =>
      _$PendingRenewalInfoFromJson(json);

  @override
  String toString() {
    return 'PendingRenewalInfo{expirationIntent: $expirationIntent, '
        'gracePeriodExpiresDate: $gracePeriodExpiresDate, '
        'gracePeriodExpiresDateMs: $gracePeriodExpiresDateMs, '
        'gracePeriodExpiresDatePst: $gracePeriodExpiresDatePst, '
        'autoRenewProductId: $autoRenewProductId, isInBillingRetryPeriod: '
        '$isInBillingRetryPeriod, offerCodeRefName: $offerCodeRefName, '
        'productId: $productId, originalTransactionId: $originalTransactionId,'
        ' priceConsentStatus: $priceConsentStatus, promotionalOfferId:'
        ' $promotionalOfferId, autoRenewStatus: $autoRenewStatus}';
  }
}
