// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:mastering_flutter_part_1/constant/colors.dart';
import 'package:mastering_flutter_part_1/constant/list_lagu.dart';
import 'package:mastering_flutter_part_1/data/models/lagu_model.dart';
import 'package:mastering_flutter_part_1/presentation/view_detail_page.dart';

import '../constant/variables.dart';
import '../data/datasources/lagu_remote_datasource.dart';

class ListLaguPage extends StatefulWidget {
  int? pulauId;
  final String pulau;
  List<LaguModel> lagu;
  ListLaguPage({
    super.key,
    this.pulauId,
    required this.pulau,
    required this.lagu,
  });

  @override
  State<ListLaguPage> createState() => _ListLaguPageState();
}

class _ListLaguPageState extends State<ListLaguPage> {
  final PagingController<int, LaguModel> _pagingController =
      PagingController(firstPageKey: 1);

  void initState() {
    getLagu();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await LaguRemoteDatasource().getLaguDaerahPages(
        pageKey,
        widget.pulauId!,
      );

      final isLastPage = newItems.data.currentPage == newItems.data.lastPage;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems.data.data);
      } else {
        _pagingController.appendPage(newItems.data.data, ++pageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> _refreshPage() async {
    _pagingController.refresh();
  }

  void getLagu() async {
    final response =
        await LaguRemoteDatasource().getLaguDaerah(id: widget.pulauId!);

    setState(() {
      widget.lagu = response.data.data;
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Lagu Daerah Pulau ${widget.pulau}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: PagedListView<int, LaguModel>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<LaguModel>(
          itemBuilder: (BuildContext context, LaguModel item, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              provinceSong: item,
                              pulau: widget.pulau,
                            )));
              },
              child: Card(
                color: AppColors.secondary,
                child: ListTile(
                  title: Text(
                    item.judul,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  subtitle: Text(
                    '${item.ibukota} -  ${item.provinsi}',
                  ),
                  // trailing: Icon(Icons.more_vert),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: 80,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      item.imageUrl!.contains('https')
                          ? item.imageUrl!
                          : Variables.imageUrl + item.imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        // itemCount: widget.lagu.length),
      ),
    ));
  }
}
