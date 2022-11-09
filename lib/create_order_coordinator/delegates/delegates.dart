import 'package:coordinator_example/create_order_coordinator/create_order_state.dart';

abstract class CreateOrderTitleScreenDelegate {
  void confirmTitle(String title);
  CreateOrderState get state;
}

abstract class CreateOrderDescriptionScreenDelegate {
  void confirmDescription(String description);
  CreateOrderState get state;
}

abstract class CreateOrderPriceScreenDelegate {
  void confirmPrice(num price);
  CreateOrderState get state;
}

abstract class CreateOrderConfirmScreenDelegate {
  void confirmCreateOrder();
  CreateOrderState get state;
}
