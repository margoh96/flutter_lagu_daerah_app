// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mastering_flutter_part_1/constant/colors.dart';
import 'package:mastering_flutter_part_1/constant/list_lagu.dart';
import 'package:mastering_flutter_part_1/data/datasources/lagu_remote_datasource.dart';
import 'package:mastering_flutter_part_1/data/models/lagu_model.dart';
import 'package:mastering_flutter_part_1/presentation/add_lagu_page.dart';

import '../constant/variables.dart';
import '../data/models/pulau_response_model.dart';
import 'home_page.dart';
import 'widgets/remove_dialog.dart';

class DetailPage extends StatelessWidget {
  final String pulau;
  final LaguModel provinceSong;
  const DetailPage({
    Key? key,
    required this.pulau,
    required this.provinceSong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          provinceSong.judul,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.secondary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) => AddLaguPage(
                          isUpdate: true,
                          lagu: provinceSong,
                        ));
              },
              icon: const Icon(
                Icons.edit_document,
                color: AppColors.secondary,
              )),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (builder) => RemoveDialog(
                          laguId: provinceSong.id!,
                        ));
              },
              icon: const Icon(
                Icons.delete_forever_sharp,
                color: AppColors.secondary,
              )),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              provinceSong.imageUrl!.contains('http')
                  ? provinceSong.imageUrl!
                  : Variables.imageUrl + provinceSong.imageUrl!,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _LabelValue(label: "Pulau", value: pulau),
          _LabelValue(label: "Provinsi", value: provinceSong.provinsi),
          _LabelValue(label: "Ibu Kota", value: provinceSong.ibukota),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            "Lirik Lagu 🎶",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(provinceSong.imageUrl!.contains('http')
                    ? provinceSong.imageUrl!
                    : Variables.imageUrl + provinceSong.imageUrl!),
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: Text(
              provinceSong.lyrics,
              style: const TextStyle(
                wordSpacing: 12,
                letterSpacing: 1,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    ));
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String? value;

  const _LabelValue({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.black,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // const Spacer(),
              Text(
                value ?? "<belum ada data>",
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.primary,
                  // decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
