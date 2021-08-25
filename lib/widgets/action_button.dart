import 'package:cvg/Providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActioButtons extends StatelessWidget {
  const ActioButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = Provider.of<DataProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.only(top: 30, bottom: 30),
      height: size.height * 0.4,
      width: 0.14 * size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Actions",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 0.1 * size.width,
            child: ElevatedButton(
              onPressed: () {
                // print(data.gitRepoName.text);
                data.itemClear();
                data.responseKeyList = [];
                data.responseValueList = [];
                if (data.public) {
                  data
                      .postMethodPublic("HC")
                      .then((value) => print("Succesful"));
                } else {
                  data
                      .postMethodPrivate("HC")
                      .then((value) => print("Succesful"));
                }
              },
              child: Text("Hard Coding"),
            ),
          ),
          Container(
            width: 0.1 * size.width,
            child: ElevatedButton(
              onPressed: () {
                data.itemClear();
                data.responseKeyList = [];
                data.responseValueList = [];
                if (data.public) {
                  data
                      .postMethodPublic("SS")
                      .then((value) => print("Succesful"));
                } else {
                  data
                      .postMethodPrivate("SS")
                      .then((value) => print("Succesful"));
                }
              },
              child: Text("Static Scan"),
            ),
          ),
          Container(
            width: 0.1 * size.width,
            child: ElevatedButton(
              onPressed: () {
                data.itemClear();
                data.responseKeyList = [];
                data.responseValueList = [];
                if (data.public) {
                  data
                      .postMethodPublic("CA")
                      .then((value) => print("Succesful"));
                } else {
                  data
                      .postMethodPrivate("CA")
                      .then((value) => print("Succesful"));
                }
              },
              child: Text("Code Analysis"),
            ),
          ),
          Container(
            width: 0.1 * size.width,
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
          Container(
            width: 0.1 * size.width,
            child: ElevatedButton(
              onPressed: () {
                data.itemClear();
                data.responseKeyList = [];
                data.responseValueList = [];
                if (data.public) {
                  data
                      .postMethodPublic("BP")
                      .then((value) => print("Succesful"));
                } else {
                  data
                      .postMethodPrivate("BP")
                      .then((value) => print("Succesful"));
                }
              },
              child: Text("Best Practices"),
            ),
          ),
          Container(
            width: 0.1 * size.width,
            child: ElevatedButton(
              onPressed: () {
                data.itemClear();
                data.responseKeyList = [];
                data.responseValueList = [];
                if (data.public) {
                  data
                      .postMethodPublic("CC")
                      .then((value) => print("Succesful"));
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
      ),
    );
  }
}
