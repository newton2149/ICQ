import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/Material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
// import 'package:yaml/yaml.dart';
// import "package:flutter/services.dart" as s;

class DataProvider with ChangeNotifier {
  bool public = false;
  var username = TextEditingController();
  var password = TextEditingController();
  var gitRepoName = TextEditingController();
  Map<String, dynamic> item = {};
  var action = "";
  var responseKeyList = [];
  var responseValueList = [];

  Map get toJsonPublic {
    return {
      "GitUrl": gitRepoName,
      "isPublic": public,
      "Actions": action,
    };
  }

  Map get toJsonPrivate {
    return {
      "GitUrl": gitRepoName,
      "isPublic": public,
      "Actions": action,
      "Username": username,
      "Password": password,
    };
  }

  set publicKey(bool str) {
    this.public = str;
  }

  // set userName(String str) {
  //   this.userName = str;
  // }

  // set passWord(String str) {
  //   this.passWord = str;
  // }

  // set gitRepoNameSetter(String str) {
  //   this.gitRepoName = str;
  // }

  void falser() {
    this.public = !this.public;
    notifyListeners();
  }

  void listUpdate() {
    this.item.forEach((key, value) {
      this.responseKeyList.add(key);
      this.responseValueList.add(value);
    });
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${DateTime.now()}.txt');
  }

  Future<File> writeFile(String str) async {
    final file = await _localFile;
    return file.writeAsString(str);
  }

  Future postMethodPublic(String action) async {
    print("Entered PostMethod Public");
    // final data = await s.rootBundle.loadString('assets/config.yaml');
    // final mapData = jsonDecode(loadYaml(data)) as Map;
    try {
      http.Response response = await http.get(
        Uri.parse("https://reqres.in/api/users/2 "),
        // body: {
        //   "GitUrl": gitRepoName.text,
        //   "isPublic": public,
        //   "Actions": action,
        // },
      );
      if (response.statusCode == 200) {
        this.item = jsonDecode(response.body);
        listUpdate();
        // writeFile(this.item.toString()).then((value) => print("File saved"));
        notifyListeners();
      }
    } catch (err) {
      print(err.toString());
    }
  }

  void itemClear() {
    this.item = {};
    notifyListeners();
  }

  Future postMethodPrivate(String action) async {
    print("Entered PostMethod Private");
    final Map json = {
      "GitUrl": gitRepoName.text,
      "isPublic": public,
      "Actions": action,
      "Username": username.text,
      "Password": password.text,
    };

    try {
      http.Response response = await http.post(
          Uri.parse("https://reqres.in/api/users"),
          body: jsonEncode(json));
      if (response.statusCode == 201) {
        this.item = jsonDecode(response.body);
        listUpdate();
        notifyListeners();
      }
    } catch (err) {
      print(err.toString());
    }
  }
}
