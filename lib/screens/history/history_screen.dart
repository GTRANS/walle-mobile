import 'package:auto_size_text/auto_size_text.dart';
import '../../constants/color_constants.dart';
import '../../screens/history/history_state/success_screen.dart';
import '../../screens/history/history_state/ongoing_screen.dart';
import '../../screens/history/history_state/fail_screen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  Color _indicatorColor = CustomColors.main;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController?.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
      if (_tabController?.index == 0) {
        _indicatorColor = CustomColors.main;
      } else if (_tabController?.index == 1) {
        _indicatorColor = CustomColors.yellow;
      } else {
        _indicatorColor = CustomColors.error;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Riwayat Transaksi',
          style: TextStyle(color: CustomColors.black),
        ),
        backgroundColor: CustomColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: _indicatorColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: AutoSizeText(
                    "Berhasil",
                    style: TextStyle(
                        fontSize: 18,
                        color: _tabController?.index == 0
                            ? CustomColors.white
                            : CustomColors.main),
                  ),
                ),
                Tab(
                  child: AutoSizeText(
                    "Tertunda",
                    style: TextStyle(
                        fontSize: 18,
                        color: _tabController?.index == 1
                            ? CustomColors.white
                            : CustomColors.yellow),
                  ),
                ),
                Tab(
                  child: AutoSizeText(
                    "Gagal",
                    style: TextStyle(
                        fontSize: 18,
                        color: _tabController?.index == 2
                            ? CustomColors.white
                            : CustomColors.error),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SuccessScreen(),
                  OngoingScreen(),
                  FailScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
