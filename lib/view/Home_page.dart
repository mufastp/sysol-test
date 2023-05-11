import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../controller/auth.dart';
import '../controller/constent.dart';
import '../controller/provider.dart';
import 'infopage.dart';
import 'login_page.dart';

int buttonindex = 0;

class HomePage extends StatelessWidget {
  AuthService authService = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Color.fromARGB(255, 13, 49, 55),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5,
            ),
            Text('Profiles'),
            IconButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Logout",
                          ),
                          content: const Text(
                            "Are you sure you want to logout",
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  size: 30,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () async {
                                  await authService.signout();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                      (route) => false);
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 13, 49, 55),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 10,
          itemBuilder: (BuildContext ctx, index) {
            // buttonindex = index;
            // print(buttonindex);
            return Container(
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      buttonindex = index;
                      print('buttonindex = ${buttonindex}');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page1(
                              index: index,
                              String: [],
                            ),
                          ));
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(images[index]),
                      radius: 50,
                    ),
                  ),
                  Consumer<DataProvider>(builder: (context, getdata, child) {
                    getdata.fetchQuestion();
                    if (getdata.status == ProviderStatus.COMPLETED) {
                      return Text(
                        getdata.Datas[index].name,

                        //  '${snapshot.data![index].name}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
                ],
              ),
            );
          }),
    );
  }
}
