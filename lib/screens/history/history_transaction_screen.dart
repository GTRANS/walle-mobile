import 'package:auto_size_text/auto_size_text.dart';
import '../../constants/color_constants.dart';
import '../../model/transaction_model.dart';
import '../../services/services.dart';
import '../../view_models/transaction_view_model.dart';
import 'package:capstone/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

class HistoryTransactionScreen extends StatefulWidget {
  final TransactionStatus? status;

  const HistoryTransactionScreen({Key? key, this.status}) : super(key: key);

  @override
  State<HistoryTransactionScreen> createState() =>
      _HistoryTransactionScreenState();
}

class _HistoryTransactionScreenState extends State<HistoryTransactionScreen> {
  void getTransactions() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionViewModel>(context, listen: false)
          .get(status: widget.status ?? TransactionStatus.success);
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TransactionViewModel>(context, listen: false)
          .get(status: widget.status ?? TransactionStatus.success);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionViewModel>(builder: (_, state, __) {
      if (state.transactions?.status == ApiStatus.error) {
        return ErrorView(
            errorMessage: state.transactions?.message ?? "",
            refetch: getTransactions);
      }

      if (state.transactions?.status == ApiStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      final count = state.transactions?.data?.length ?? 0;

      if (count == 0) {
        return const Center(
          child: AutoSizeText(
            "Tidak Ada Transaksi",
            style: TextStyle(fontSize: 12.0, color: CustomColors.grey),
          ),
        );
      }

      return ListView.builder(
        itemBuilder: ((context, index) {
          final Transaction transaction = state.transactions!.data![index];
          final String logo;
          final Color priceColor;
          final formatCurrency = NumberFormat.simpleCurrency(locale: 'id');

          if (transaction.product?.id == 1) {
            logo = 'assets/history_pulsa.png';
          } else if (transaction.product?.id == 2) {
            logo = 'assets/history_paket_data.png';
          } else {
            logo = 'assets/history_voucher_game.png';
          }

          if (widget.status == TransactionStatus.fail) {
            priceColor = CustomColors.error;
          } else if (widget.status == TransactionStatus.pending) {
            priceColor = CustomColors.yellow;
          } else {
            priceColor = CustomColors.main;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.grey,
                  border: Border.all(color: CustomColors.darkGrey, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(
                            logo,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              transaction.product?.description ?? '',
                              style: const TextStyle(
                                  fontSize: 12.0, color: CustomColors.black),
                            ),
                            AutoSizeText(
                              transaction.transactionDate ?? '',
                              style: const TextStyle(
                                  fontSize: 12.0, color: CustomColors.darkGrey),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              transaction.paymentType!.sentenceCase,
                              style: const TextStyle(
                                  fontSize: 12.0, color: CustomColors.black),
                            ),
                            AutoSizeText(
                              formatCurrency.format(transaction.product?.price),
                              style:
                                  TextStyle(fontSize: 12.0, color: priceColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          );
        }),
        itemCount: count,
      );
    });
  }
}
