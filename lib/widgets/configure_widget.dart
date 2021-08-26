import 'package:cvg/Providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigureWidget extends StatelessWidget {
  final bool public = false;
  final gitUrl = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 30, left: 45),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "Repo Name : ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 0.2 * size.width,
                      child: TextField(
                        controller: data.gitRepoName,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: size.width * 0.12,
                    child: RadioListTile(
                        title: Text(
                          "Private",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        value: false,
                        groupValue: data.public,
                        onChanged: (dynamic value) {
                          data.falser();
                        }),
                  ),
                  Container(
                    width: size.width * 0.12,
                    child: RadioListTile(
                        title: Text(
                          "Public",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        value: true,
                        groupValue: data.public,
                        onChanged: (dynamic value) {
                          data.falser();
                        }),
                  ),
                ],
              ),
              data.public
                  ? Text("")
                  : Column(children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 60,
                        width: 0.18 * size.width,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: data.username,
                          decoration: InputDecoration(
                            labelText: "UserName",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 0.18 * size.width,
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          controller: data.password,
                          decoration: InputDecoration(
                            labelText: "PassWord",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ]),
              Container(
                height: 45,
                width: 0.12 * size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (data.public) {
                        data.isVerifiedPublic();
                      } else {
                        data.isVerifiedPublic();
                      }
                      var verified = data.verified["exists"];
                      // var verified = true;
                      String displayText = "";
                      if (verified) {
                        displayText = "succesfully";
                      } else {
                        displayText = "and does not exist";
                      }
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Verification Status",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text(
                                "${data.gitRepoName.text} verified $displayText with  \nbranch -> ${data.verified["fullBranchName"]} ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                    data.verified = {};
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          });

                      print(data.gitRepoName.text);
                    },
                    child: Text("Verify")),
              )
            ],
          ),
        ],
      ),
    );
  }
}
