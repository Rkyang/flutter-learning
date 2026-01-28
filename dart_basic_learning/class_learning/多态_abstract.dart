void main(List<String> args) {
  PayBaseAb w = WxPayImpl();
  w.pay();

  PayBaseAb a = AliPayImpl();
  a.pay();
}

// 抽象类：不做具体实现
abstract class PayBaseAb {
  void pay();
}

class WxPayImpl implements PayBaseAb {
  @override
  void pay() {
    print('wx ab paying……');
  }
}

class AliPayImpl implements PayBaseAb {
  @override
  void pay() {
    print('ali ab paying……');
  }
}