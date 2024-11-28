import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezos_asessment/core/app_colors.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          behavior: HitTestBehavior.opaque,
          child: Center(
            child: SvgPicture.asset(
              "assets/arrow_back.svg",
              height: 16,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "BTC transactions",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16),),
            ),
            subtitle: Text("2019-08-24 • 15:43",style: TextStyle(color: Colors.black.withOpacity(0.56)),),
            trailing:  SvgPicture.asset(
              "assets/chevron-right.svg",
              height: 24,
              colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.32), BlendMode.srcIn),
            ),
            isThreeLine: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          );
        },
      ),
    );
  }
}
