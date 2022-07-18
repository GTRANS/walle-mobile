import 'package:auto_size_text/auto_size_text.dart';
import '../../../../constants/color_constants.dart';
import '../../../../screens/user/home/top_up/voucher_detail.dart';
import '../../../../services/services.dart';
import '../../../../view_models/user/provider_view_model.dart';
import '../../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  void getProvider() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderViewModel>(context, listen: false).get(providerId: 3);
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderViewModel>(context, listen: false).get(providerId: 3);
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
      body: Consumer<ProviderViewModel>(builder: (_, state, __) {
        if (state.providers?.status == ApiStatus.error) {
          return ErrorView(
              errorMessage: state.providers?.message ?? "",
              refetch: getProvider);
        }

        if (state.providers?.status == ApiStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemCount: state.providers?.data?.length ?? 0,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/${state.providers?.data?[index].name?.toLowerCase()}.png",
                        ),
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        state.providers?.data?[index].name ?? '',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => VoucherDetail(
                      provider: state.providers!.data![index],
                    ),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
