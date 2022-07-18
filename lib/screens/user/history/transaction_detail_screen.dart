import 'package:auto_size_text/auto_size_text.dart';
import '../../../constants/color_constants.dart';
import '../../../model/transaction_model.dart';
import '../../../services/services.dart';
import '../../../view_models/user/transaction_view_model.dart';
import '../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionDetailScreen extends StatefulWidget {
  final int transactionId;
  const TransactionDetailScreen({Key? key, required this.transactionId})
      : super(key: key);

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'id');

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionViewModel>(context, listen: false)
          .detail(id: widget.transactionId);
    });
    super.didChangeDependencies();
  }

  void getDetail() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionViewModel>(context, listen: false)
          .detail(id: widget.transactionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          'Detail Transaksi',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Consumer<TransactionViewModel>(builder: (_, state, __) {
        if (state.transaction?.status == ApiStatus.error) {
          return ErrorView(
              errorMessage: state.transaction?.message ?? "",
              refetch: getDetail);
        }

        if (state.transaction?.status == ApiStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final String header;
        final Color color;
        final time = state.transaction?.data?.transactionDate?.split(" ");
        final isVoucher = state.transaction?.data?.provider?.id == 3;

        if (state.transaction?.data?.status! == 'settlement') {
          header = 'Pembayaran Berhasil';
          color = CustomColors.main;
        } else if (state.transaction?.data?.status! == 'pending') {
          header = 'Pembayaran Tertunda';
          color = CustomColors.yellow;
        } else {
          header = 'Pembayaran Gagal';
          color = CustomColors.error;
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: AutoSizeText(
                        header,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'No. Invoice',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: CustomColors.black,
                          ),
                        ),
                        AutoSizeText(
                          state.transaction?.data?.orderId ?? '',
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Tanggal Transaksi',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: CustomColors.black,
                          ),
                        ),
                        AutoSizeText(
                          time![0],
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Jam',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: CustomColors.black,
                          ),
                        ),
                        AutoSizeText(
                          time[1],
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: paymentDetail(isVoucher, state.transaction?.data, color),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      "Total Pembayaran",
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Metode Pembayaran',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: CustomColors.black,
                          ),
                        ),
                        AutoSizeText(
                          state.transaction?.data?.paymentType?.sentenceCase ??
                              '',
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          'Total Pemnbayaran',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: CustomColors.black,
                          ),
                        ),
                        AutoSizeText(
                          formatCurrency
                              .format(state.transaction?.data?.product?.price),
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        height: 60,
                        padding:
                            const EdgeInsets.only(top: 5, left: 30, right: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(CustomColors.main),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/main', (route) => false);
                          },
                          child: const AutoSizeText(
                            'Beli Lagi',
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        padding:
                            const EdgeInsets.only(top: 5, left: 30, right: 30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(CustomColors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                  color: CustomColors.main,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
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
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget paymentDetail(bool isVoucher, Transaction? transaction, Color color) {
    if (isVoucher) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Divider(
            color: CustomColors.grey,
            thickness: 1,
          ),
          AutoSizeText(
            "Detail Layanan",
            style: TextStyle(
              color: color,
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
                transaction?.product?.description ?? "",
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
                formatCurrency.format(transaction?.product?.price),
                style: const TextStyle(
                  color: CustomColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const Divider(
            color: CustomColors.grey,
            thickness: 1,
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(
          color: CustomColors.grey,
          thickness: 1,
        ),
        AutoSizeText(
          "Detail Layanan",
          style: TextStyle(
            color: color,
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
              transaction?.product?.description ?? "",
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
              transaction?.phoneNumber ?? '',
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
              formatCurrency.format(transaction?.product?.price),
              style: const TextStyle(
                color: CustomColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const Divider(
          color: CustomColors.grey,
          thickness: 1,
        ),
      ],
    );
  }
}
