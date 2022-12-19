import 'package:flutter/material.dart';
import 'package:move/loadTimeLine.dart';
import 'package:move/track.dart';

class OrderItems extends StatefulWidget {
  final List items;
  final int index;
  const OrderItems({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
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
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.grey, width: 1),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.items[widget.index].price.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: widget.items[widget.index].status == 1
                        ? const Color(0xFFF7A400)
                        : widget.items[widget.index].status == 2
                            ? const Color(0xFF566AFE)
                            : widget.items[widget.index].status == 3
                                ? const Color(0xFF1A8618)
                                : const Color(0xFFF93732),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text(
                      getStatus(widget.items[widget.index].status),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            LoadTimeLine(items: widget.items, index: widget.index),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TrackLoad(
                      id: widget.items[widget.index].id?.toInt() ?? 0),
                ));
              },
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                      widget.items[widget.index].status! <= 2
                          ? 'Track'
                          : 'Details',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600))),
            )
          ],
        ),
      ),
    );
  }
}
