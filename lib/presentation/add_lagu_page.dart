// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mastering_flutter_part_1/presentation/widgets/image_picker_widget.dart';

import '../data/datasources/lagu_remote_datasource.dart';
import '../data/datasources/pulau_remote_datasource.dart';
import '../data/models/lagu_model.dart';
import '../data/models/pulau_response_model.dart';

class AddLaguPage extends StatefulWidget {
  bool isUpdate;
  LaguModel? lagu;
  AddLaguPage({
    super.key,
    this.isUpdate = false,
    this.lagu,
  });

  @override
  State<AddLaguPage> createState() => _AddLaguPageState();
}

class _AddLaguPageState extends State<AddLaguPage> {
  List<Pulau> pulau = [];

  void getPulau() async {
    final response = await PulauRemoteDatasource().getPulau();
    setState(() {
      pulau = response.data!;
    });
  }

  final TextEditingController judulController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController ibukotaController = TextEditingController();

  final TextEditingController asalPulauController = TextEditingController();
  final TextEditingController lyricsController = TextEditingController();

  final TextEditingController imageController = TextEditingController();
  int? pulauId;
  bool isUploadImage = false;
  XFile? image;

  @override
  void initState() {
    getPulau();
    if (widget.lagu != null) {
      judulController.text = widget.lagu!.judul;
      provinsiController.text = widget.lagu!.provinsi;
      ibukotaController.text = widget.lagu!.ibukota;
      lyricsController.text = widget.lagu!.lyrics;
      imageController.text = widget.lagu!.imageUrl ?? '';
      pulauId = widget.lagu!.pulauId;
    }

    super.initState();
  }

  @override
  void dispose() {
    judulController.dispose();
    provinsiController.dispose();
    ibukotaController.dispose();
    lyricsController.dispose();
    imageController.dispose();
    image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.isUpdate ? 'Edit' : 'Add'} Lagu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Judul',
            ),
            controller: judulController,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Provinsi',
            ),
            controller: provinsiController,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Ibukota',
            ),
            controller: ibukotaController,
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Lirik Lagu',
            ),
            maxLines: 4,
            controller: lyricsController,
          ),

          DropdownButtonFormField(
              hint: const Text('Pulau'),
              value: pulauId,
              items: pulau
                  .map((value) => DropdownMenuItem(
                      value: value.id, child: Text(value.namaPulau!)))
                  .toList(),
              onChanged: (value) {
                pulauId = value;
              }),
          // const SizedBox(height: 12),
          Row(
            children: [
              Switch(
                  value: isUploadImage,
                  onChanged: (value) {
                    setState(() {
                      isUploadImage = value;
                    });
                  }),
              const Text("Upload Gambar dari Gallery?"),
            ],
          ),

          isUploadImage
              ? ImagePickerWidget(
                  label: 'Pilih Gambar',
                  onChanged: (file) => image = file,
                )
              : TextField(
                  decoration: const InputDecoration(
                    hintText: 'Gambar',
                  ),
                  controller: imageController,
                ),
          // image != null
          //     ? SizedBox(
          //         height: 80,
          //         child: Image.file(File(image!.path)),
          //       )
          //     : const SizedBox(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ElevatedButton(
          //       onPressed: () async {
          //         final ImagePicker picker = ImagePicker();

          //         image = await picker.pickImage(source: ImageSource.gallery);
          //         setState(() {});
          //       },
          //       child: const Text('Upload Gambar'),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    // if (image == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Gambar wajib diisi'),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   );
                    //   return;
                    // }

                    final LaguModel newLagu = LaguModel(
                        judul: judulController.text,
                        provinsi: provinsiController.text,
                        ibukota: ibukotaController.text,
                        pulauId: pulauId,
                        lyrics: lyricsController.text,
                        imageUrl: imageController.text);

                    widget.isUpdate
                        ? await LaguRemoteDatasource()
                            .updateLaguDaerah(widget.lagu!.id!, newLagu, image!)
                        : await LaguRemoteDatasource()
                            .addLaguDaerah(newLagu, image!);

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Berhasil ${widget.isUpdate ? 'Edit' : 'Add'} lagu'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text(widget.isUpdate ? 'Edit' : 'Add'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
