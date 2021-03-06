import 'package:cvg/Providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Console extends StatelessWidget {
  const Console({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final data = Provider.of<DataProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          padding: EdgeInsets.all(20),
          width: size.width * 0.7,
          height: size.height * 0.6,
          decoration: BoxDecoration(color: Colors.black),
          child: ListView.builder(
            itemBuilder: (ctx, i) {
              return Text(
                "${data.responseKeyList[i]} : ${data.responseValueList[i]} \n",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
            itemCount: data.responseKeyList.length,
          ),
        ),
      ),
    );
  }
}
