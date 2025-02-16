/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/change_email_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Change email request class.
class ChangeEmailRequest extends Request {
  /// Initialize ChangeEmailRequest.
  const ChangeEmailRequest({
    required this.changeEmail,
    required this.newEmail,
    this.newPassword,
    required this.verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'change_email',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ChangeEmailRequest.fromJson(Map<String, dynamic> json) =>
      ChangeEmailRequest(
        changeEmail: json['change_email'] as String?,
        newEmail: json['new_email'] as String?,
        newPassword: json['new_password'] as String?,
        verificationCode: json['verification_code'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `verify` or `update`.
  final String? changeEmail;

  /// Email address to be verified.
  final String? newEmail;

  /// [Optional] New password (Accepts any printable ASCII character. Must be within 8-25 characters, and include numbers, lowercase and uppercase letters. Must not be the same as the user's email address)
  final String? newPassword;

  /// Email verification code (received from a `verify_email` call, which must be done first)
  final String? verificationCode;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'change_email': changeEmail,
        'new_email': newEmail,
        'new_password': newPassword,
        'verification_code': verificationCode,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ChangeEmailRequest copyWith({
    String? changeEmail,
    String? newEmail,
    String? newPassword,
    String? verificationCode,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ChangeEmailRequest(
        changeEmail: changeEmail ?? this.changeEmail,
        newEmail: newEmail ?? this.newEmail,
        newPassword: newPassword ?? this.newPassword,
        verificationCode: verificationCode ?? this.verificationCode,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
