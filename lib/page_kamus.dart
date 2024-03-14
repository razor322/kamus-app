// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:front_end/model/model_kamus.dart';
import 'package:front_end/page_detail_kamus.dart';
import 'package:front_end/page_login.dart';
import 'package:front_end/utils/cekSession.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PageKamus extends StatefulWidget {
  const PageKamus({super.key});

  @override
  State<PageKamus> createState() => _PageKamusState();
}

class _PageKamusState extends State<PageKamus> {
  bool isCari = false;
  bool isLoading = true;
  List<String> filterData = [];
  List<Datum?> listKamus = [];
  TextEditingController txtcari = TextEditingController();

  _PageKamusState() {
    txtcari.addListener(() {
      if (txtcari.text.isEmpty) {
        setState(() {
          isCari = true;
          txtcari.text = '';
        });
      } else {
        setState(() {
          isCari = false;
          txtcari.text != "";
        });
      }
    });
  }
  Future<List<Datum>?> getKamus() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http
          .get(Uri.parse('http://10.127.220.59/kamusDb/getKamus.php'));
      var data = jsonDecode(res.body);
      setState(() {
        for (var i in data['data']) {
          listKamus.add(Datum.fromJson(i));
        }
      });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
        print(e.toString());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKamus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  session.clearSession();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PageLogin()),
                      (route) => false);
                });
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.purple.shade200,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "images/kamus.png",
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Indonesia - Jerman",
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    controller: txtcari,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(Icons.search, size: 25),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.deepPurple.shade100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          isCari
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: ListView.builder(
                          itemCount: listKamus.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Datum? data = listKamus[index];
                                  ;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PageDetail(data)));
                                },
                                child: Card(
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.send,
                                      color: Colors.black26,
                                    ),
                                    title: Text(
                                      '${listKamus[index]?.kataIndonesia}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      "${listKamus[index]?.kataJerman}",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              : createFilterList()
        ],
      ),
    );
  }

  Widget createFilterList() {
    filterData = [];
    for (int i = 0; i < listKamus.length; i++) {
      var item = listKamus[i];
      if (item!.kataIndonesia
          .toLowerCase()
          .contains(txtcari.text.toLowerCase())) {
        filterData.add(item!.kataIndonesia);
      }
    }
    return HasilSearch();
  }

  Widget HasilSearch() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.purple.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView.builder(
            itemCount: filterData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Datum? data = listKamus.firstWhere(
                      (element) => element?.kataIndonesia == filterData[index],
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PageDetail(data)));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.abc),
                      trailing: Icon(
                        Icons.send,
                        color: Colors.black26,
                      ),
                      title: Text(
                        '${listKamus[index]?.kataJerman}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${filterData[index]}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
