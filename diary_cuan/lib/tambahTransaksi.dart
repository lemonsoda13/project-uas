import 'package:diary_cuan/api/model/transaksimodel.dart';
import 'package:diary_cuan/api/service/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahTransaksi extends StatefulWidget {
  const TambahTransaksi({Key? key}) : super(key: key);

  @override
  State<TambahTransaksi> createState() => _TambahTransaksiState();
}

class _TambahTransaksiState extends State<TambahTransaksi> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController kategori = TextEditingController();
  TextEditingController nominal = TextEditingController();
  TextEditingController detail = TextEditingController();

  late TransaksiApiService transaksiApiService;
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    transaksiApiService = TransaksiApiService();
    super.initState();
  }

  final listChoices = <ItemChoice>[
    ItemChoice(1, 'Pemasukan'),
    ItemChoice(2, 'Pengeluaran'),
  ];
  var idSelected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Transaksi"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25, left: 25, right: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Color(0xFFD9D9D9)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  children: listChoices
                      .map((e) => ChoiceChip(
                            label: Text(
                              e.label,
                              style: TextStyle(
                                  color: idSelected == e.id
                                      ? Color(0xFF332FD0)
                                      : Colors.black),
                            ),
                            selected: idSelected == e.id,
                            selectedColor: Colors.white,
                            padding: const EdgeInsets.only(left: 22, right: 22),
                            onSelected: (_) =>
                                setState(() => idSelected = e.id),
                          ))
                      .toList(),
                  spacing: 25,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22, left: 25, right: 25, bottom: 18),
            child: TextFormField(
                controller: dateinput,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.calendar_today,
                    size: 40,
                  ),
                  labelText: "Tanggal",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy - MM - dd').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      dateinput.text = formattedDate;
                    });
                  }
                }),
          ),
          Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 18),
              child: TextFormField(
                controller: kategori,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.book_outlined,
                    size: 40,
                  ),
                  labelText: "Kategori",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 18),
              child: TextFormField(
                controller: nominal,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.calculate_outlined,
                    size: 40,
                  ),
                  labelText: "Jumlah",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              )),
          Container(
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 18),
              child: TextFormField(
                controller: detail,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.edit,
                    size: 40,
                  ),
                  labelText: "Keterangan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              )),
          Container(
              margin: EdgeInsets.only(right: 50, left: 50),
              child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika button diklik
                  uploadDat();
                },
                child: Text("Tombol"),
              ))
        ],
      ),
    );
  }

  void uploadDat() {
    var jenis;

    if(idSelected==1){
      jenis = "Pemasukan";
    }else{
      jenis = "Pengeluaran";
    }
    TransaksiModel model = TransaksiModel(
        id_transaksi: '',
        id_user: '',
        id_kategori: '',
        jenis_transaksi: '',
        nominal: '',
        detail: '',
        jenis_detail: '',
        tanggal_transaksi: ''
      );

      model.id_user = '12345';
      model.id_kategori = '1234';
      model.jenis_transaksi = jenis;
      model.nominal = nominal.text;
      model.detail = detail.text;
      model.jenis_detail = "null";
      model.tanggal_transaksi = dateinput.text;

    transaksiApiService.createTransaksi(model).then((value) => print("ok"));
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
