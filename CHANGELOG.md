## 1.3.0-dev.2

- Remove public_api_key
- Update callback

## 1.3.0-dev.1

- Update sdk loader ui
- Add optional key callbackUrl
- Update [README.md](README.md)

## 1.2.12

- Fix wave app redirection bug

## 1.2.10

- Review sdk import
- WIDGET_SUCCESSFULLY_INIT event not found on ios emulator : hide loader with webview callback

## 1.2.9-dev.2

- Review sdk import

## 1.2.9-dev.1

- WIDGET_SUCCESSFULLY_INIT event not found on ios emulator : hide loader with webview callback
 
## 1.2.8

- fix : webview_flutter building review

## 1.2.7

- Update all plugin dependencies
- Review example project
- Review readme

## 1.2.6

- Set sandbox as required
- Update few plugin dependencies 

## 1.2.5

- listen more event (PAYMENT_FAILED, PAYMENT_CANCELLED, PAYMENT_SUCCESS ) on payment callBack

## 1.2.4

- Remove loader animation 

## 1.2.3

- Listen close event from javascript

## 1.2.2

- Update Stacked dependencies

## 1.2.1

- Add redirection to wave or play store application
- Update KKiaPay payment instance import link on readme

## 1.2.0

- migration to the new version of the widget ui
- update the successCallback function Map<String,dynamic> parameters to
  {
  'requestData': {
  'amount': int,
  'phone': String,
  'reason': String,
  'data': String,
  'paymentMethods': List<String>,
  'sandbox': bool,
  'partnerId': String,
  'countries': List<String>,
  'name': String,
  'email': String
  },
  'transactionId': String,
  'status': String
  }

## 1.1.0

- change webview plugin.

## 1.0.6

- update flutter webview plugin to latest version.

## 1.0.5

- add support for flutter last version

## 1.0.3

- remove appbar

## 1.0.2

- add type for callback

## 1.0.0

- kkiapay official release

## 0.5.0

- add docs

# 0.2.0

- refactor

## 0.0.2

- Initial version, created by kkiapay

## 0.1.0

- add description and fix version issue
