import 'package:flutter/material.dart';
import 'package:news_api_simple_call/screen/home_screen/model/news_model.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("news"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: homeProviderF!.getCoronaData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      NewsModel? c1 = snapshot.data;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("${c1.articles![index].title}"),
                            subtitle: Text("${c1.articles![index].description}"),
                          );
                        },
                        itemCount: c1!.articles!.length,
                      );
                    }
                    return Container(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ));
  }
}