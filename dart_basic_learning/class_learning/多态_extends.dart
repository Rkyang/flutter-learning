void main(List<String> args) {
  PayBase w = WcPay();
  w.pay();

  PayBase a = AliPay();
  a.pay();
}

class PayBase {
  void pay() {
    print('paying……');
  }
}

class WcPay extends PayBase {
  @override
  void pay() {
    print('wc paying……');
  }
}

class AliPay extends PayBase {
  @override
  void pay() {
    print('ali paying……');
  }
}