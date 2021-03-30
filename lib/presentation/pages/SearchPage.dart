import 'package:flutter/material.dart';
import 'package:spotify2_app/presentation/components/SearchComponents/genres_list.dart';
import 'dart:math';

import 'package:spotify2_app/presentation/components/SearchComponents/searchbar.dart';
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SearchBar(),
            SizedBox(height: 30,),
            GenresList(genresTitle: "Your Top genres",totalItems:4),
            SizedBox(height: 30,),
            GenresList(genresTitle: "Browse All",totalItems:7),
          ],
        ),
      ),
    );
  }
}

// class GenresList extends StatelessWidget {
//   final String genresTitle;
//   final int totalItems;
//   const GenresList({
//     Key key,
//     this.genresTitle,
//     this.totalItems
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(genresTitle,style: TextStyle(color: Colors.white,fontSize: 20),),
//         Flexible(
//           child: GridView.builder(
//             itemCount: totalItems,
//             primary: false,
//             padding: const EdgeInsets.only(top:20),
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2,crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 20.0),
//             itemBuilder: (BuildContext context,int index){
//               return GenresListItem(title: "Pop",);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class GenresListItem extends StatelessWidget {
//   final String title;
//   GenresListItem({this.title,});
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       decoration: BoxDecoration(
//           color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
//           borderRadius: BorderRadius.circular(5)
//       ),
//       padding: EdgeInsets.all(10),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           shadows: <Shadow>[
//             Shadow(
//               offset: Offset(1.0, 1.0),
//               blurRadius: 3.0,
//               color: Color.fromARGB(255, 0, 0, 0),
//             ),
//             Shadow(
//               offset: Offset(1.0, 1.0),
//               blurRadius: 8.0,
//               color: Color.fromARGB(125, 0, 0, 255),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
