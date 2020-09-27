import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final BorderRadius borderRadius;
  final bool readOnly;
  final Function onTap;

  SearchInput({Key key, this.borderRadius, this.readOnly, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          borderRadius: this.borderRadius,
          border: Border.all(
            color: Colors.white.withOpacity(.2),
          )),
      child: ClipRRect(
        borderRadius: this.borderRadius,
        child: TextField(
          enableInteractiveSelection: false,
          readOnly: this.readOnly,
          onTap: onTap,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: InputBorder.none,
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(.5),
            ),
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(.5),
            ),
            hintText: 'Search',
            fillColor: Colors.white.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}
