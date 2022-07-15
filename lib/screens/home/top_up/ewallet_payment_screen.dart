import 'package:auto_size_text/auto_size_text.dart';
import '../../../screens/history/transaction_detail_screen.dart';
import '../../../constants/color_constants.dart';
import '../../../model/transaction_model.dart';
import 'package:flutter/material.dart';

class EwalletPaymentScreen extends StatefulWidget {
  final Transaction transaction;
  const EwalletPaymentScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<EwalletPaymentScreen> createState() => _EwalletPaymentScreenState();
}

class _EwalletPaymentScreenState extends State<EwalletPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          "Pembayaran",
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Center(
            child: Image.network(widget.transaction.qrCodeLink ?? ''),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomColors.main),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TransactionDetailScreen(
                      transactionId: widget.transaction.id!,
                    ),
                  ),
                );
              },
              child: const AutoSizeText(
                'Detail Transaksi',
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomColors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(
                      color: CustomColors.main,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/main', (route) => false);
              },
              child: const AutoSizeText(
                'Kembali',
                style: TextStyle(
                  fontSize: 16,
                  color: CustomColors.main,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
