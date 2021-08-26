import 'package:cvg/Providers/data_provider.dart';
import 'package:cvg/widgets/action_button.dart';
import 'package:cvg/widgets/configure_widget.dart';
import 'package:cvg/widgets/console.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue[900],
          toolbarHeight: 90,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "ICQ",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Integrated Code Quality Centre",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConfigureWidget(),
              Divider(
                thickness: 5,
                color: Colors.blue,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ActioButtons(),
                    Console(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(),
                  Container(
                    width: 0.1 * size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (data.item.length == 0) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "No Report Found",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  content: Text(
                                    "Please trigger some actions to download the \nbuild report",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  actions: [
                                    // TextButton(
                                    //   onPressed: () =>
                                    //       Navigator.pop(context, 'Cancel'),
                                    //   child: const Text('Cancel'),
                                    // ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        } else {
                          data.fileSaver(data.item.toString());
                        }
                      },
                      child: Text("Download"),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    width: 0.1 * size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        data.itemClear();
                        data.responseKeyList = [];
                        data.responseValueList = [];
                      },
                      child: Text("Clear"),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
