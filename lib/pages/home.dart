import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news_api/api/news_api.dart';
import 'package:news_api/main.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/provider/news_provider.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    // final getnews = ref.watch(newsprovider);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text('fetch data'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FluentIcons.alert_12_regular),
            ),
            IconButton(
                onPressed: () {}, icon: Icon(FluentIcons.search_12_regular))
          ]),
      drawer: Drawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage('images/ai.jpeg'), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Raccommmended to you'), Text('show more')],
                ),
              ),
             FutureBuilder<List<newsApiServices>>(
        future:  f,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemBuilder: ((context, index) => ListTile(
                      leading:
                          Image.network(snapshot.data![index].thumbnailUrl!),
                      subtitle: Text(snapshot.data![index].id.toString()),
                      title: Text(snapshot.data![index].title!),
                    )));
          } else if (snapshot.hasError) {
            return Text('error accured');
          }
          return CircularProgressIndicator();
            ],
          ),
        ),
      ),
    );
  }
}
