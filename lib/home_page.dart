import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huduma/cubit/huduma_cubit.dart';
import 'models/huduma_response.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  HudumaCubit hudumaCubit = HudumaCubit();

  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
    hudumaCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return hudumaCubit;
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: buildUpperPart(context),
            ),
            // Flexible(
            //   child: buildLowerPart(context),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildUpperPart(BuildContext context) {
    return BlocConsumer(
      bloc: hudumaCubit,
      listener: (context, HudumaState state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (data, message) {
            showResults(context, data);
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("An error occured")),
            );
          },
        );
      },
      builder: (context, state) {
        return Container(
          color: Color(0xFF800000),
          width: double.infinity,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight,
                  left: 15,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Huduma Number Self-check",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.info,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "Public Caution",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              content: Text(
                                "I am not responsible for any information in this software" +
                                    "hence I am not realible for any action you may take. \n \n" +
                                    "Also any use of this software, does not directly attach to me",
                              ),
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 35,
                ),
                child: Text(
                  "Get your Huduma Card registration status and delivery address confirmation.",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 5,
                ),
                child: Text(
                  "The purpose of this initiative is to create and manage a central master " +
                      "population database which will be the 'single source of truth' on a person's identity.",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white70,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                  bottom: 5,
                ),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Id number",
                    hintStyle: TextStyle(color: Colors.white70),
                    contentPadding: EdgeInsets.only(left: 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: Size(double.infinity, 35),
                  ),
                  onPressed: _controller.text == ""
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();
                          hudumaCubit.checkHudumaNumberState(
                            idNumber: _controller.text,
                          );
                        },
                  child: state == HudumaState.loading()
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            backgroundColor: Colors.white,
                          ),
                        )
                      : Text("Check card status"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future showResults(BuildContext context, HudumaResponse data) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Card status"),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 25.0,
                ),
                child: SvgPicture.asset(
                  "assets/huduma-card.svg",
                  semanticsLabel: ' Logo',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Text("Id number"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 2,
                        height: 16,
                        color: Colors.black45,
                      ),
                    ),
                    Opacity(
                      opacity: 0.8,
                      child: Text(data.idNumber),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 15,
                ),
                child: data.status == "success"
                    ? Text(
                        ("PRINTING STATUS: ${data.printingStatus}\n" +
                                "STATUS: ${data.collectionStatus}\n" +
                                "DELIVIERY POINT: ${data.deliveryPoint}")
                            .toUpperCase(),
                        style: TextStyle(
                          color: Color(0xFF000073),
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        data.message,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 35),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildLowerPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 10,
            bottom: 0,
          ),
          child: Text(
            "Previous search results:",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                title: RichText(
                  text: TextSpan(
                    text: "ID No: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: "36433941",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  child: Icon(Icons.done, color: Colors.black),
                ),
                subtitle: Text("success"),
              );
            },
          ),
        )
      ],
    );
  }
}
