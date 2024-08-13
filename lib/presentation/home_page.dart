import 'package:flutter/material.dart';
import 'package:mastering_flutter_part_1/constant/list_lagu.dart';
import 'package:mastering_flutter_part_1/presentation/view_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final province = ProvinceList().provinceList;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Lagu Daerah 🎶',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                provinceSong: province[index],
                              )));
                },
                child: Card(
                  child: ListTile(
                    title: Text(province[index].laguDaerah),
                    subtitle: Text(
                        '${province[index].ibukota} -  ${province[index].nama}'),
                    // trailing: Icon(Icons.more_vert),
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        province[index].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: 10),
      ),
    );
  }
}
