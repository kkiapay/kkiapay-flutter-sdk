// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/material.dart' as _i3;
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/src/features/withUI/mobile/kkiapay.dart'
    as _i2;
import 'package:kkiapay_flutter_sdk/src/utils/config.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

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
            callback: args.callback,
            reason: args.reason,
            phone: args.phone,
            name: args.name,
            email: args.email,
            data: args.data,
            partnerId: args.partnerId,
            callbackUrl: args.callbackUrl,
            apikey: args.apikey,
            sandbox: args.sandbox,
            theme: args.theme,
            countries: args.countries,
            providers: args.providers,
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
    required this.callback,
    this.reason = "",
    this.phone = "",
    this.name = "",
    this.email = "",
    this.data = "",
    this.partnerId = "",
    this.callbackUrl = "",
    required this.apikey,
    required this.sandbox,
    this.theme = _i5.defaultTheme,
    this.countries = const ["BJ", "CI", "SN", "TG"],
    this.providers,
    this.paymentMethods = const ["momo", "card"],
  });

  final _i4.Key? key;

  final int amount;

  final dynamic Function(
    Map<String, dynamic>,
    _i3.BuildContext,
  ) callback;

  final String? reason;

  final String? phone;

  final String? name;

  final String? email;

  final String? data;

  final String? partnerId;

  final String? callbackUrl;

  final String apikey;

  final bool? sandbox;

  final String? theme;

  final List<String>? countries;

  final _i5.Providers? providers;

  final List<String>? paymentMethods;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount", "callback": "$callback", "reason": "$reason", "phone": "$phone", "name": "$name", "email": "$email", "data": "$data", "partnerId": "$partnerId", "callbackUrl": "$callbackUrl", "apikey": "$apikey", "sandbox": "$sandbox", "theme": "$theme", "countries": "$countries", "providers": "$providers", "paymentMethods": "$paymentMethods"}';
  }

  @override
  bool operator ==(covariant KKiaPayArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.amount == amount &&
        other.callback == callback &&
        other.reason == reason &&
        other.phone == phone &&
        other.name == name &&
        other.email == email &&
        other.data == data &&
        other.partnerId == partnerId &&
        other.callbackUrl == callbackUrl &&
        other.apikey == apikey &&
        other.sandbox == sandbox &&
        other.theme == theme &&
        other.countries == countries &&
        other.providers == providers &&
        other.paymentMethods == paymentMethods;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        amount.hashCode ^
        callback.hashCode ^
        reason.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        email.hashCode ^
        data.hashCode ^
        partnerId.hashCode ^
        callbackUrl.hashCode ^
        apikey.hashCode ^
        sandbox.hashCode ^
        theme.hashCode ^
        countries.hashCode ^
        providers.hashCode ^
        paymentMethods.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToKKiaPay({
    _i4.Key? key,
    required int amount,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? reason = "",
    String? phone = "",
    String? name = "",
    String? email = "",
    String? data = "",
    String? partnerId = "",
    String? callbackUrl = "",
    required String apikey,
    required bool? sandbox,
    String? theme = _i5.defaultTheme,
    List<String>? countries = const ["BJ", "CI", "SN", "TG"],
    _i5.Providers? providers,
    List<String>? paymentMethods = const ["momo", "card"],
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
            callback: callback,
            reason: reason,
            phone: phone,
            name: name,
            email: email,
            data: data,
            partnerId: partnerId,
            callbackUrl: callbackUrl,
            apikey: apikey,
            sandbox: sandbox,
            theme: theme,
            countries: countries,
            providers: providers,
            paymentMethods: paymentMethods),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKKiaPay({
    _i4.Key? key,
    required int amount,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? reason = "",
    String? phone = "",
    String? name = "",
    String? email = "",
    String? data = "",
    String? partnerId = "",
    String? callbackUrl = "",
    required String apikey,
    required bool? sandbox,
    String? theme = _i5.defaultTheme,
    List<String>? countries = const ["BJ", "CI", "SN", "TG"],
    _i5.Providers? providers,
    List<String>? paymentMethods = const ["momo", "card"],
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
            callback: callback,
            reason: reason,
            phone: phone,
            name: name,
            email: email,
            data: data,
            partnerId: partnerId,
            callbackUrl: callbackUrl,
            apikey: apikey,
            sandbox: sandbox,
            theme: theme,
            countries: countries,
            providers: providers,
            paymentMethods: paymentMethods),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
