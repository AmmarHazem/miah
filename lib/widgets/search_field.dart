import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(30),
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: SizedBox(
            width: 60,
            child: Row(
              children: [
                Text(
                  'بحث',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          // hintText: '',
          // hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}
