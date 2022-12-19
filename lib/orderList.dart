import 'package:flutter/material.dart';

import 'package:move/LoadDataModel.dart';
import 'package:flutter/services.dart' as root_Bundle;
import 'dart:convert';

import 'package:move/orderItems.dart';

class OrderList extends StatefulWidget {
  final int selectedType;
  const OrderList({Key? key, required this.selectedType}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  Future<List<LoadDataModel>> loadsData() async {
    final data = await root_Bundle.rootBundle.loadString('jsonData/loads.json');
    final loadsList = jsonDecode(data) as List<dynamic>;

    return loadsList.map((e) => LoadDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadsData(),
        builder: (context, data) {
          if (data.hasError) {
            // for errors
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var dataItems = data.data as List<LoadDataModel>;
            var items = widget.selectedType == 1
                ? dataItems.where((element) => element.status! <= 2).toList()
                : dataItems.where((element) => element.status! > 2).toList();
            return ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return OrderItems(items: items, index: index);
              },
            );
          } else {
            // for loading
            return const Center(
              child: Text('Loading...'),
            );
          }
        });
  }
}
