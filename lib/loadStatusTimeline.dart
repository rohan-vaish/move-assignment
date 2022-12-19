import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StatusTimeline extends StatefulWidget {
  const StatusTimeline({super.key});

  @override
  State<StatusTimeline> createState() => _StatusTimelineState();
}

class _StatusTimelineState extends State<StatusTimeline> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineTile(
          alignment: TimelineAlign.start,
          isFirst: true,
          afterLineStyle:
              const LineStyle(color: Color(0x88288C00), thickness: 3),
          indicatorStyle: IndicatorStyle(
              color: Colors.white,
              padding: const EdgeInsets.all(0),
              iconStyle: IconStyle(
                  fontSize: 28,
                  iconData: Icons.check_circle_rounded,
                  color: const Color(0xFF288C00))),
          endChild: Container(
            constraints: const BoxConstraints(minHeight: 120),
            margin: const EdgeInsets.only(left: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Load picked up',
                    style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xFF288C00),
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text(
                      'Load picked up from location.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text('Estimated time of delivery: 5:00 PM ')
                ]),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.start,
          beforeLineStyle:
              const LineStyle(color: Color(0x88288C00), thickness: 3),
          afterLineStyle:
              const LineStyle(color: Color(0x83F7A500), thickness: 3),
          indicatorStyle: IndicatorStyle(
              color: Colors.white,
              padding: const EdgeInsets.all(0),
              iconStyle: IconStyle(
                  fontSize: 28,
                  iconData: Icons.error_rounded,
                  color: const Color(0xFFF7A400))),
          endChild: Container(
            constraints: const BoxConstraints(minHeight: 120),
            margin: const EdgeInsets.only(left: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'In transit',
                    style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xFFF7A400),
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text(
                      'Load is currently in transit.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text('Estimated time of delivery: 5:00 PM ')
                ]),
          ),
        ),
        TimelineTile(
          alignment: TimelineAlign.start,
          isLast: true,
          beforeLineStyle:
              const LineStyle(color: Color(0x83F7A500), thickness: 3),
          indicatorStyle: IndicatorStyle(
              color: Colors.white,
              padding: const EdgeInsets.all(0),
              iconStyle: IconStyle(
                  fontSize: 28,
                  iconData: Icons.pending,
                  color: const Color(0xFF626262))),
          endChild: Container(
            constraints: const BoxConstraints(minHeight: 120),
            margin: const EdgeInsets.only(left: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Load Delivery',
                    style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text(
                      'Load is not yet delivered.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text('Estimated time of delivery: 5:00 PM ')
                ]),
          ),
        )
      ],
    );
  }
}
