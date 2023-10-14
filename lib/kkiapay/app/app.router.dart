// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i3;
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/kkiapay/view/widget_builder_view.dart'
    as _i2;
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
            apikey: args.apikey,
            callback: args.callback,
            phone: args.phone,
            partnerId: args.partnerId,
            countries: args.countries,
            reason: args.reason,
            data: args.data,
            paymentMethods: args.paymentMethods,
            sandbox: args.sandbox,
            theme: args.theme,
            name: args.name,
            email: args.email),
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
    required this.apikey,
    required this.callback,
    this.phone,
    this.partnerId,
    this.countries,
    this.reason,
    this.data,
    this.paymentMethods,
    required this.sandbox,
    this.theme,
    this.name,
    this.email,
  });

  final _i3.Key? key;

  final int amount;

  final String? apikey;

  final dynamic Function(
    Map<String, dynamic>,
    _i3.BuildContext,
  ) callback;

  final String? phone;

  final String? partnerId;

  final List<String>? countries;

  final String? reason;

  final String? data;

  final List<String>? paymentMethods;

  final bool? sandbox;

  final String? theme;

  final String? name;

  final String? email;

  @override
  String toString() {
    return '{"key": "$key", "amount": "$amount", "apikey": "$apikey", "callback": "$callback", "phone": "$phone", "partnerId": "$partnerId", "countries": "$countries", "reason": "$reason", "data": "$data", "paymentMethods": "$paymentMethods", "sandbox": "$sandbox", "theme": "$theme", "name": "$name", "email": "$email"}';
  }

  @override
  bool operator ==(covariant KKiaPayArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.amount == amount &&
        other.apikey == apikey &&
        other.callback == callback &&
        other.phone == phone &&
        other.partnerId == partnerId &&
        other.countries == countries &&
        other.reason == reason &&
        other.data == data &&
        other.paymentMethods == paymentMethods &&
        other.sandbox == sandbox &&
        other.theme == theme &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        amount.hashCode ^
        apikey.hashCode ^
        callback.hashCode ^
        phone.hashCode ^
        partnerId.hashCode ^
        countries.hashCode ^
        reason.hashCode ^
        data.hashCode ^
        paymentMethods.hashCode ^
        sandbox.hashCode ^
        theme.hashCode ^
        name.hashCode ^
        email.hashCode;
  }
}

extension NavigatorStateExtension on _i4.NavigationService {
  Future<dynamic> navigateToKKiaPay({
    _i3.Key? key,
    required int amount,
    required String? apikey,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? phone,
    String? partnerId,
    List<String>? countries,
    String? reason,
    String? data,
    List<String>? paymentMethods,
    required bool? sandbox,
    String? theme,
    String? name,
    String? email,
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
            apikey: apikey,
            callback: callback,
            phone: phone,
            partnerId: partnerId,
            countries: countries,
            reason: reason,
            data: data,
            paymentMethods: paymentMethods,
            sandbox: sandbox,
            theme: theme,
            name: name,
            email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithKKiaPay({
    _i3.Key? key,
    required int amount,
    required String? apikey,
    required dynamic Function(
      Map<String, dynamic>,
      _i3.BuildContext,
    ) callback,
    String? phone,
    String? partnerId,
    List<String>? countries,
    String? reason,
    String? data,
    List<String>? paymentMethods,
    required bool? sandbox,
    String? theme,
    String? name,
    String? email,
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
            apikey: apikey,
            callback: callback,
            phone: phone,
            partnerId: partnerId,
            countries: countries,
            reason: reason,
            data: data,
            paymentMethods: paymentMethods,
            sandbox: sandbox,
            theme: theme,
            name: name,
            email: email),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
