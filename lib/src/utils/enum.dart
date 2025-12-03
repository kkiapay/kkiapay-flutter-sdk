/*
*  Application enum
* */

/// [data enum] use to define Apis and app global logic environment
enum Environment { dev, prod }

/// [ui enum] use to select next payment option
enum PaymentMethods { momo, card, cardWithLink, wallet }

/// [ui enum] use
enum PaymentEvents {
  PAYMENT_CANCELLED,
  PAYMENT_FAILED,
  PAYMENT_SUCCESS,
  PAYMENT_INIT,
}

/// Toast duration
enum ToastLength { short, medium, long }

/// Toast type
enum ToastState { failed, warning, success }
