import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_application/provider/users.dart';

class AddUsers extends StatelessWidget {
  const AddUsers({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Users"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: users.namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: users.prodiController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                users.addUser();
              },
              child: Text("Add User"),
            ),
          ],
        ),
      ),
    );
  }
}
