import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakow_makow/cubit/news-cubit.dart';
import 'package:shakow_makow/cubit/news-states.dart';
import 'package:shakow_makow/widgets/articale-builder.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).science;

        return articleBuilder(list, context);
      },
    );  }
}