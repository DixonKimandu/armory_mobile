import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:armory_mobile/components/filter_search.dart';
import 'package:armory_mobile/components/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CentralArmory extends StatefulWidget {
  const CentralArmory({super.key});

  @override
  State<CentralArmory> createState() => _CentralArmoryState();
}

class _CentralArmoryState extends State<CentralArmory> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // First row with two cards
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          const BreadCrumb(link: '/home', title: 'Central Armory'),
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
                            'CENTRAL ARMORY',
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
                child: Column(
                  children: [
                    SingleChildScrollView(
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
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              const DataColumn(label: Text(
                                'Type',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              const DataColumn(label: Text(
                                'Calibre',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              const DataColumn(label: Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                              const DataColumn(label: Text(
                                'Acquisition Date',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                            ],
                            rows: [
                              DataRow(
                                onLongPress: () {
                                  Navigator.of(context).pushNamed('/armory-record');
                                },
                                cells: [
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
                                const DataCell(Text('Uzii')),
                                const DataCell(Text('SM GUN')),
                                const DataCell(Text('9X19mm')),
                                const DataCell(Text(
                                  '26',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 188, 251)
                                  )
                                )),
                                const DataCell(Text('18/03/2024')),
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
                                const DataCell(Text('Uzii')),
                                const DataCell(Text('SM GUN')),
                                const DataCell(Text('9X19mm')),
                                const DataCell(Text(
                                  '26',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 188, 251)
                                  )
                                )),
                                const DataCell(Text('18/05/2024')),
                              ]),
                              // Add more rows as needed
                            ],
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                        
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Color.fromARGB(255, 0, 188, 251)),
                              ),
                            ),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                'View all',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 188, 251)
                                )
                              ),
                              Icon(
                                Icons.arrow_right_alt,
                                color: Color.fromARGB(255, 0, 188, 251)
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        Text(
                          'COUNTRY OF ORIGIN: ISRAEL',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        Text(
                          'RECEIVED BY: JOHN DOE (300001)',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          )
                        )
                      ],
                    )
                  ],
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