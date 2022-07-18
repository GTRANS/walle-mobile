import 'package:auto_size_text/auto_size_text.dart';
import '../../../constants/color_constants.dart';
import '../../../services/services.dart';
import '../../../view_models/user/token_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../../widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Center(
              child: Stack(children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundColor: CustomColors.grey,
                  child: Icon(
                    Icons.person,
                    color: CustomColors.white,
                    size: 60,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.main,
                    ),
                    child: const Icon(Icons.edit, color: CustomColors.white),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<UserViewModel>(builder: (_, state, __) {
                if (state.user?.status == ApiStatus.error) {
                  return ErrorView(
                      errorMessage: state.user?.message ?? "",
                      refetch: getUser);
                }

                if (state.user?.status == ApiStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: <Widget>[
                    userInfo("Nama", state.user?.data?.name),
                    userInfo("No. Hp", state.user?.data?.phoneNumber),
                    userInfo("Email", state.user?.data?.email),
                    userInfo("Password", "********"),
                  ],
                );
              }),
            ),
            InkWell(
              child: Row(
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.exit_to_app,
                      color: CustomColors.darkGrey,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: AutoSizeText(
                      'Keluar',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: CustomColors.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                exitDialog();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget userInfo(String label, String? data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AutoSizeText(
            label,
            style: const TextStyle(
              fontSize: 12.0,
              color: CustomColors.black,
            ),
          ),
          AutoSizeText(
            data ?? '-',
            style: const TextStyle(
              fontSize: 12.0,
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Kamu Yakin?"),
        content: const Text("Ingin Keluar Dari Aplikasi?"),
        actions: [
          TextButton(
            onPressed: () async {
              await Provider.of<TokenViewModel>(context, listen: false)
                  .revokeToken();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            },
            child: const Text("KELUAR"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("BATAL"),
          ),
        ],
      ),
    );
  }
}
