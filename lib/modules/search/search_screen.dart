import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/app-cubit.dart';
import 'package:news_app/layout/news_app/cubit/app-state.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var listOfData = NewsCubit.get(context).searchList;
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'search must be write word';
                      } else {
                        return null;
                      }
                    },
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (searchVal) {
                      print(searchVal);
                      cubit.getSearchData(searchVal);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Type Your Search Word',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: listOfData.isNotEmpty,
                    builder: (context) => ListView.separated(
                      itemCount: 10,
                      itemBuilder: (context, index) =>
                          buildArticaleItem(listOfData[index], context),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 4,
                      ),
                    ),
                    fallback: (context) => Center(
                      child: Text('Type for Show some result'),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
