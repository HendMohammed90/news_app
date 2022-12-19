import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/app-cubit.dart';
import 'package:news_app/layout/news_app/cubit/app-state.dart';
import 'package:news_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var listOfData = NewsCubit.get(context).sports;
        return ConditionalBuilder(
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
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
