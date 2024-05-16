// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:carousel_slider/carousel_slider.dart';

// class ImageSlideshow extends StatefulWidget {
//   @override
//   _ImageSlideshowState createState() => _ImageSlideshowState();
// }

// class _ImageSlideshowState extends State<ImageSlideshow> {
//   List<String> imageUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchImageUrls();
//   }

//   // Future<void> fetchImageUrls() async {
//   //   final response =
//   //       await http.get(Uri.parse('http://192.168.1.106:3000/images'));
//   //   if (response.statusCode == 200) {
//   //     final List<dynamic> data = jsonDecode(response.body);
//   //     setState(() {
//   //       imageUrls = data
//   //           .map((item) =>
//   //               'http://192.168.1.106:3000/images/${item['filename']}')
//   //           .toList();
//   //     });
//   //   } else {
//   //     print('Failed to fetch image URLs. Status code: ${response.statusCode}');
//   //   }
//   // }

//   Future<void> fetchImageUrls() async {
//     List<String> filenames = [
//       'file1.jpg',
//       'file2.png',
//       'file3.png',
//       // Add more filenames as needed
//     ];

//     setState(() {
//       // imageUrls = filenames
//       //     .map((filename) =>
//       //         'http://[fe80::cd13:4ad8:2aef:c1eb%18]:3000/images/$filename')
//       //     .toList();
//       imageUrls =
//           filenames.map((filename) => 'assets/images/$filename').toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 400.0,
//         enlargeCenterPage: true,
//         autoPlay: true,
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         viewportFraction: 0.8,
//       ),
//       items: imageUrls.map((url) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//               ),
//               child: Image.network(
//                 url,
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image Slideshow'),
// //       ),
// //       body: ImageSlideshow(),
// //     ),
// //   ));
// // }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

// void main() {
//   runApp(ImageSlideshow());
// }

// class ImageSlideshow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Slideshow',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageSlideshow(),
//     );
//   }
// }

class ImageSlideshow extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/img3.png',
    'assets/images/img1.png',
    'assets/images/img4.png',
    'assets/images/img2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 120, 79, 54),
      appBar: AppBar(
        title: Text('Image Slideshow'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 232, 209, 201),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
          items: imageUrls.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
