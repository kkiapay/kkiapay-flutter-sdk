# kkiapay_flutter_sdk

[Kkiapay](https://kkiapay.me) is developer friendly solution that allows you to accept mobile money and credit card payments
in your application or website.

Before using this SDK, make sure you have a right Merchant Account on [Kkiapay](https://kkiapay.me), otherwise [go](https://kkiapay.me)
and create your account is free and without pain :sunglasses:.

## Installation

To use this package :

```yaml
dependencies:
  flutter:
    sdk: flutter
  kkiapay_flutter_sdk:
```

## Usage

```yaml
    import 'package:kkiapay_flutter_sdk/kkiapayWebview.dart';
    import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';
```
##### Initialise the Kkiapay Instance
In the onCreate method of your Application class
```kotlin
Kkiapay.init(applicationContext,
            "<kkiapay-api-key>",
            SdkConfig(themeColor = R.color.colorPrimary, imageResource = R.raw.armoiries, 
            /* set this to false in prod */ enableSandbox = true))
```

##### Create payment webview instance
In the onCreate method of your Application class
```kotlin
Kkiapay.init(applicationContext,
            "<kkiapay-api-key>",
            SdkConfig(themeColor = R.color.colorPrimary, imageResource = R.raw.armoiries, 
            /* set this to false in prod */ enableSandbox = true))
```