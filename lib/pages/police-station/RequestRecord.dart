import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:armory_mobile/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestRecord extends StatefulWidget {
  const RequestRecord({super.key});

  @override
  State<RequestRecord> createState() => _RequestRecordState();
}

class _RequestRecordState extends State<RequestRecord> {
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
                child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DecoratedBox(
                          decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: 1.0, // Adjust the thickness of the underline
                            ),
                          ),
                        ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'POLICE STATION REQUEST',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const Row(
                                children: [
                                  Text(
                                    '#PC001',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 188, 251)
                                    ),
                                  ),
                                  Text(
                                    ' / Kilimani Division',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 75.0, left: 10.0),
                  child: Card(
                    surfaceTintColor: const Color.fromARGB(255, 193, 197, 197),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
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
                                  'Item Name',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                const DataColumn(label: Text(
                                  'Type',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                const DataColumn(label: Text(
                                  'Calibre',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                const DataColumn(label: Text(
                                  'Quantity',
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
                                  DataCell(
                                    Checkbox(
                                      value: checkRow, 
                                      onChanged: (bool? value) {
                                      setState(() {
                                        checkRow = !checkRow;
                                      });
                                      }
                                    ),
                                ),
                                const DataCell(Text('AK 47',
                                )),
                                const DataCell(Text('Battle Riffle')),
                                const DataCell(Text('7.62X5.1mm')),
                                const DataCell(Text('5')),
                                DataCell(
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('/dispatch-request');
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: const BorderSide(color: Color.fromARGB(255, 0, 188, 251)),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      style: TextStyle(color: Color.fromARGB(255, 0, 188, 251)),
                                      'Add For Dispatch'
                                    ),
                                  ),
                                ),
                              ]),
                                DataRow(cells: [
                                  DataCell(
                                    Checkbox(
                                      value: checkRow, 
                                      onChanged: (bool? value) {
                                      setState(() {
                                        checkRow = !checkRow;
                                      });
                                      }
                                    ),
                                ),
                                const DataCell(Text('G3')),
                                const DataCell(Text('Battle Riffle')),
                                const DataCell(Text('7.62X5.1mm')),
                                const DataCell(Text('5')),
                                DataCell(
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('/dispatch-request');
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: const BorderSide(color: Color.fromARGB(255, 0, 188, 251)),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      style: TextStyle(color: Color.fromARGB(255, 0, 188, 251)),
                                      'Add For Dispatch'
                                    ),
                                  ),
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