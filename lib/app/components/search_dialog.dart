import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  //const SearchDialog({Key? key}) : super(key: key);

  SearchDialog(this.initialText);

  final String initialText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 5,
          right: 5,
          child: Card(
            child: TextFormField(
              initialValue: initialText,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.green[700],
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
              ),
              onFieldSubmitted: (text){
                Navigator.of(context).pop(text);
              },
            ),
          ),
        )
      ],
    );
  }
}
