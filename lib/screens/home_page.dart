import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huduma/cubit/huduma/huduma_cubit.dart';
import 'package:huduma/cubit/huduma_repo_dao.dart';
import 'package:provider/provider.dart';
import '../models/huduma_response.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HudumaCubit hudumaCubit;
  late String idNumber;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    hudumaCubit = HudumaCubit(
      Provider.of<HudumaResponseDao>(context),
    );
    super.didChangeDependencies();
  }

  void dispose() {
    super.dispose();
    hudumaCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return hudumaCubit;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF800000),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildUpperPart(context),
            buildLowerPart(context),
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
        return Form(
          key: _formKey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight * 0.8,
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
                  onSaved: (value) {
                    idNumber = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                  },
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter Id number",
                    hintStyle: TextStyle(color: Colors.white70),
                    errorStyle: TextStyle(color: Colors.orange),
                    contentPadding: EdgeInsets.only(left: 5.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
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
                    minimumSize: Size(double.infinity, 40),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      hudumaCubit.checkHudumaNumberState(
                        idNumber: idNumber,
                      );
                    }
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
                      : Text(
                          "Check card status",
                          style: TextStyle(fontSize: 15),
                        ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          minimumSize: Size(double.infinity, 40),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/history");
        },
        child: Text(
          "View search history",
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      ),
    );
  }
}
