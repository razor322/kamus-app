// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:front_end/model/model_kamus.dart';

class PageDetail extends StatelessWidget {
  final Datum? data;
  const PageDetail(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        centerTitle: true,
        title: Text(
          "${data?.kataIndonesia}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                      // controller: txtcari,
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
              height: 15,
            ),
            Container(
              // height: 471,
              decoration: BoxDecoration(
                  color: Colors.purple.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        // width: 150,
                        // height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.purple.shade200,
                              Colors.blue.shade200
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "KATA ${data?.jenisKata.name}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Kata - Word",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Indonesia : ${data?.kataIndonesia}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Jerman     : ${data?.kataJerman}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Arti - Meaning",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Indonesia",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("${data?.artiIndonesia}"),
                          Text(
                            "Jerman",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("${data?.artiJerman}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Contoh - Example",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Indonesia",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("${data?.contohIndonesia}"),
                          Text(
                            "Jerman",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          Text("${data?.contohJerman}"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   width: 200,
            //   height: 120,
            //   decoration: BoxDecoration(
            //       color: Colors.purple.shade100,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Kata - Word",
            //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //         SizedBox(
            //           height: 15,
            //         ),
            //         Text(
            //           "Indonesia : ${data?.kataIndonesia}",
            //           style: TextStyle(fontSize: 16),
            //         ),
            //         Text(
            //           "Jerman     : ${data?.kataJerman}",
            //           style: TextStyle(fontSize: 16),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.infinity,
            //   // height: 150,
            //   decoration: BoxDecoration(
            //       color: Colors.blue.shade200,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Arti - Meaning",
            //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //         Text(
            //           "Indonesia",
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            //         ),
            //         Text("${data?.artiIndonesia}"),
            //         Text(
            //           "Jerman",
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            //         ),
            //         Text("${data?.artiJerman}"),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.infinity,
            //   // height: 150,
            //   decoration: BoxDecoration(
            //       color: Colors.blue.shade200,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Contoh - Example",
            //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         ),
            //         Text(
            //           "Indonesia",
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            //         ),
            //         Text("${data?.contohIndonesia}"),
            //         Text(
            //           "Jerman",
            //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            //         ),
            //         Text("${data?.contohJerman}"),
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              color: Colors.purple.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
