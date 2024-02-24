import 'package:flutter/material.dart';

import '../common/colors_constants.dart';
import '../data/search_json.dart';
import '../widget/category_story_item_widget.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPageScreen> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: size.width - 30,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: textFieldBackground,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: white.withOpacity(0.3),
                  ),
                ),
                style: TextStyle(color: white.withOpacity(0.3)),
                cursorColor: white.withOpacity(0.3),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: List.generate(
                searchCategories.length,
                (index) {
                  return CategoryStoryItemWidget(
                    name: searchCategories[index],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          spacing: 1,
          runSpacing: 1,
          children: List.generate(searchImages.length, (index) {
            return Container(
              width: (size.width - 3) / 3,
              height: (size.width - 3) / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(searchImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        )
      ],
    ));
  }
}
