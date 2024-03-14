// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:front_end/model/model_register.dart';
import 'package:front_end/page_login.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  Future<ModelRegister?> registerAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http
          .post(Uri.parse('http://10.127.220.59/kamusDb/register.php'), body: {
        "fullname": fullname.text,
        "username": username.text,
        "password": pass.text,
        "email": email.text,
      });
      ModelRegister data = modelRegisterFromJson(res.body);

      if (data.value == 1 && data.value != null) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => PageLogin()),
            (route) => false);
      } else if (data.value == 2 && data.value != null) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
        print(e.toString());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // registerAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: keyForm,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: fullname,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Fullname",
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.blue.shade300),
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: username,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: email,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: pass,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      registerAccount();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("silahkan isi data terlebih dahulu")));
                    }
                  },
                  color: Colors.purple,
                  textColor: Colors.white,
                  height: 45,
                  child: const Text("Register"),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => PageLogin()),
                (route) => false);
          },
          child: Text("anda sudah punya akun ? silahkan login"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(width: 1, color: Colors.purple)),
        ),
      ),
    );
  }
}
