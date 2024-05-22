// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/src/features/mobile/kkiapay.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i4;

class Routes {
  static const kKiaPay = '/k-kia-pay';

  static const all = <String>{kKiaPay};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.kKiaPay,
      page: _i2.KKiaPay,
    )
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.KKiaPay: (data) {
      final args = data.getArgs<KKiaPayArguments>(nullOk: false);
      return _i3.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.KKiaPay(
            key: args.key,
            amount: args.amount,
            reason: args.reason,
            phone: args.phone,
            name: args.name,
            email: args.email,
            data: args.data,
            partnerId: args.partnerId,
            callback: args.callback,
            callbackUrl: args.callbackUrl,
            apikey: args.apikey,
            sandbox: args.sandbox,
            theme: args.theme,
            countries: args.countries,
            paymentMethods: args.paymentMethods),
        settings: data,
      );
    }
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class KKiaPayArguments {
  const KKiaPayArguments({
    this.key,
    required this.amount,
    required this.reason,
    this.phone,
    this.name,
    this.email,
    this.data,
    this.partnerId,
    required this.callback,
    this.callbackUrl,
    required this.apikey,
    required this.sandbox,
    this.theme,
    this.countries,
    this.paymentMethods,
  });

  final _i3.Key? key;

  final int amount;

  final String reason;

  final String? phone;

  final String? name;

  final String? email;

  final String? data;

  final String? partnerId;

  final dynamic Function(
    Map<String, dynamic>,
    _i3.BuildContext,
  ) callback;

  final String? callbackUrl;

  final String apikey;

  final bool? sandbox;

  final String? theme;

  final List<String>? countries;

  final List<String>? paymentMethods;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount", "reason": "$reason", "phone": "$phone", "name": "$name", "email": "$email", "data": "$data", "partnerId": "$partnerId", "callback": "$callback", "callbackUrl": "$callbackUrl", "apikey": "$apikey", "sandbox": "$sandbox", "theme": "$theme", "countries": "$countries", "paymentMethods": "$paymentMethods"}';
  }

  @override
  bool operator ==(covariant KKiaPayArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.amount == amount &&
        other.reason == reason &&
        other.phone == phone &&
        other.name == name &&
        other.email == email &&
        other.data == data &&
        other.partnerId == partnerId &&
        other.callback == callback &&
        other.callbackUrl == callbackUrl &&
        other.apikey == apikey &&
        other.sandbox == sandbox &&
        other.theme == theme &&
        other.countries == countries &&
        other.paymentMethods == paymentMethods;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        amount.hashCode ^
        reason.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        email.hashCode ^
        data.hashCode ^
        partnerId.hashCode ^
        callback.hashCode ^
        callbackUrl.hashCode ^
        apikey.hashCode ^
        sandbox.hashCode ^
        theme.hashCode ^
        countries.hashCode ^
        paymentMethods.hashCode;
  }
}

extension NavigatorStateExtension on _i4.NavigationService {
  Future<dynamic> navigateToKKiaPay({
    _i3.Key? key,
    required int amount,
    required String reason,
    String? phone,
    String? name,
    String? email,
    String? data,
    String? partnerId,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? callbackUrl,
    required String apikey,
    required bool? sandbox,
    String? theme,
    List<String>? countries,
    List<String>? paymentMethods,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.kKiaPay,
        arguments: KKiaPayArguments(
            key: key,
            amount: amount,
            reason: reason,
            phone: phone,
            name: name,
            email: email,
            data: data,
            partnerId: partnerId,
            callback: callback,
            callbackUrl: callbackUrl,
            apikey: apikey,
            sandbox: sandbox,
            theme: theme,
            countries: countries,
            paymentMethods: paymentMethods),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKKiaPay({
    _i3.Key? key,
    required int amount,
    required String reason,
    String? phone,
    String? name,
    String? email,
    String? data,
    String? partnerId,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? callbackUrl,
    required String apikey,
    required bool? sandbox,
    String? theme,
    List<String>? countries,
    List<String>? paymentMethods,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.kKiaPay,
        arguments: KKiaPayArguments(
            key: key,
            amount: amount,
            reason: reason,
            phone: phone,
            name: name,
            email: email,
            data: data,
            partnerId: partnerId,
            callback: callback,
            callbackUrl: callbackUrl,
            apikey: apikey,
            sandbox: sandbox,
            theme: theme,
            countries: countries,
            paymentMethods: paymentMethods),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
