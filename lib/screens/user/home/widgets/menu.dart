import 'package:auto_size_text/auto_size_text.dart';
import '../../../../constants/color_constants.dart';
import '../../../../services/services.dart';
import '../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../top_up/paket.dart';
import '../top_up/pulsa.dart';
import '../top_up/voucher.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void getUser() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getInfo();
    });
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserViewModel>(context, listen: false).getInfo();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<UserViewModel>(builder: (_, state, __) {
                if (state.user?.status == ApiStatus.error) {
                  return ErrorView(
                      errorMessage: state.user?.message ?? "",
                      refetch: getUser);
                }

                if (state.user?.status == ApiStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Row(
                  children: [
                    Image.asset("assets/phone.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "No HP Utama : ${state.user?.data?.phoneNumber}",
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Pulsa()));
                                },
                                icon: Image.asset("assets/pulsa.png"),
                                iconSize: 60,
                              ),
                              const AutoSizeText(
                                "Pulsa",
                                style: TextStyle(
                                    fontSize: 10, color: CustomColors.darkGrey),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Paket()));
                                },
                                icon: Image.asset("assets/paket.png"),
                                iconSize: 60,
                              ),
                              const AutoSizeText(
                                "Paket Data",
                                style: TextStyle(
                                    fontSize: 10, color: CustomColors.darkGrey),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => const Voucher()));
                                },
                                icon: Image.asset("assets/voucher_game.png"),
                                iconSize: 60,
                              ),
                              const AutoSizeText(
                                "Voucher Game",
                                style: TextStyle(
                                    fontSize: 10, color: CustomColors.darkGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
