import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:armory_mobile/components/filter_search.dart';
import 'package:armory_mobile/components/footer.dart';
import 'package:armory_mobile/components/priorityPills.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First row with two cards
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          const BreadCrumb(link: '/home', title: 'Dashboard'),
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
                            'ALL BARRACKS',
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
                padding: const EdgeInsets.only(top: 35.0, left: 10.0),
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
                              DataCell(Container(
                                height: MediaQuery.of(context).size.height * .7,
                                child: const Column(
                                  children: [
                                    PriorityPills(text: '47 approved', priority: 'normal'),
                                    // PriorityPills(text: '2 rejected', priority: 'high'),
                                    // PriorityPills(text: '1 pending', priority: 'ongoing'),
                                  ],
                                ),
                              )),
                              const DataCell(Row(
                                children: [
                                  Text(
                                    'VIEW',
                                    style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700
                                  ),
                                  ),
                                  Icon(Icons.more_vert),
                                ],
                              )),
                            ]),
                            // Add more rows as needed
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            ),
            ],
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