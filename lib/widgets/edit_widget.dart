import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muslimpocket/commons/global.dart';
import 'package:muslimpocket/widgets/tracker_widget.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/chevron-kiri.png'),
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                    color: Global().greenPrimary,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '26',
                      style: TextStyle(
                        color: Global().white,
                        fontSize: 13,
                        fontWeight: Global().medium,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '29',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                      color: Global().bgNotYet,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '31',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: Global().medium,
                        ),
                      ),
                    ],
                  )),
              Image.asset('assets/images/chevron-right.png'),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Subuh',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              margin: const EdgeInsets.only(top: 5.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Global().bgDone,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Zuhur',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Asar',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Magrib',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            Container(
              width: 237.0,
              height: 34.0,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Global().bgNotYet,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Isya',
                      style: TextStyle(
                        fontWeight: Global().medium,
                      ),
                    ),
                    Image.asset(
                      'assets/images/edit.png',
                      width: 15.0,
                      height: 12.0,
                    )
                  ]),
            ),
            AddPray("", ""),
          ],
        ),
      ],
    );
  }
}

class AddPray extends StatelessWidget {
  String id, prayerName;

  AddPray(
    this.id,
    this.prayerName,
  );

  @override
  Widget build(BuildContext context) {
    CollectionReference prayTracker =
        FirebaseFirestore.instance.collection('prayTracker');

    Future<void> addPray() {
      return prayTracker
          .add({
            'id': id,
            'prayerName': prayerName,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return GestureDetector(
      onTap: addPray,
      child: Container(
        width: 237.0,
        height: 34.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
            color: Global().greenPrimary,
            borderRadius: BorderRadius.circular(30.0)),
        child: Icon(
          Icons.add,
          color: Global().white,
        ),
      ),
    );
  }
}
