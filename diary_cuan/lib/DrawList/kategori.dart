import 'dart:ui';
import 'package:diary_cuan/DrawList/theme.dart';
import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: MyPageKategori(),
    );
  }
}
class MyPageKategori extends StatefulWidget {
  const MyPageKategori({Key? key, this.onTap}) : super(key: key);
  final GestureTapCallback? onTap;

  @override
  State<MyPageKategori> createState() => _MyPageKategoriState();
}

class _MyPageKategoriState extends State<MyPageKategori> {
  MethodModel? selectedValue;
  List<MethodModel> methodData = [
    MethodModel(1, 'Pemasukan'),
    MethodModel(2, 'Pengeluaran')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = methodData[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 74,
        leading: Icon(Icons.arrow_back),
        title: DropdownButton<MethodModel>(
            value: selectedValue,
            dropdownColor: primaryColor,
            underline: Container(),
            iconEnabledColor: Colors.white,
            items: methodData
                .map((e) => DropdownMenuItem<MethodModel>(
                      child: Text(
                        e.name ?? '-',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
            }),
      ),
      body: selectedValue?.id == 1
          ? Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/icon-1.png"),
                  title: Text(
                    "Hasil Freelance",
                    style: textStyle,
                  ),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Image.asset("assets/icon-2.png"),
                  title: Text(
                    "Gaji",
                    style: textStyle,
                  ),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Image.asset("assets/icon-3.png"),
                  title: Text(
                    "Hadiah",
                    style: textStyle,
                  ),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xffA760FF)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/vector-invest.png"),
                      )),
                  title: Text(
                    "Investasi",
                    style: textStyle,
                  ),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                )
              ],
            )
          : Column(
              children: [
                ListTile(
                  leading: Image.asset("assets/icon-5.png"),
                  title: Text(
                    "Health",
                    style: textStyle,
                  ),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Image.asset("assets/icon-6.png"),
                  title: Text("Transportasi", style: textStyle),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Image.asset("assets/icon-7.png"),
                  title: Text("SPP Kuliah", style: textStyle),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Container(
                            width: MediaQuery.of(context).size.width * .3,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/bxs_eraser.png"),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Hapus",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: primaryColor
                                ),),
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .3,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
                ListTile(
                  leading: Image.asset("assets/icon-8.png"),
                  title: Text("Makanan Anjing", style: textStyle),
                  trailing: PopupMenuButton(
                      color: Color.fromARGB(255, 233, 229, 229),
                      icon: Icon(Icons.more_horiz),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Container(
                                width: MediaQuery.of(context).size.width * .3,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset("assets/bxs_eraser.png"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Hapus",style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: primaryColor
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/fe_edit.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Edit",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor
                                  ),),
                                ],
                              ),
                            )),
                          ]),
                ),
              ],
            ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: InkWell(
              onTap: (){

              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: primaryColor, width: 1),
                          ),
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.add_rounded,
                            color: primaryColor,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'TAMBAH KATEGORI',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MethodModel {
  int? id;
  String? name;
  MethodModel(this.id, this.name);
}
