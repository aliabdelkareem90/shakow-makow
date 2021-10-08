import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shakow_makow/cubit/news-cubit.dart';
import 'package:shakow_makow/cubit/news-states.dart';
import 'package:shakow_makow/widgets/articale-builder.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 29.0,
                          color: NewsCubit.get(context).isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            filled: true,
                            fillColor: Colors.grey[100],
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          controller: _controller,
                          maxLength: 20,
                          onFieldSubmitted: (String val) {
                            NewsCubit.get(context).getSearchResults(val);
                          },
                          onSaved: (String? val) {},
                          validator: (String? val) {
                            if (val!.isEmpty) {
                              return 'Type something to search';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (String val) {
                            // NewsCubit.get(context).getSearchResults(val);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: articleBuilder(list, context, isSearch: true))
              ],
            ),
          ),
        );
      },
    );
  }
}
