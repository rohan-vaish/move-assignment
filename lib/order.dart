import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:move/LoadDataModel.dart';
import 'package:flutter/services.dart' as root_Bundle;
import 'package:move/orderList.dart';
import 'package:move/track.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedOrderType = 1;

  Future<List<LoadDataModel>> loadsData() async {
    final data = await root_Bundle.rootBundle.loadString('jsonData/loads.json');
    final loadsList = jsonDecode(data) as List<dynamic>;

    return loadsList.map((e) => LoadDataModel.fromJson(e)).toList();
  }

  getStatus(status) {
    switch (status) {
      case 1:
        return 'In Transit';
      case 2:
        return 'In Progress';
      case 3:
        return 'Completed';
      case 4:
        return 'Cancelled';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 160,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    selectedOrderType = 1;
                  });
                },
                fillColor: selectedOrderType == 1 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: const BorderSide(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: Text(
                    'Ongoing Loads',
                    style: TextStyle(
                        color: selectedOrderType == 1
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 160,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    selectedOrderType = 2;
                  });
                },
                elevation: 0,
                fillColor: selectedOrderType == 2 ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: const BorderSide(color: Colors.black, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: Text(
                    'Past Loads',
                    style: TextStyle(
                        color: selectedOrderType == 2
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
            child: OrderList(selectedType: selectedOrderType))
      ]),
    );
  }
}
