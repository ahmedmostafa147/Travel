import 'package:cached_network_image/cached_network_image.dart';
import 'package:dughri/core/constant/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


class ListPlacesToStay extends StatelessWidget {
  const ListPlacesToStay({super.key,required this.hotels});
  final List hotels;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 150.h,
        child:ListView.builder(
                itemCount: hotels.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () async {
                        Uri url = Uri.parse(kHotelUrl);
                        await launchUrl(url);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(24),
                            ),
                            child: Image(
                              image: CachedNetworkImageProvider(
                                hotels[index]['imageUrl'],
                              ),
                              height: 150.h,
                              width: 150.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              width: 130.w,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, .5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Text(
                                hotels[index]['name'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}

// class CategoriesListMallika1 extends StatelessWidget {
//   const CategoriesListMallika1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           CategoryCardMallika1(
//             title: "Cake",
//             image:
//                 "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-1.png?alt=media&token=245741de-7966-4f5b-805f-6dd8e5dbea80",
//             onTap: () {},
//             selected: true,
//           ),
//           CategoryCardMallika1(
//               title: "Pasta",
//               image:
//                   "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-2.png?alt=media&token=3ae6f4e6-53cd-4ac1-9e12-b491c351771a",
//               onTap: () {}),
//           CategoryCardMallika1(
//               title: "Drinks",
//               image:
//                   "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-3.png?alt=media&token=43ed89ab-93de-42ca-90df-0231699eebf0",
//               onTap: () {}),
//           CategoryCardMallika1(
//               title: "Rice",
//               image:
//                   "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FImage-4.png?alt=media&token=0c2592ca-7bbc-40fa-80ae-163d739e308f",
//               onTap: () {}),
//         ],
//       ),
//     );
//   }
// }

// class CategoryCardMallika1 extends StatelessWidget {
//   final String title;
//   final String image;
//   final Function() onTap;
//   final bool selected;
//   const CategoryCardMallika1(
//       {required this.title,
//       required this.image,
//       required this.onTap,
//       this.selected = false,
//       Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       width: selected ? 2 : 0, color: const Color(0xffFF8527)),
//                   borderRadius: BorderRadius.circular(20.0)),
//               child: ClipRRect(
//                 child: Image.network(
//                   image,
//                   width: 75,
//                   height: 75,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 12.5,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                   fontSize: 16,
//                   color: selected ? const Color(0xffFF8527) : Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
