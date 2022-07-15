import 'package:auto_size_text/auto_size_text.dart';
import '../../../screens/home/top_up/checkout_screen.dart';
import '../../../constants/color_constants.dart';
import '../../../model/provider_model.dart' as model;
import '../../../services/services.dart';
import '../../../view_models/product_view_model.dart';
import '../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VoucherDetail extends StatefulWidget {
  final model.Provider provider;
  const VoucherDetail({Key? key, required this.provider}) : super(key: key);

  @override
  State<VoucherDetail> createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
  int? checkedIndex;

  void getVoucher() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false)
          .get(categoryId: 3, providerId: widget.provider.id!);
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false)
          .get(categoryId: 3, providerId: widget.provider.id!);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          "Voucher Game",
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/${widget.provider.name?.toLowerCase()}.png",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 3,
                  child: AutoSizeText(
                    widget.provider.name ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<ProductViewModel>(builder: (_, state, __) {
              if (state.products?.status == ApiStatus.error) {
                return ErrorView(
                    errorMessage: state.products?.message ?? "",
                    refetch: getVoucher);
              }

              if (state.products?.status == ApiStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: state.products?.data?.length ?? 0,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return buildCard(state, index);
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  InkWell buildCard(ProductViewModel state, int index) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id');
    bool checked = index == checkedIndex;

    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: checked ? CustomColors.selectCard : CustomColors.white,
          border: Border.all(color: CustomColors.main),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              formatCurrency.format(state.products?.data?[index].price),
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: CustomColors.black,
              ),
              maxLines: 1,
            ),
            AutoSizeText(
              "Saldo: ${state.products?.data?[index].balance}",
              style: const TextStyle(
                fontSize: 12.0,
                color: CustomColors.black,
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          checkedIndex = index;
        });

        if (state.products!.data![index].available!) {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              formatCurrency
                                  .format(state.products?.data?[index].price),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Checkout(
                                      product: state.products!.data![index],
                                      phoneNumber: "",
                                      isVoucher: true,
                                    )));
                          },
                          child: const AutoSizeText(
                            'Beli',
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: Center(child: Text('Tidak Tersedia')),
                ),
              );
            },
          );
        }
      },
    );
  }
}
