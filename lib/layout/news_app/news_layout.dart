import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/web_services/dio_helper.dart';
import 'package:news_app/layout/news_app/cubit/app-cubit.dart';
import 'package:news_app/layout/news_app/cubit/app-state.dart';

class news_layout extends StatelessWidget {
  const news_layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getScience()
        ..getBusiness()
        ..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          if (state is NewsLoadingState) {}
        },
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
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    print('icon presed');
                    // NewsCubit.get(context).changeMode();
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // cubit.getBusiness();
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
