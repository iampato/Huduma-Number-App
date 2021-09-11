import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huduma/cubit/huduma/huduma_cubit.dart';
import 'package:huduma/cubit/huduma_records/hudumarecords_cubit.dart';
import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:huduma/models/huduma_response.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HudumarecordsCubit hudumarecordsCubit;

  void didChangeDependencies() {
    hudumarecordsCubit = HudumarecordsCubit(
      Provider.of<HudumaResponseDao>(context),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => hudumarecordsCubit..getRecords(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Search history"),
        ),
        body: BlocConsumer<HudumarecordsCubit, HudumarecordsState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loaded: (data, msg) {
                if (msg != "") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(msg)),
                  );
                }
              },
              error: (error) {},
            );
          },
          builder: (context, state) {
            return state.when(
              initial: () {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                );
              },
              loaded: (data, msg) {
                return data.isEmpty
                    ? Center(
                        child: Text("data is empty"),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: data.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 15);
                        },
                        itemBuilder: (context, index) {
                          var singleItem = data[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              top: index == 0 ? 10 : 0,
                            ),
                            child: SearchHistoryItem(
                              key: UniqueKey(),
                              hudumaResponse: singleItem,
                              hudumarecordsCubit: hudumarecordsCubit,
                            ),
                          );
                        },
                      );
              },
              error: (error) {
                return Center(
                  child: Text(error),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SearchHistoryItem extends StatefulWidget {
  final HudumaResponse hudumaResponse;
  final HudumarecordsCubit hudumarecordsCubit;
  const SearchHistoryItem({
    Key? key,
    required this.hudumaResponse,
    required this.hudumarecordsCubit,
  }) : super(key: key);

  @override
  _SearchHistoryItemState createState() => _SearchHistoryItemState();
}

class _SearchHistoryItemState extends State<SearchHistoryItem> {
  HudumaResponse get data => widget.hudumaResponse;
  HudumarecordsCubit get hudumarecordsCubit => widget.hudumarecordsCubit;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 300),
      dividerColor: Colors.red,
      elevation: 0,
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 10,
                  ),
                  child: data.status == "success"
                      ? Text(
                          ("PRINTING STATUS: ${data.printingStatus}\n" +
                                  "STATUS: ${data.collectionStatus}\n" +
                                  "DELIVIERY POINT: ${data.deliveryPoint}")
                              .toUpperCase(),
                          style: TextStyle(
                            color: Color(0xFF000073),
                            fontSize: 15,
                          ),
                        )
                      : Text(
                          data.message,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: Colors.green,
                        elevation: 0,
                        onPressed: () {
                          hudumarecordsCubit.checkHudumaNumberState(
                            idNumber: data.idNumber,
                          );
                        },
                        child: Text("Re-check"),
                      ),
                      MaterialButton(
                        color: Colors.deepOrange,
                        elevation: 0,
                        onPressed: () {
                          hudumarecordsCubit.deleteRecord(data.idNumber);
                        },
                        child: Text("Delete"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 7.0,
                      ),
                      child: Text("ID"),
                    ),
                  ),
                ),
                Text(data.idNumber),
              ],
            );
          },
          isExpanded: isExpanded,
        )
      ],
      expansionCallback: (int item, bool status) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
    );
  }
}
