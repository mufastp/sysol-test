import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../controller/constent.dart';
import '../controller/provider.dart';
import 'Home_page.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key, required this.index, required List<String> String});
  final int index;

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // final int index;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      // getdata.fetchQuestion();
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 49, 55),
        appBar: AppBar(
          title: Text('PROFILE '),
          elevation: 0,
          backgroundColor: Colors.black26,
        ),
        body: Column(
          children: [
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(50, 50),
                      bottomRight: Radius.elliptical(50, 50))),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(images[buttonindex]),
                    radius: 70,
                  ),
                  Text(
                    getdata.Datas[buttonindex].name,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'E-Mail',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 171, 168, 168)),
            ),
            Text(
              getdata.Datas[buttonindex].email,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Divider(
              color: Color.fromARGB(255, 183, 181, 181),
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Text(
              'USERNAME',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 171, 168, 168)),
            ),
            Text(
              getdata.Datas[buttonindex].username,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Divider(
              color: Color.fromARGB(255, 183, 181, 181),
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Text(
              'NUMBER',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 171, 168, 168)),
            ),
            Text(
              getdata.Datas[buttonindex].phone,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Divider(
              color: Color.fromARGB(255, 183, 181, 181),
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Text(
              'COMPANY NAME',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 171, 168, 168)),
            ),
            Text(
              getdata.Datas[buttonindex].company.name,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Divider(
              color: Color.fromARGB(255, 183, 181, 181),
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
            Text(
              'CITY',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 171, 168, 168)),
            ),
            Text(
              getdata.Datas[buttonindex].address.city,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Divider(
              color: Color.fromARGB(255, 183, 181, 181),
              indent: 20,
              endIndent: 20,
              thickness: 1.5,
            ),
          ],
        ),
      );
    });
  }
}
