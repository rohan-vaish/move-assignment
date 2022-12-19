import 'package:flutter/material.dart';
import 'package:move/driverDetails.dart';
import 'package:move/loadStatusTimeline.dart';

class LoadStatus extends StatelessWidget {
  const LoadStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              // Here we create one to set status bar color
              backgroundColor: Colors
                  .black, // Set any color of status bar you want; or it defaults to your theme's primary color
            )),
        body: const Status());
  }
}

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        maintainBottomViewPadding: true,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left, size: 32),
                  ),
                  const Text(
                    'Status of Load',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 15,
                        spreadRadius: 2,
                        color: Colors.grey.shade300)
                  ],
                  borderRadius: BorderRadius.circular(8)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Truck Status',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF7A400),
                      ),
                      child: const Text('In Transit',
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
                const StatusTimeline(),
              ]),
            ),
            const DriverDetails()
          ],
        ));
  }
}
