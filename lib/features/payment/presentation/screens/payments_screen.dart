import 'package:branding/config/constants.dart';
import 'package:branding/features/payment/presentation/screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentsScreen extends StatefulWidget {
  static String routePath = "/payments";
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Choose your payment method',
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 28),
            ),
          ),
          Expanded(
            child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Radio(
                      activeColor: Theme.of(context).primaryColor,
                      value: index,
                      groupValue: value,
                      onChanged: (i) => setState(() => value == i),
                    ),
                    title: Text(paymentLabels[index]),
                    trailing: Icon(paymentIcons[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: paymentLabels.length),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                context.go(SuccessScreen.routePath);
              },
              child: const Text('Pay'),
            ),
          )
        ],
      ),
    );
  }
}
