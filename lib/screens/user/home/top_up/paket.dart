import 'package:auto_size_text/auto_size_text.dart';
import '../../../../screens/user/home/top_up/checkout_screen.dart';
import '../../../../constants/color_constants.dart';
import '../../../../services/services.dart';
import '../../../../view_models/user/product_view_model.dart';
import '../../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Paket extends StatefulWidget {
  const Paket({Key? key}) : super(key: key);

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  String provider = 'assets/default_provider.png';
  int? providerId;
  int? checkedIndex;
  TextEditingController phoneController = TextEditingController();

  String? get _errorText {
    final value = phoneController.value.text;

    if (value.isEmpty) {
      return '* Required';
    }
    if (value.isNotEmpty) {
      String pattern =
          r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
      RegExp regExp = RegExp(pattern);

      if (!regExp.hasMatch(value)) {
        return 'No. HP tidak valid';
      }
    }
    return null;
  }

  void getPaket() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductViewModel>(context, listen: false)
          .get(categoryId: 2, providerId: providerId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: CustomColors.black),
        title: const Text(
          "Paket Data",
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          provider,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColors.main.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length >= 4) {
                        final String code = value.substring(0, 4);
                        final List<String> axis = [
                          '0813',
                          '0832',
                          '0833',
                          '0838',
                        ];
                        final List<String> tri = [
                          '0896',
                          '0895',
                          '0897',
                          '0898',
                          '0899',
                        ];
                        if (axis.contains(code)) {
                          provider = 'assets/axis.png';
                          providerId = 1;
                        } else if (tri.contains(code)) {
                          provider = 'assets/tri.png';
                          providerId = 7;
                        } else {
                          provider = 'assets/default_provider.png';
                          providerId = null;
                        }
                      } else {
                        provider = 'assets/default_provider.png';
                        providerId = null;
                      }

                      if (providerId != null && value.length == 4) {
                        getPaket();
                      }
                      setState(() {
                        () => value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* Required';
                      }
                      if (value.isNotEmpty) {
                        String pattern =
                            r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
                        RegExp regExp = RegExp(pattern);

                        if (!regExp.hasMatch(value)) {
                          return 'No. HP tidak valid';
                        }
                      }
                      return null;
                    },
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'No. HP',
                      hintStyle: const TextStyle(
                        color: CustomColors.grey,
                        fontSize: 12.0,
                      ),
                      isDense: true,
                      errorText: _errorText,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.main.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.main.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.error.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.error.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Consumer<ProductViewModel>(builder: (_, state, __) {
            if (state.products?.status == ApiStatus.error) {
              return ErrorView(
                  errorMessage: state.products?.message ?? "",
                  refetch: getPaket);
            }

            if (state.products?.status == ApiStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (providerId != null) {
              return Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: state.products?.data?.length ?? 0,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext ctx, index) {
                    return buildCard(state, index);
                  },
                ),
              );
            }

            return Container();
          }),
        ],
      ),
    );
  }

  InkWell buildCard(ProductViewModel state, int index) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id');
    bool checked = index == checkedIndex;

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.black,
                ),
              ),
              AutoSizeText(
                state.products?.data?[index].description ?? '',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: CustomColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        setState(() {
          checkedIndex = index;
        });

        if (_errorText == null) {
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => Checkout(
                                    product: state.products!.data![index],
                                    phoneNumber: phoneController.value.text,
                                    isVoucher: false,
                                  ),
                                ),
                              );
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
        }
      },
    );
  }
}
