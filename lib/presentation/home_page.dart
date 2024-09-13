import 'package:flutter/material.dart';
import 'package:mastering_flutter_part_1/constant/colors.dart';
import 'package:mastering_flutter_part_1/constant/list_lagu.dart';
import 'package:mastering_flutter_part_1/data/datasources/lagu_remote_datasource.dart';
import 'package:mastering_flutter_part_1/data/datasources/pulau_remote_datasource.dart';
import 'package:mastering_flutter_part_1/data/models/pulau_response_model.dart';
import 'package:mastering_flutter_part_1/presentation/list_lagu_page.dart';
import 'package:mastering_flutter_part_1/presentation/view_detail_page.dart';

import '../data/models/lagu_model.dart';
import 'add_lagu_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pulau> pulau = [];
  List<LaguModel> lagu = [];

  void getPulau() async {
    final response = await PulauRemoteDatasource().getPulau();
    setState(() {
      pulau = response.data!;
    });
  }

  void getLagu() async {
    final response = await LaguRemoteDatasource().getLaguDaerah();

    setState(() {
      lagu = response.data.data;
    });
  }

  @override
  void initState() {
    getPulau();
    getLagu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xff363636),
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Column(
            children: [
              Text(
                'Lagu Daerah',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
              Text(
                'Indonesia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: AppColors.primary,
        ),
        body: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Text(
              "List Lagu Berdasarkan Pulau",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.primary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0, // Space between columns
                  mainAxisSpacing: 8.0, // Space between rows
                  childAspectRatio: 1.0,
                ),
                itemCount: pulau.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListLaguPage(
                                      pulauId: pulau[index].id!,
                                      pulau: pulau[index].namaPulau!,
                                      lagu: lagu
                                          .where((e) =>
                                              e.pulauId == pulau[index].id)
                                          .toList(),
                                    )));
                      },
                      child: Card(
                        color: AppColors.primary,
                        child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/470996572/id/vektor/peta-negara-indonesia.jpg?s=612x612&w=0&k=20&c=Q_4dHjCziVltzbeOSPmADL73tmoTfmtFrbMhNe53J6E='),
                                opacity: 0.15,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                pulau[index].namaPulau!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondary,
                                ),
                              ),
                            )),
                      ));
                }),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddLaguPage();
                },
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: AppColors.secondary,
          ),
        ),
      ),
    );
  }
}
