import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:armory_mobile/components/filter_search.dart';
import 'package:armory_mobile/components/footer.dart';
import 'package:armory_mobile/components/priorityPills.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/menu');
                },
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First row with two cards
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const BreadCrumb(link: '/home', title: 'Police Station Requests'),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
        
            // Second row with a table
            Stack(
              children: [ 
                Container(
                  color: const Color.fromARGB(255, 210, 220, 220),
                  height: MediaQuery.of(context).size.height * .7,
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5.0, left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1.0, // Adjust the thickness of the underline
                            ),
                          ),
                        ),
                          child: Text(
                          'POLICE STATION REQUESTS',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 15.0),
                child: Card(
                  surfaceTintColor: const Color.fromARGB(255, 193, 197, 197),
                  elevation: 4,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: FilterSearch()
                        ),
                        DataTable(
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
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const DataColumn(label: Text(
                              'Division/Barracks',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const DataColumn(label: Text(
                              'No Items',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const DataColumn(label: Text(
                              'Priority',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const DataColumn(label: Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            const DataColumn(label: Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
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
                              PriorityPills(text: 'HIGH', priority: 'high')
                            ),
                            const DataCell(
                              PriorityPills(text: 'OPEN', priority: '')
                            ),
                            DataCell(
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/request-record');
                                },
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromARGB(255, 0, 140, 255),
                                        width: 1.0, // Adjust the thickness of the underline
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                      'take action',
                                      style: TextStyle(
                                      color: Color.fromARGB(255, 0, 140, 255),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      ),
                                    ),
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
                                PriorityPills(text: 'Normal', priority: 'normal')
                              ),
                              DataCell(
                                Column(
                                  children: [
                                    const PriorityPills(text: 'Ongoing', priority: 'ongoing'),
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
                              DataCell(
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/request-record');
                                  },
                                  child: const DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color.fromARGB(255, 0, 140, 255),
                                          width: 1.0, // Adjust the thickness of the underline
                                        ),
                                      ),
                                    ),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color.fromARGB(255, 0, 140, 255),
                                            width: 1.0, // Adjust the thickness of the underline
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                          'take action',
                                          style: TextStyle(
                                          color: Color.fromARGB(255, 0, 140, 255),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                    ),
                                  ),
                                )
                              ),
                            ]),
                            // Add more rows as needed
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ]
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey,
                            width: 1.0, // Adjust the thickness of the underline
                          ),
                        ),
                      ),
                      child: Footer()
                    ),
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
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