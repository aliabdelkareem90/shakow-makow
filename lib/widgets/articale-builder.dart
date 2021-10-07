import 'package:flutter/material.dart';

// Widget newsTile({article, context}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.all(8.0),
//             width: 100,
//             height: 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               image: DecorationImage(
//                 image: NetworkImage('${article['urlToImage']}'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10.0,
//           ),
//           Expanded(
//             child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     '${article['title']}',
//                     style: Theme.of(context).textTheme.headline1,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget buildArticleItem({article, context}) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );

Widget articleBuilder(list, context, {search = false}) {
  if (list.length > 0) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) =>
          buildArticleItem(article: list[index], context: context),
      physics: BouncingScrollPhysics(),
    );
  } else {
    return Center(child: CircularProgressIndicator());
  }
}
