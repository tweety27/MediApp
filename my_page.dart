import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// my page
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "My Page",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
      ),
      body: Center(
        child: Text("복용 중인 의약품을 등록해주세요."),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );
        },
      ),
    );
  }
}

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "My Page",
          style: TextStyle(color: Colors.black, fontSize: 28),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chevron_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
