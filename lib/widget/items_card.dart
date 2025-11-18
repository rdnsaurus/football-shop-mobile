import 'package:flutter/material.dart';
import 'package:football_shop/screen/menu.dart';
import 'package:football_shop/screen/itemslist_form.dart';
import 'package:football_shop/screen/item_entry_list.dart';
import 'package:football_shop/screen/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:football_shop/screen/item_entry_user_list.dart';

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 

  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
            if (item.name == "Create Item") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ItemsFormPage()));
            }

            else if (item.name == "All Items") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemEntryListPage()
                  ),
              );
            }

            else if (item.name == "My Items") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ItemEntryUserListPage()
                  ),
              );
        }
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}