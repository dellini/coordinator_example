import 'package:coordinator_example/create_order_coordinator/screens/button_widget.dart';
import 'package:flutter/material.dart';
import '../_index.dart';

class CreateOrderConfirmScreen extends StatelessWidget {
  final CreateOrderConfirmScreenDelegate delegate;

  const CreateOrderConfirmScreen({
    Key? key,
    required this.delegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подтвердите заказ'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            Expanded(child: _buildOrder()),
            PrimaryButton(
              onPressed: delegate.confirmCreateOrder,
              child: const Text('Создать заказ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrder() => Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfo('Название', delegate.state.title),
              const SizedBox(height: 24),
              _buildInfo('Описание', delegate.state.description),
              const SizedBox(height: 24),
              _buildInfo('Стоимость', delegate.state.price.toString()),
            ],
          ),
        );
      });

  Widget _buildInfo(String title, String value) => Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        );
      });
}
