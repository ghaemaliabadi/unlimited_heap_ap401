import 'dart:io';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:unlimited_heap_ap401/screens/SignUpPage.dart';

import '../models/trip.dart';
import '../models/userinfo.dart';
import 'PaymentSuccess.dart';
import 'ProjectMainPage.dart';
import 'SellerPage.dart';
import 'dart:convert' show utf8;

// ignore: must_be_immutable
class ShowSalesAnalysis extends StatefulWidget {
  User user;
  bool? lastMonth;
  bool? last3Month;
  bool? last6Month;
  bool? lastYear;

  ShowSalesAnalysis({
    Key? key,
    required this.user,
    this.lastMonth,
    this.last3Month,
    this.last6Month,
    this.lastYear,
  }) : super(key: key);
  final String title = 'آنالیز فروش';
  static const String ip = "127.0.0.1";
  static const int port = 1234;

  @override
  State<ShowSalesAnalysis> createState() => _ShowSalesAnalysisState();
}

class _ShowSalesAnalysisState extends State<ShowSalesAnalysis> {


  @override
  void initState() {
    widget.lastMonth ??= true;
    widget.last3Month ??= false;
    widget.last6Month ??= false;
    widget.lastYear ??= false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: Text(widget.title + ' - ' + widget.user.firstName!,
            style: Theme.of(context).textTheme.displayMedium),
      ),
      body: InkWell(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: Text('Chart'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            widget.lastMonth = true;
                            widget.last3Month = false;
                            widget.last6Month = false;
                            widget.lastYear = false;
                            _getTakenTripsForCompany(context, widget.user.firstName!);
                          });
                        }, child: buildButton('ماه گذشته', widget.lastMonth)),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            widget.lastMonth = false;
                            widget.last3Month = true;
                            widget.last6Month = false;
                            widget.lastYear = false;
                            _getTakenTripsForCompany(context, widget.user.firstName!);
                          });
                        }, child: buildButton('3 ماه گذشته', widget.last3Month)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            widget.lastMonth = false;
                            widget.last3Month = false;
                            widget.last6Month = true;
                            widget.lastYear = false;
                            _getTakenTripsForCompany(context, widget.user.firstName!);
                          });
                        }, child: buildButton('6 ماه گذشته', widget.last6Month)),
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            widget.lastMonth = false;
                            widget.last3Month = false;
                            widget.last6Month = false;
                            widget.lastYear = true;
                            _getTakenTripsForCompany(context, widget.user.firstName!);
                          });
                        }, child: buildButton('سال گذشته', widget.lastYear)),
                    ],
                ),
              ],
            ),
          )),
    );
  }

  Container buildButton(input, isActive) {
    return Container(
      height: 50,
      width: 180,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        color: () {
          if (isActive) {
            return Theme.of(context).colorScheme.primary;
          } else {
            return Theme.of(context).colorScheme.secondary;
          }
        }(),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 1),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            input,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 22,
                  color: () {
                    return (!isActive) ? Colors.black : Colors.white;
                  }(),
                ),
          ),
        ],
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String message, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: (isError
            ? Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.red)
            : Theme.of(context).textTheme.displaySmall),
      ),
      duration: const Duration(seconds: 1),
      backgroundColor: Theme.of(context).colorScheme.secondary,
    ),
  );
}



Future<String> _getTakenTripsForCompany(context, company) async {
  String response = "false";
  await Socket.connect(SellerPage.ip, SellerPage.port).then((serverSocket) {
    print("Connected!");
      serverSocket.write("getTakenTripsForCompany-$company*");
    serverSocket.flush();
    print("Sent data!");
    serverSocket.listen((socket) {
      response = utf8.decode(socket);
      List<String> transactions = response.split('*');
    });
  });
  return Future.delayed(const Duration(milliseconds: 1000), () {
    return response;
  });
}

showDialogLoading(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 10),
            Text('لطفا صبر کنید'),
          ],
        ),
      );
    },
  );
}