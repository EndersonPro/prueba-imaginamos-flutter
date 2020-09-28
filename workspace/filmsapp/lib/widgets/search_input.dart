import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final BorderRadius borderRadius;
  final bool readOnly;
  final Function onTap;

  SearchInput({Key key, this.borderRadius, this.readOnly, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .05,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: this.borderRadius,
          border: Border.all(
            color: Colors.white.withOpacity(.2),
          )),
      child: ClipRRect(
        borderRadius: this.borderRadius,
        child: TextField(
          autocorrect: true,
          readOnly: this.readOnly,
          onTap: onTap,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
            filled: true,
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: this.borderRadius,
              borderSide:
                  BorderSide(color: Colors.white.withOpacity(0), width: 0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: this.borderRadius,
              borderSide:
                  BorderSide(color: Colors.white.withOpacity(0), width: 0),
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(.5),
            ),
            fillColor: Colors.white.withOpacity(.2),
          ),
        ),
      ),
    );
  }
}
