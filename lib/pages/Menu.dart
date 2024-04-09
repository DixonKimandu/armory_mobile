import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  // final List<Item> _data = generateItems(8);
  //   List<Breadcrumb> myBreadcrumbs = [
  //   Breadcrumb(id: 1, type: 'Page', title: 'Home', link: '/home'),
  //   Breadcrumb(id: 2, type: 'Page', title: 'Products', link: '/products'),
  //   Breadcrumb(id: 3, type: 'Page', title: 'Shoes', link: '/products/shoes'),
  // ];
  final List<Item> _data = [
    Item(title: 'Item Master', createItem:
      {
        'title': '',
        'link': ''
      },
      viewAll: {
        'title': '',
        'link': ''
      },
      viewAllRequests: {
        'title': '',
        'link': ''
      }),
    Item(title: 'Central Armory Inventory', createItem:
      {
        'title': '',
        'link': ''
      },
      viewAll: {
        'title': '',
        'link': ''
      },
      viewAllRequests: {
        'title': '',
        'link': ''
      }),
    Item(title: 'Dispatch', createItem:
      {
        'title': '',
        'link': ''
      },
      viewAll: {
        'title': '',
        'link': ''
      },
      viewAllRequests: {
        'title': '',
        'link': ''
      }),
    Item(title: 'Barracks', createItem:
      {
        'title': 'Create New Barrack',
        'link': '/create-barrack'
      },
      viewAll: {
        'title': 'View all Barracks',
        'link': '/barracks'
      },
      viewAllRequests: {
        'title': 'View all Barrack Requests',
        'link': '/barrack-requests'
      }),
    Item(title: 'Police Station', createItem:
      {
        'title': 'Create New Police Station',
        'link': '/create-police-station'
      },
      viewAll: {
        'title': 'View all Police Stations',
        'link': '/police-stations'
      },
      viewAllRequests: {
        'title': 'View all Police Station Requests',
        'link': '/police-station-requests'
      }),
    Item(title: 'Division', createItem:
      {
        'title': '',
        'link': ''
      },
      viewAll: {
        'title': '',
        'link': ''
      },
      viewAllRequests: {
        'title': '',
        'link': ''
      }),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 131, 209, 219),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 205, 204, 204),
                        radius: MediaQuery.of(context).size.height * .1,
                        child: SvgPicture.asset(
                              'assets/images/avatar.svg',
                              width: 100,
                              height: 100,
                              semanticsLabel: 'avatar'),
                      ),
                    ),
                  ),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Rank: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                        ),),
                        Text('Officer John Doe',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .02)
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .03),
                Container(
                  child: _buildPanel(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: isExpanded ? SvgPicture.asset(
                'assets/images/arrow-bottom.svg',
                width: 20,
                height: 20,
                semanticsLabel: 'arrow-bottom')
                : SvgPicture.asset(
                'assets/images/arrow-full-right.svg',
                width: 20,
                height: 20,
                semanticsLabel: 'arrow-full-right'),
              title: Text(item.title),
            );
          },
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white, // Change the color as needed
                      width: 0.5, // Change the width as needed
                    ),
                  ),
                ),
                child: ListTile(
                  title: Text(item.createItem['title']!),
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed(item.createItem['link']!);
                    });
                  }
                ),
              ),
              ListTile(
                title: Text(item.viewAll['title']!),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed(item.viewAll['link']!);
                  });
                }
              ),
              ListTile(
                title: Text(item.viewAllRequests['title']!),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed(item.viewAllRequests['link']!);
                  });
                }
              ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

// stores ExpansionPanel state information
// class Item {
//   Item({
//     required this.expandedValue,
//     required this.headerValue,
//     this.isExpanded = false,
//   });

//   String expandedValue;
//   String headerValue;
//   bool isExpanded;
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'Panel $index',
//       expandedValue: 'This is item number $index',
//     );
//   });
// }

// stores ExpansionPanel state information
class Item {
  Item({
    required this.title,
    required this.createItem,
    required this.viewAll,
    required this.viewAllRequests,
    this.isExpanded = false,
  });

  final String title;
  final Map<String, String> createItem;
  final Map<String, String> viewAll;
  final Map<String, String> viewAllRequests;
  bool isExpanded;
}