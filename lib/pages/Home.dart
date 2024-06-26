import 'package:armory_mobile/components/breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          const BreadCrumb(link: '/home', title: 'Dashboard'),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DashboardCard(
                key: UniqueKey(),
                title: 'No. Barracks',
                value: '40',
                link: '/barracks'
              ),
              DashboardCard(
                key: UniqueKey(),
                title: 'No. P.Stations',
                value: '40',
                link: '/police-station-requests'
              ),
            ],
          ),

          // Second row with a table
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                surfaceTintColor: const Color.fromARGB(255, 193, 197, 197),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Incoming Fire Arms',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      DataTable(
                        columns: const [
                          DataColumn(label: Text('#')),
                          DataColumn(label: Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          DataColumn(label: Text(
                            'Delivery date',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                          DataColumn(label: Text(
                            'Action',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                        ],
                        rows: [
                          DataRow(cells: [
                            const DataCell(Icon(Icons.fire_truck)),
                            const DataCell(Text('USA')),
                            const DataCell(Text('13-04-2024')),
                            DataCell(IconButton(onPressed: () {
                              Navigator.pushNamed(context, '/central-armory');
                            }, icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              ))),
                          ]),
                          DataRow(cells: [
                            const DataCell(Icon(Icons.fire_truck)),
                            const DataCell(Text('Uganda')),
                            const DataCell(Text('18-07-2024')),
                            DataCell(IconButton(onPressed: () {
                              Navigator.pushNamed(context, '/central-armory');
                            }, icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                              ))),
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
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String link;

  const DashboardCard({required Key key, required this.title, required this.value, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      surfaceTintColor: Color.fromARGB(255, 193, 197, 197),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .06,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(link);
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color.fromARGB(255, 4, 141, 151),
                    child: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}