import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezos_asessment/app/presentation/pages/transaction_list.dart';
import 'package:tezos_asessment/core/app_colors.dart';
import 'package:tezos_asessment/core/utils.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> assets = ['assets/btc.png', 'assets/poly.png', 'assets/xtz.png', 'assets/sol.png', 'assets/eth.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        leading: Center(
          child: SvgPicture.asset(
            "assets/scan.svg",
            height: 24,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Explore",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          const SizedBox(
            width: 16,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/search.svg",
              height: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/bell.svg",
              height: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'My balance',
                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 6,
                ),
                SvgPicture.asset(
                  "assets/eye.svg",
                  height: 16,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
                text: const TextSpan(
                    text: '₦',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                    children: [
                  TextSpan(
                    text: '5,000.00',
                    style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
                  )
                ])),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            color: athensGray,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My assets',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontWeight: FontWeight.w600, color: salemGreen),
                )
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TransactionList()));
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(assets[index]),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Bitcoin',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                                Spacer(),
                                Text(
                                  '₦5,000.00',
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'BTC',
                                  style: TextStyle(color: grayChateau, fontSize: 16),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/arrow-up-right.svg",
                                      height: 16,
                                    ),
                                    const Text(
                                      '0.5%',
                                      style: TextStyle(color: salemGreen, fontSize: 16, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            color: athensGray,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today’s Top Movers',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontWeight: FontWeight.w600, color: salemGreen),
                )
              ],
            ),
          ),
          SizedBox(
            height: 135,
            width: width(context),
            child: ListView.separated(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 150,
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 22),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(0.12)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(assets[index]),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Ethereum',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/arrow-down-right.svg",
                            height: 16,
                            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          ),
                          const Text(
                            '0.5%',
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            color: athensGray,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending news',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'View more',
                  style: TextStyle(fontWeight: FontWeight.w600, color: salemGreen),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                'https://picsum.photos/1024/1024',
                width: width(context),
                height: 166,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
              style: TextStyle(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'CoinDesk • 2h',
              style: TextStyle(color: grayChateau, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              height: 1,
              color: athensGray,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 600,
            child: ListView.separated(
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                        child:
                            Image.network('https://picsum.photos/1024/1024', width: 55, height: 73, fit: BoxFit.cover)),
                    const SizedBox(width: 6,),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',),
                          SizedBox(height: 8,),
                          Text(
                            'CoinDesk • 2h',
                            style: TextStyle(color: grayChateau, fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
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
          )
        ],
      ),
    );
  }
}
