import 'package:cvg/Providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActioButtons extends StatelessWidget {
  const ActioButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = 200;
    double height = 30;
    final data = Provider.of<DataProvider>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              // print(data.gitRepoName.text);
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data.postMethodPublic("HC").then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("HC")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Hard Coding"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data.postMethodPublic("SS").then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("SS")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Static Scan"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data.postMethodPublic("CA").then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("CA")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Code Analysis"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data
                    .postMethodPublic("SES")
                    .then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("SES")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Security Scan"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data.postMethodPublic("BP").then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("BP")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Best Practices"),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: w,
          height: height,
          child: ElevatedButton(
            onPressed: () {
              data.itemClear();
              data.responseKeyList = [];
              data.responseValueList = [];
              if (data.public) {
                data.postMethodPublic("CC").then((value) => print("Succesful"));
              } else {
                data
                    .postMethodPrivate("CC")
                    .then((value) => print("Succesful"));
              }
            },
            child: Text("Code Coverage"),
          ),
        ),
      ],
    );
  }
}
