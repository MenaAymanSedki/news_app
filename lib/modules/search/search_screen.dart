import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state)
      {

        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(

          ),
          body: Column(
            children: [
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value)
                {
                    NewsCubit.get(context).getSearch(value.toString());
                },
                decoration:const InputDecoration(
                  label: Text('Search'),
                  prefixIcon: Icon(
                      Icons.search
                  ),

                ) ,
              ),
              buildArticleItem(list, context),
            ],
          ),
        );

      },
    );
  }
}
