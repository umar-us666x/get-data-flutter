import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_flutter_application/provider/users.dart';
import 'package:try_flutter_application/screen/add_users.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Users users = Provider.of<Users>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => Users(),
                child: AddUsers(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("nama users"),
      ),

      // GET DATA SEKALI, DARI FIREBASE

      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: users.getUsers(),
      //   builder: (context, snapshot) {
      //     // print(snapshot.data!.docs[0].data());
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var data = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: data.length,
      //         itemBuilder: (context, Index) {
      //           // ignore: unused_local_variable
      //           final user = data[Index].data() as Map<String, dynamic>;
      //           return ListTile(
      //             title: Text(user["nama"]),
      //             subtitle: Text(user["prodi"]),
      //           );
      //         },
      //       );
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      // GET DATA REALTIME, DARI FIREBASE

      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: users.streamUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, Index) {
                // ignore: unused_local_variable
                final user = data[Index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(user["nama"]),
                  subtitle: Text(user["prodi"]),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
