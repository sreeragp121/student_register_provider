import 'package:flutter/material.dart';
import 'package:student_provider/views/add_student/add_student_main.dart';
import 'package:student_provider/views/home_page/grid_view_screen.dart';
import 'package:student_provider/views/home_page/list_view_screen.dart';
import 'package:student_provider/views/home_page/search.dart';


class MyHomePageMain extends StatelessWidget {
  const MyHomePageMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.deepPurple[100],
                child:  MySearchBar(),
              ),
              Container(
                height: 50,
                color: Colors.deepPurple[100],
                child: const TabBar(
                  tabs: [
                    Text('List View'),
                    Text('Grid View'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(
                    child: ListViewHomePage(),
                  ),
                  Center(
                    child: GridViewScreen(),
                  ),
                ]),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context) => AddStudent(),));
            }),
      ),
    );
  }
}
