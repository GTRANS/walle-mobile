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
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Transaksi"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                "Berhasil",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 0, 255, 98)),
              ),
            ),
            Tab(
                child: Text(
              "Tertunda",
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 251, 194, 25)),
            )),
            Tab(
              child: Text(
                "Gagal",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 255, 0, 0)),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [SuccessScreen(), OngoingScreen(), FailScreen()],
      ),
    );
  }
}
