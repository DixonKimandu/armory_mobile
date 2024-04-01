import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PoliceStationRequests extends StatefulWidget {
  const PoliceStationRequests({super.key});

  @override
  State<PoliceStationRequests> createState() => _PoliceStationRequestsState();
}

class _PoliceStationRequestsState extends State<PoliceStationRequests> {
    bool checkAll = false;
    bool checkRow = false;

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
          const BreadCrumb(link: '/home', title: 'Police Station Requests'),
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
                      'POLICE STATION REQUESTS',
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
                            '#TicketID',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Division/Barracks',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'No Items',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Priority',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          const DataColumn(label: Text(
                            'Status',
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
                                  semanticsLabel: 'union'),
                              ],
                            ),
                          ),
                          const DataCell(Text('#PC002')),
                          const DataCell(Text('Kilimani')),
                          const DataCell(Text('15')),
                          const DataCell(
                            Text(
                                'HIGH',
                                style: TextStyle(
                                color: Color.fromARGB(255, 205, 15, 15),
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                                ),
                              )
                          ),
                          const DataCell(
                            Text(
                                'OPEN',
                                style: TextStyle(
                                color: Color.fromARGB(255, 0, 140, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                                ),
                              )
                          ),
                          const DataCell(
                            Text(
                                'take action',
                                style: TextStyle(
                                color: Color.fromARGB(255, 0, 140, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                ),
                              )
                          ),
                        ]),
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
                          const DataCell(Text('#PC003')),
                            const DataCell(Text('Pangani')),
                            const DataCell(Text('20')),
                            const DataCell(
                              Text(
                                  'Normal',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 18, 185, 43),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                  ),
                                )
                            ),
                            DataCell(
                              Column(
                                children: [
                                  const Text(
                                      'Ongoing',
                                      style: TextStyle(
                                      color: Color.fromARGB(255, 168, 173, 15),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                      'assets/images/user-tag.svg',
                                      width: 20,
                                      height: 20,
                                      semanticsLabel: 'user-tag'),
                                      const Text('John Doe')
                                    ],
                                  ),
                                ],
                              )
                            ),
                            const DataCell(
                              Text(
                                  'take action',
                                  style: TextStyle(
                                  color: Color.fromARGB(255, 0, 140, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  ),
                                )
                            ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        backgroundColor: const Color.fromARGB(255, 4, 141, 151),
        label: const Padding(
          padding: EdgeInsets.only(right: 25.0, left: 25),
          child: Text(
            'incoming requests 26',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        )
      ),
    );
  }
}