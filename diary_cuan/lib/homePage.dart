import 'package:diary_cuan/drawer.dart';
import 'package:diary_cuan/tambahTransaksi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime date = DateTime.now();
  late var formattedDate;
  @override
  void initState() {
    formattedDate = DateFormat('MMMM  yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 38,
        // Changing Drawer Icon Size
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Text(
                  formattedDate,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () async {
                  final selected = await showMonthYearPicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      setState(() {
                        date = selectedDate;
                        formattedDate =
                            DateFormat('MMMM  yyyy').format(selectedDate);
                      });
                    }
                  });
                },
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.search,
              size: 38,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xFF332FD0).withOpacity(0.5),
              child: Column(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 17, left: 17, bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 50,
                      color: Colors.white,
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Saldo",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "10.000.000",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                )
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SizedBox(
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Color.fromARGB(255, 213, 250, 200),
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Pemasukan",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.file_download_outlined,
                              color: Color.fromARGB(255, 55, 204, 9),
                            )),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 14, right: 14),
                          child: Text(
                            "12.000.000",
                            style: TextStyle(
                                color: Color.fromARGB(255, 3, 202, 30),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 150,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Color.fromARGB(255, 250, 200, 200),
                      child: Column(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Pengeluaran",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6))),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 8),
                            child: Icon(Icons.file_upload_outlined,
                                color: Color.fromARGB(255, 204, 9, 9))),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: 10, left: 14, right: 14),
                          child: Text("2.000.000",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 202, 3, 3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, right: 25, left: 25),
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Icon(
                  Icons.pets,
                  size: 32,
                  color: Colors.purple,
                ),
                title: Text(
                  "Makanan Anjing",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text("Dog Food"),
                      ),
                      Text(
                        "30 June 2022",
                        style: TextStyle(fontSize: 12),
                      )
                    ]),
                trailing: Wrap(children: <Widget>[
                  Icon(Icons.file_upload_outlined,
                      color: Color.fromARGB(255, 204, 9, 9)),
                  SizedBox(
                    width: 6.0,
                  ),
                  Text("50.000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 202, 3, 3), fontSize: 14)),
                ]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, right: 25, left: 25),
            child: Card(
              elevation: 0,
              child: ListTile(
                leading: Icon(
                  Icons.directions_bus,
                  size: 32,
                  color: Colors.green,
                ),
                title: Text(
                  "Transportasi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text("PP kerja"),
                      ),
                      Text(
                        "30 June 2022",
                        style: TextStyle(fontSize: 12),
                      )
                    ]),
                trailing: Wrap(children: <Widget>[
                  Icon(Icons.file_upload_outlined,
                      color: Color.fromARGB(255, 204, 9, 9)),
                  SizedBox(
                    width: 7.0,
                  ),
                  Text("7.000",
                      style: TextStyle(
                          color: Color.fromARGB(255, 204, 9, 9), fontSize: 14)),
                ]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          backgroundColor: Color(0xFF332FD0),
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahTransaksi()),
            );
          }),
          drawer: NavigationDrawer(),
    );
  }
}
