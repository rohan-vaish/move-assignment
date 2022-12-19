import 'package:flutter/material.dart';

class LoadTimeLine extends StatefulWidget {
  final List items;
  final int index;
  const LoadTimeLine({Key? key, required this.items, required this.index})
      : super(key: key);

  @override
  State<LoadTimeLine> createState() => _LoadTimeLineState();
}

class _LoadTimeLineState extends State<LoadTimeLine> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, top: 14),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.circle, size: 14, color: Colors.black),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.items[widget.index].pickupLoc.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        Text(
                            widget.items[widget.index].pickupDate.toString() +
                                widget.items[widget.index].pickupTime
                                    .toString(),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.black,
                margin: const EdgeInsets.only(left: 6),
              ),
              Row(
                children: [
                  Icon(Icons.square,
                      size: 14,
                      color: widget.items[widget.index].status! > 2
                          ? Colors.black
                          : Colors.grey.shade400),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.items[widget.index].dropLoc.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        Text(
                            widget.items[widget.index].dropDate == null
                                ? 'Not Assigned'
                                : widget.items[widget.index].dropDate
                                        .toString() +
                                    widget.items[widget.index].dropTime
                                        .toString(),
                            style: const TextStyle(color: Colors.grey))
                      ],
                    ),
                  )
                ],
              ),
            ]));
  }
}
