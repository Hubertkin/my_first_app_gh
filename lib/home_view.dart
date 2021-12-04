import 'contact_details_view.dart';
import 'contact_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> data = [
    {
      "name": "Damian Mann",
      "phone": "1-816-441-8375",
      "email": "morbi.non.sapien@outlook.net",
      "country": "Canada",
      "region": "Tennessee"
    },
    {
      "name": "Hedda Ayers",
      "phone": "1-213-507-2338",
      "email": "placerat.augue@google.ca",
      "country": "United Kingdom",
      "region": "Berlin"
    },
    {
      "name": "Xyla Parks",
      "phone": "1-752-267-1213",
      "email": "adipiscing@protonmail.com",
      "country": "India",
      "region": "Goa"
    },
    {
      "name": "Scarlet Grant",
      "phone": "475-9833",
      "email": "non.sollicitudin@aol.edu",
      "country": "Chile",
      "region": "Western Australia"
    },
    {
      "name": "Madonna Stephenson",
      "phone": "1-228-526-7136",
      "email": "placerat.augue@google.ca",
      "country": "Poland",
      "region": "Mizoram"
    },
    {
      "name": "Mona Collier",
      "phone": "1-438-941-8845",
      "email": "feugiat.metus@yahoo.net",
      "country": "Vietnam",
      "region": "Oost-Vlaanderen"
    },
    {
      "name": "Britanney Dejesus",
      "phone": "962-0166",
      "email": "arcu@yahoo.net",
      "country": "South Korea",
      "region": "Emilia-Romagna"
    },
    {
      "name": "Gwendolyn Barrera",
      "phone": "1-588-894-0151",
      "email": "orci.tincidunt@protonmail.ca",
      "country": "Nigeria",
      "region": "Melilla"
    },
    {
      "name": "Nehru Hunt",
      "phone": "551-7709",
      "email": "vitae@google.com",
      "country": "Sweden",
      "region": "Akwa Ibom"
    },
    {
      "name": "Nathan Mills",
      "phone": "678-5172",
      "email": "ipsum@hotmail.ca",
      "country": "Russian Federation",
      "region": "Mississippi"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ), //Text
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/kage8.jpg'),
              ),
            ),
          ) //Center
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)), hintText: 'Search by name or number', prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Recents', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ContactDetailsView(
                                contact: Contact(country: 'Ghana', email: 'hubertkingsleyocran@gmail.com', name: 'Hubert Kingsley Ocran', phone: '+233 55 00 26 920', region: 'Ashanti'),
                              );
                            },
                          ),
                        );
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/kage2.jpg'),
                      ),
                      title: const Text(
                        'Hubert Kingsley Ocran',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('+233 55 00 26 920'),
                      trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width, //calling width of the phone screen and setting it to a sizebox
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);

                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/kage2.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    ) // divides the list
                  ],
                );
              },

              itemComparator: (item1, item2) => item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ), //safearea
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff1A4ADA),
        child: const Icon(Icons.add),
      ),
    ); //Scaffold
  }
}
