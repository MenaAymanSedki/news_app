import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context ,state){} ,
      builder: (context,state)
      {
        var list = NewsCubit.get(context).sports;
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=> buildArticleItem(list[index],context),
          separatorBuilder: (context,index)=> MyDivider(),
          itemCount: 10,
        );
      },
    );
  }
}
