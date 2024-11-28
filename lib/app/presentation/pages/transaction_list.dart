import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezos_asessment/app/data/bloc/transaction_cubit.dart';
import 'package:tezos_asessment/app/presentation/pages/transaction_details.dart';
import 'package:tezos_asessment/core/app_colors.dart';
import 'package:tezos_asessment/core/utils.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  TransactionCubit transactionCubit = TransactionCubit();

  @override
  void initState() {
    transactionCubit.fetchLatestBlock();
    super.initState();
  }
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
          "BTC transactions",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<TransactionCubit, TransactionState>(
        bloc: transactionCubit,
        listener: (context, state) {
         if(state is TransactionBlockSuccess){
           transactionCubit.fetchTransactions(hashBlock: state.transactionBlockResponse.hash ?? '');
         }

        },
        builder: (BuildContext context, TransactionState state) {
          if(state is TransactionBlockLoading){
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(color: salemGreen,),),
                ),
                SizedBox(height: 40,),
                Text('Fetching your {BTC} transactions', style: TextStyle(fontSize: 18),),
              ],
            );
          }
          if(state is TransactionSuccess){

            return ListView.separated(
              itemCount: state.transactionResponse.tx?.length ?? 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  TransactionDetails(transaction: state.transactionResponse.tx?[index],)));
                  },
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  title:  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text( state.transactionResponse.tx?[index].hash ?? 'N/A', overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),),
                  ),
                  subtitle: Text(formatTimestamp(state.transactionResponse.tx?[index].time ?? 0), style: TextStyle(color: Colors.black.withOpacity(0.56)),),
                  trailing: SvgPicture.asset(
                    "assets/chevron-right.svg",
                    height: 24,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.32), BlendMode.srcIn),
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
            ) ;
          }
          if(state is TransactionBlockError){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(state.error, style: const TextStyle(fontSize: 18),),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 24),
                    elevation: 0,
                    backgroundColor: salemGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Retry'), // Button's label
                )
              ],
            );
          }
         return const SizedBox.shrink();
        },
      ),
    );
  }
}
