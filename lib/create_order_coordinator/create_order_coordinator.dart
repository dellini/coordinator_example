import 'package:coordinator_example/coordinator_base.dart';
import 'package:flutter/cupertino.dart';

import '_index.dart';

class CreateOrderCoordinator extends Coordinator<CreateOrderState>
    implements
        CreateOrderTitleScreenDelegate,
        CreateOrderDescriptionScreenDelegate,
        CreateOrderPriceScreenDelegate,
        CreateOrderConfirmScreenDelegate {
  CreateOrderCoordinator({
    required super.shared,
    super.onCompleted,
  });

  late final ValueNotifier<CreateOrderState> _state;

  @override
  CreateOrderState get state => _state.value;

  @override
  void setup() {
    _state = ValueNotifier(CreateOrderState(
      title: '',
      description: '',
      price: 0,
    ));
  }

  @override
  void run() {
    _runScreenTitle();
  }

  void _runScreenConfirm() {
    navigator.push((context) => CreateOrderConfirmScreen(delegate: this));
  }

  void _runScreenTitle() {
    navigator.push((context) => CreateOrderEditTitleScreen(delegate: this));
  }

  void _runScreenDescription() {
    navigator
        .push((context) => CreateOrderEditDescriptionScreen(delegate: this));
  }

  void _runScreenPrice() {
    navigator.push((context) => CreateOrderEditPriceScreen(delegate: this));
  }

  @override
  void confirmCreateOrder() {
    onCompleted?.call(_state.value);
  }

  @override
  void confirmDescription(String description) {
    _state.value = _state.value.copyWith(
      description: description,
    );
    _runScreenPrice();
  }

  @override
  void confirmPrice(num price) {
    _state.value = _state.value.copyWith(
      price: price,
    );
    _runScreenConfirm();
  }

  @override
  void confirmTitle(String title) {
    _state.value = _state.value.copyWith(
      title: title,
    );
    _runScreenDescription();
  }
}
