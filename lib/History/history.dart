import 'package:flutter/material.dart';
import 'package:flutter_application_2/History/Histroy%20Screen/berhasil.dart';
import 'package:flutter_application_2/History/Histroy%20Screen/gagal.dart';
import 'package:flutter_application_2/History/Histroy%20Screen/tertunda.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> with SingleTickerProviderStateMixin {
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
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Berhasil",
            ),
            Tab(
              text: "Tertunda",
            ),
            Tab(
              text: "Gagal",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [Berhasil(), Tertunda(), Gagal()],
      ),
    );
  }
}
