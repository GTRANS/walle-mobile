import 'package:auto_size_text/auto_size_text.dart';
import '../../../screens/home/top_up/bank_payment_screen.dart';
import '../../../screens/home/top_up/ewallet_payment_screen.dart';
import '../../../model/transaction_model.dart';
import '../../../view_models/transaction_view_model.dart';
import '../../../view_models/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../../constants/color_constants.dart';
import '../../../model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PaymentMethod { ewallet, bank }

class Checkout extends StatefulWidget {
  final Product product;
  final String phoneNumber;
  final bool isVoucher;
  const Checkout(
      {Key? key,
      required this.product,
      required this.phoneNumber,
      required this.isVoucher})
      : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  PaymentMethod? _paymentMethod = PaymentMethod.ewallet;
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          "Checkout",
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                paymentDetail(),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const AutoSizeText(
                      "Pilih Metode Pembayaran",
                      style: TextStyle(
                        color: CustomColors.main,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/gopay.png",
                        width: 50,
                        height: 50,
                      ),
                      title: const AutoSizeText(
                        'GOPAY',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      trailing: Radio(
                        activeColor: CustomColors.main,
                        value: PaymentMethod.ewallet,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: CustomColors.main, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Image.asset(
                        "assets/bank.png",
                        width: 50,
                        height: 50,
                      ),
                      title: const AutoSizeText(
                        'BANK',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      trailing: Radio(
                        activeColor: CustomColors.main,
                        value: PaymentMethod.bank,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() {
                            _paymentMethod = value;
                          });
                        },
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: CustomColors.main, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const AutoSizeText(
                      "Ringkasan Pembayaran",
                      style: TextStyle(
                        color: CustomColors.main,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const AutoSizeText(
                          "Sub Total",
                          style: TextStyle(
                            color: CustomColors.black,
                            fontSize: 14.0,
                          ),
                        ),
                        AutoSizeText(
                          formatCurrency.format(widget.product.price),
                          style: const TextStyle(
                            color: CustomColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const AutoSizeText(
                        "Total Bayar",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: CustomColors.black,
                        ),
                      ),
                      AutoSizeText(
                        formatCurrency.format(widget.product.price),
                        style: const TextStyle(
                          fontSize: 20.0,
                          color: CustomColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(CustomColors.main),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final user = await Provider.of<UserViewModel>(context,
                              listen: false)
                          .getInfo();

                      if (_paymentMethod == PaymentMethod.bank) {
                        final BankTransactionInput input = BankTransactionInput(
                          bank: "bca",
                          productId: widget.product.id,
                          userId: user.data!.id,
                        );

                        final transaction =
                            await Provider.of<TransactionViewModel>(context,
                                    listen: false)
                                .bankPayment(input: input);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BankPaymentScreen(
                                  transaction: transaction.data!,
                                )));
                      } else if (_paymentMethod == PaymentMethod.ewallet) {
                        final EWalletTransactionInput input =
                            EWalletTransactionInput(
                          productId: widget.product.id,
                          userId: user.data!.id,
                        );

                        final transaction =
                            await Provider.of<TransactionViewModel>(context,
                                    listen: false)
                                .eWalletPayment(input: input);

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => EwalletPaymentScreen(
                                transaction: transaction.data!)));
                      }
                    },
                    child: const AutoSizeText(
                      'Bayar',
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget paymentDetail() {
    if (widget.isVoucher) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const AutoSizeText(
            "Detail Pembayaran",
            style: TextStyle(
              color: CustomColors.main,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const AutoSizeText(
                "Layanan",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 14.0,
                ),
              ),
              AutoSizeText(
                widget.product.description ?? "",
                style: const TextStyle(
                  color: CustomColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const AutoSizeText(
                "Harga",
                style: TextStyle(
                  color: CustomColors.black,
                  fontSize: 14.0,
                ),
              ),
              AutoSizeText(
                formatCurrency.format(widget.product.price),
                style: const TextStyle(
                  color: CustomColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AutoSizeText(
          "Detail Pembayaran",
          style: TextStyle(
            color: CustomColors.main,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const AutoSizeText(
              "Layanan",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 14.0,
              ),
            ),
            AutoSizeText(
              widget.product.description ?? "",
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const AutoSizeText(
              "No. HP",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 14.0,
              ),
            ),
            AutoSizeText(
              widget.phoneNumber,
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const AutoSizeText(
              "Harga",
              style: TextStyle(
                color: CustomColors.black,
                fontSize: 14.0,
              ),
            ),
            AutoSizeText(
              formatCurrency.format(widget.product.price),
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
