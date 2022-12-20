import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/app-cubit.dart';
import 'package:news_app/layout/news_app/cubit/app-state.dart';
import 'package:news_app/modules/search/search_screen.dart';

class news_layout extends StatelessWidget {
  const news_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  print('icon presed');
                  NewsCubit.get(context).changeMode();
                  print(NewsCubit.get(context).isDark);
                },
                icon: Icon(Icons.mode_night_rounded),
              )
            ],
          ),
          body: cubit.screns[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20.0,
            currentIndex: cubit.index, //the defult is 0
            selectedFontSize: 18.0, //defult 14
            onTap: (ind) {
              cubit.changeIndex(ind);
            },
            items: cubit.bottomItems,
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // cubit.getBusiness();
          //   },
          //   child: const Icon(
          //     Icons.add,
          //     color: Colors.white,
          //   ),
          // ),
        );
      },
    );
  }
}
