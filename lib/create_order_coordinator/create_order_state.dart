class CreateOrderState {
  final String title;
  final String description;
  final num price;

  CreateOrderState({
    required this.title,
    required this.description,
    required this.price,
  });

  CreateOrderState copyWith({
    String? title,
    String? description,
    num? price,
  }) =>
      CreateOrderState(
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
      );
}
