import 'package:coordinator_example/create_order_coordinator/screens/button_widget.dart';
import 'package:flutter/material.dart';
import '../_index.dart';

class CreateOrderEditPriceScreen extends StatefulWidget {
  final CreateOrderPriceScreenDelegate delegate;

  const CreateOrderEditPriceScreen({
    Key? key,
    required this.delegate,
  }) : super(key: key);

  @override
  State<CreateOrderEditPriceScreen> createState() =>
      _CreateOrderEditPriceScreenState();
}

class _CreateOrderEditPriceScreenState
    extends State<CreateOrderEditPriceScreen> {
  late final _textController = TextEditingController(
    text: widget.delegate.state.price > 0
        ? widget.delegate.state.price.toString()
        : '',
  );

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Стоимость заказа'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _textController,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: false,
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Стоимость',
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _textController,
            builder: (context, _) {
              final price = double.tryParse(_textController.text);

              return Padding(
                padding: const EdgeInsets.all(24),
                child: PrimaryButton(
                  onPressed: _textController.text.isNotEmpty && price != null
                      ? () => widget.delegate.confirmPrice(price)
                      : null,
                  child: const Text('Дальше'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
