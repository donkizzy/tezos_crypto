import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezos_asessment/app/data/models/transaction_response.dart';
import 'package:tezos_asessment/core/app_colors.dart';
import 'package:tezos_asessment/core/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionDetails extends StatefulWidget {
  final Tx? transaction;
  const TransactionDetails({super.key, required this.transaction});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: GestureDetector(
          onTap: () {
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
          "Transaction details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hash',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
               Expanded(
                  child: Text( widget.transaction?.hash ?? 'N/A',
                style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
              )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
               Expanded(
                  child: Text(
                    formatTimestamp(widget.transaction?.time ?? 0),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
               Expanded(
                  child: Text(
                    widget.transaction?.size.toString() ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Block index',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
               Expanded(
                  child: Text(
                    widget.transaction?.blockIndex.toString() ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Height',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
              Expanded(
                  child: Text(
                    widget.transaction?.blockHeight.toString() ?? 'N/A',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 17.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Received time',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
              const Spacer(),
               Expanded(
                  child: Text(
                    formatTimestamp(widget.transaction?.lockTime ?? 0),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.end,
                  )),
            ],
          ),
          const SizedBox(height: 58,),
          GestureDetector(
            onTap: (){
              _launchUrl('https://www.blockchain.com/explorer/transactions/btc/${widget.transaction?.hash}');
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/external-link.svg",
                  height: 24,
                  colorFilter:  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                ),
                const SizedBox(width: 16,),
                 const Expanded(child: Text('View on blockchain explorer',style: TextStyle(color: Colors.black,fontSize: 16),)),
                const SizedBox(width: 16,),
                 SvgPicture.asset(
                  "assets/chevron-right.svg",
                  height: 24,
                  colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.32), BlendMode.srcIn),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
        ],
      ),
    );

  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
