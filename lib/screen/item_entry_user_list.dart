import 'package:flutter/material.dart';
import 'package:football_shop/models/item_entry.dart';
import 'package:football_shop/widget/left_drawer.dart';
import 'package:football_shop/screen/item_detail.dart';
import 'package:football_shop/widget/item_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ItemEntryUserListPage extends StatefulWidget {
  const ItemEntryUserListPage({super.key});

  @override
  State<ItemEntryUserListPage> createState() => _ItemEntryUserListPageState();
}

class _ItemEntryUserListPageState extends State<ItemEntryUserListPage> {
  Future<List<ItemEntry>> fetchItem(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ItemEntry objects
    List<ItemEntry> listItem = [];
    String? currentUsername = request.jsonData["username"]; // username login

    for (var d in data) {
      if (d != null) {
        final item = ItemEntry.fromJson(d);

        // FILTER: hanya item milik user login
        if (item.user == currentUsername) {
          listItem.add(item);
        }
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItem(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.inventory_2_outlined, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      "Kamu belum punya item.",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ItemEntryCard(
                  item: snapshot.data![index],
                  onTap: () {
                    // Navigate to item detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailPage(
                          item: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}