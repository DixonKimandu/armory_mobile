import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Barracks extends StatefulWidget {
  const Barracks({super.key});

  @override
  State<Barracks> createState() => _BarracksState();
}

class _BarracksState extends State<Barracks> {
  bool checkAll = false;
  bool checkRow = false;
  late final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Officer John Doe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 141, 151),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/notification.svg',
                    width: 40,
                    height: 40,
                    semanticsLabel: 'group'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/images/group.svg',
                    width: 40,
                    height: 40,
                    semanticsLabel: 'group'),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First row with two cards
          const SizedBox(height: 20),
          const BreadCrumb(link: '/home', title: 'Dashboard'),
          const SizedBox(height: 20),

          // Second row with a table
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                surfaceTintColor: Color.fromARGB(255, 193, 197, 197),
                elevation: 4,
                child: Column(
                  children: [
                    const Text(
                      'ALL BARRACKS',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    // !TODO : Fix Causing rendering error
                    // Row(
                    //   children: [
                    //     Container(
                    //       width: 30,
                    //       height: 30,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color: const Color.fromARGB(255, 4, 141, 151),
                    //         )
                    //       ),
                    //       child: SvgPicture.asset(
                    //         'assets/images/filter.svg',
                    //         width: 20,
                    //         height: 20,
                    //         semanticsLabel: 'filter'),
                    //     ),
                    //     TextFormField(
                    //       controller: _searchController,
                    //       decoration: InputDecoration(
                    //         prefixIcon: SvgPicture.asset(
                    //           'assets/images/search.svg',
                    //           width: 20,
                    //           height: 20,
                    //           semanticsLabel: 'search'),
                    //         labelText: 'Search Items by....', 
                    //         border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Checkbox(
                            value: checkAll, 
                            onChanged: (bool? value) {
                            setState(() {
                              checkAll = !checkAll;
                            });
                          })),
                          const DataColumn(label: Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Location',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Officer',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Request',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Action',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Row(
                              children: [
                                Checkbox(
                                  value: checkRow, 
                                  onChanged: (bool? value) {
                                  setState(() {
                                    checkRow = !checkRow;
                                  });
                                  }
                                ),
                                SvgPicture.asset(
                                  'assets/images/union.svg',
                                  width: 20,
                                  height: 20,
                                  semanticsLabel: 'group'),
                              ],
                            ),
                          ),
                            const DataCell(Text('Langata')),
                            const DataCell(Text('Langata Nairobi')),
                            const DataCell(Text('John Doe')),
                            const DataCell(Column(
                              children: [
                                Text(
                                  '47 approved',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 18, 185, 43),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200
                                  ),
                                ),
                                Text(
                                  '2 rejected',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 205, 15, 15),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200
                                  ),
                                ),
                                Text(
                                  '1 pending',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 168, 173, 15),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w200
                                  ),
                                ),
                              ],
                            )),
                            const DataCell(Row(
                              children: [
                                Text(
                                  'VIEW',
                                  style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200
                                ),
                                ),
                                Icon(Icons.more_vert),
                              ],
                            )),
                          ]),
                          // Add more rows as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: const Color.fromARGB(255, 4, 141, 151),
        shape: const CircleBorder(eccentricity: 0.5),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}