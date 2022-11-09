import 'package:flutter/material.dart';
import '../_index.dart';
import 'button_widget.dart';

class CreateOrderEditTitleScreen extends StatefulWidget {
  final CreateOrderTitleScreenDelegate delegate;

  const CreateOrderEditTitleScreen({
    Key? key,
    required this.delegate,
  }) : super(key: key);

  @override
  State<CreateOrderEditTitleScreen> createState() =>
      _CreateOrderEditTitleScreenState();
}

class _CreateOrderEditTitleScreenState
    extends State<CreateOrderEditTitleScreen> {
  late final _textController = TextEditingController(
    text: widget.delegate.state.title,
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
        title: const Text('Название заказа'),
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
                  labelText: 'Название',
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
                      ? () => widget.delegate.confirmTitle(_textController.text)
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
