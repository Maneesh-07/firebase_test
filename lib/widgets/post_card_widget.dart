// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class PostCardWidget extends StatelessWidget {
//   PostCardWidget(
//       {super.key,
//       required this.isLiked,
//       required this.documentSnapshot,
//       required this.isSaved});

//   final bool isLiked;
//   final bool isSaved;

//   PostCardController postObj = PostCardController();

//   final QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot;

//   @override
//   Widget build(BuildContext context) {
//     postObj.savedToRxSaved(isSaved);
//     postObj.likedToRxLiked(
//         isLiked, (documentSnapshot.data()['likes'] as List<dynamic>).length);
//     return Padding(
//       padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           kHeight10,
//           Text(
//             formatDateTime(
//                 (documentSnapshot.data()['time'] as Timestamp).toDate()),
//             style: const TextStyle(color: Colors.grey, fontSize: 13),
//           ),
//           kHeight1,
//           Text(
//             documentSnapshot.data()['userName'],
//             style: const TextStyle(
//                 color: kWhite, fontSize: 18, fontWeight: FontWeight.w400),
//           ),
//           kHeight1,
//           Text(
//             documentSnapshot.data()['title'],
//             overflow: TextOverflow.ellipsis,
//             style: const TextStyle(
//                 color: kWhite, fontSize: 23, fontWeight: FontWeight.bold),
//             maxLines: 2,
//           ),
//           kHeight10,
//           Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: kWhite)),
//             child: Column(
//               children: [
//                 GestureDetector(
//                   onTap: () => Get.to(() => FullScreenImage(
//                       image: documentSnapshot.data()['imageUrl'])),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(5),
//                     child: Image.network(documentSnapshot.data()['imageUrl']),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     kWidth10,
//                     GestureDetector(
//                       onTap: () async {
//                         String mobile = getUser()!.phoneNumber!;
//                         postObj.isLiked.value =
//                             await likePost(mobile, documentSnapshot.data());

//                         if (postObj.isLiked.value) {
//                           postObj.likes.value++;
//                         } else {
//                           postObj.likes.value--;
//                         }
//                       },
//                       child: Obx(
//                         () => Row(
//                           children: [
//                             Icon(
//                               Icons.arrow_circle_up_outlined,
//                               color: postObj.isLiked.value ? kRed : kWhite,
//                             ),
//                             Text(
//                               '  ${postObj.likes.value} Likes',
//                               style: TextStyle(
//                                   color: postObj.isLiked.value ? kRed : kWhite),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     IconButton(
//                         onPressed: () {
//                           //comment
//                           openBottomSheet(context, documentSnapshot);
//                         },
//                         icon: const Icon(
//                           Icons.comment,
//                           color: kWhite,
//                         )),
//                     const Spacer(),
//                     IconButton(
//                         onPressed: () async {
//                           await Share.share(
//                             'Hey, check out this image!\n${documentSnapshot.data()['imageUrl']}',
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.share,
//                           color: kWhite,
//                         )),
//                     const Spacer(),
//                     IconButton(
//                         onPressed: () async {
//                           String mobile = getUser()!.phoneNumber!;

//                           postObj.isSaved.value =
//                               await savePost(mobile, documentSnapshot.data());
//                         },
//                         icon: Obx(
//                           () => Icon(
//                             Icons.save_outlined,
//                             color: postObj.isSaved.value ? kRed : kWhite,
//                           ),
//                         )),
//                     kWidth10,
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
