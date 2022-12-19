import 'package:flutter/material.dart';
import 'package:move/loadStatus.dart';

class TrackLoad extends StatelessWidget {
  const TrackLoad({Key? key, required this.id}) : super(key: key);

  final int id;
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
        body: const LoadDetails());
  }
}

class LoadDetails extends StatefulWidget {
  const LoadDetails({super.key});

  @override
  State<LoadDetails> createState() => _LoadDetailsState();
}

class _LoadDetailsState extends State<LoadDetails> {
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
                  'Track Load',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 32, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 380,
                            height: 200,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/dummymaps.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF7A400),
                          ),
                          child: const Text('In Transit',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: const Text('Pickup Location',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                        const Text('Koramangala 1st Block',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 16, bottom: 4),
                          child: const Text('Drop Location',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey)),
                        ),
                        const Text('Whitefield 1st Block',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1),
                        blurRadius: 2.0,
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: const Text('Bill Split',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Truck Fare',
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ 50.00',
                              style: TextStyle(
                                  color: Color(0xFF555555),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ]),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Distance',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '20 km',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Weight of load',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '200kg',
                                style: TextStyle(
                                    color: Color(0xFF555555),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total Amount',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹ 1000',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24.0),
            padding: const EdgeInsets.all(25.0),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoadStatus()));
              },
              fillColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              textStyle: const TextStyle(color: Colors.white),
              child: const Text(
                'Check Status/Truck Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
