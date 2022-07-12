import 'package:diary_cuan/api/model/kategorimodel.dart';
import 'package:diary_cuan/api/service/serviceskategori.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  State<TambahKategori> createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
  TextEditingController namakategori = TextEditingController();

  late KategoriApiService kategoriApiService;
  //text editing controller for text field

  @override
  void initState() {
    kategoriApiService = KategoriApiService();
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
        title: Text("Tambah Kategori"),
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
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 18),
              child: TextFormField(
                controller: namakategori,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.book_outlined,
                    size: 40,
                  ),
                  labelText: "Nama Kategori",
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
                child: Text("Tambah"),
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
    KategoriModel model = KategoriModel(
        id_kategori: '',
        jenis_kategori: '',
        nama_kategori: '',
      );

      model.jenis_kategori = jenis;
      model.nama_kategori = namakategori.text;

    kategoriApiService.createKategori(model).then((value) => print("ok"));
  }
}

class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}
