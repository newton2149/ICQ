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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                "Available Scans ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              curve: Curves.bounceIn,
              padding: EdgeInsets.all(70),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 30,
            ),
            ActioButtons(),
          ],
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
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
                  padding: EdgeInsets.only(top: 10, right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          // ActioButtons(),
                          // Spacer(),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Spacer(),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 200,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (data.item.length == 0) {
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "No Report Found",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              content: Text(
                                                "Please trigger some actions to download the \nbuild report",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              actions: [
                                                // TextButton(
                                                //   onPressed: () =>
                                                //       Navigator.pop(context, 'Cancel'),
                                                //   child: const Text('Cancel'),
                                                // ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      data.fileSaver(data.item.toString());
                                    }
                                  },
                                  child: Text("Download Report"),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 200,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (data.item.length != 0) {
                                      data.itemClear();
                                      data.responseKeyList = [];
                                      data.responseValueList = [];
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                "Nothing to Clear",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Text("Clear Console"),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              )
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   width:,
                      // ),
                      Console(),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
