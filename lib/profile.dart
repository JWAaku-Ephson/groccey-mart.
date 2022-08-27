// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:groceey_mart_authentication/auth.dart';
import 'package:groceey_mart_authentication/sign_in.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Auth logOut = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.greenAccent,
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: IconButton(
                onPressed: () {},
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          title: Center(
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: IconButton(
                  onPressed: () {
                    logOut.deleteDoc().then((value) {
                      Navigator.push(context, 
                          MaterialPageRoute(builder: ((context) {
                            return LoginView();
                          })));
                    });
                  },
                  icon: Icon(
                    // Icons.menu,
                    Icons.delete,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: Center(
            child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://www.thewrap.com/wp-content/uploads/2016/10/GettyImages-547403018.jpg",
                scale: 5),
            radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              "John Lee",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text("logOut.currentUser.email"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfileView();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ListTile(
            leading: Icon(
              Icons.settings_applications,
              color: Colors.blue[200],
            ),
            title: Text("Settings",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.do_not_disturb_on_outlined,
              color: Colors.blue[200],
            ),
            title: Text("Billing Details",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.blue[200],
            ),
            title: Text("User Management",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.blue[200],
            ),
            title: Text("Information",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.blue[200],
            ),
            title: Text("Log out",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500)),
            trailing: IconButton(
                onPressed: () {
                  logOut.signOut().then((value) {
                    Navigator.pop(context);
                  });
                },
                icon: Icon(Icons.arrow_forward_ios)),
          )
        ])));
  }
}
