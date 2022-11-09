import 'package:coordinator_example/create_order_coordinator/screens/button_widget.dart';
import 'package:flutter/material.dart';
import '../_index.dart';

class CreateOrderEditDescriptionScreen extends StatefulWidget {
  final CreateOrderDescriptionScreenDelegate delegate;

  const CreateOrderEditDescriptionScreen({
    Key? key,
    required this.delegate,
  }) : super(key: key);

  @override
  State<CreateOrderEditDescriptionScreen> createState() =>
      _CreateOrderEditDescriptionScreenState();
}

class _CreateOrderEditDescriptionScreenState
    extends State<CreateOrderEditDescriptionScreen> {
  late final _textController = TextEditingController(
    text: widget.delegate.state.description,
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
        title: const Text('Описание заказа'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Описание',
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _textController,
            builder: (context, _) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: PrimaryButton(
                  onPressed: _textController.text.isNotEmpty
                      ? () => widget.delegate
                          .confirmDescription(_textController.text)
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
