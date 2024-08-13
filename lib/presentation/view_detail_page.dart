import 'package:flutter/material.dart';
import 'package:mastering_flutter_part_1/constant/list_lagu.dart';

class DetailPage extends StatelessWidget {
  final ProvinceSong provinceSong;
  const DetailPage({super.key, required this.provinceSong});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          provinceSong.laguDaerah,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade100,
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
              provinceSong.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _LabelValue(label: "Asal Kota", value: provinceSong.nama),
          _LabelValue(label: "Ibu Kota", value: provinceSong.ibukota),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            "Lirik Lagu",
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
                image: NetworkImage(provinceSong.imageUrl),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey,
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
                // color: AppColors.secondary,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
