import 'package:bookly_app/Features/search/presentations/manager/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key, required this.userSearch});

  String userSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (data) {
        userSearch = data;
        BlocProvider.of<SearchedBooksCubit>(context)
            .fetchSearchedBooks(userSearch: userSearch);
      },
      onChanged: (data) {
        userSearch = data;
      },
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
