import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakow_makow/cubit/news-cubit.dart';
import 'package:shakow_makow/cubit/news-states.dart';
import 'package:shakow_makow/widgets/articale-builder.dart';

class SportsScreen extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (context, state)
            {
                var list = NewsCubit.get(context).sports;

                return articleBuilder(list, context);
            },
        );
    }
}