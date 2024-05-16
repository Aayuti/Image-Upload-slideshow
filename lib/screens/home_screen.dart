import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:systemic_altruism/screens/Slideshow.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textController = TextEditingController();
  late File _selectedFile;

  void initState() {
    super.initState();
    _selectedFile = File('');
  }

  // Future<void> uploadImage(File imageFile) async {
  //   // Create a multipart request
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('http://localhost:3000/upload'));

  //   // Attach the image file to the request
  //   request.files
  //       .add(await http.MultipartFile.fromPath('images', imageFile.path));

  //   // Send the request
  //   var response = await request.send();

  //   // Check the response status
  //   if (response.statusCode == 200) {
  //     print('Image uploaded successfully');
  //   } else {
  //     print('Failed to upload image. Status code: ${response.statusCode}');
  //   }
  // }/

  Future<void> uploadImage(File imageFile, BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uploading Image'),
          content:
              CircularProgressIndicator(), // Display a circular progress indicator
        );
      },
    );

    final url = Uri.parse('http://[fe80::cd13:4ad8:2aef:c1eb%18]:3000/upload');
    final request = http.MultipartRequest('POST', url);
    request.files
        .add(await http.MultipartFile.fromPath('images', imageFile.path));

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        Navigator.pop(context); // Dismiss the progress dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: Text('Image uploaded successfully'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageSlideshow()),
                    );
                  },
                  child: Text('View images'),
                ),
              ],
            );
          },
        );
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        Navigator.pop(context); // Dismiss the progress dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('Failed to upload image. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } on SocketException catch (e) {
      print('Error uploading image: $e');
      Navigator.pop(context); // Dismiss the progress dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content:
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                // Text('Success'),
                // Icon(Icons.error, color: Colors.red), // Display an error icon
                // SizedBox(height: 10),
                const Text('Image uploaded sucessfully'),
            //   ],
            // ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImageSlideshow()),
                  );
                },
                child: Text('View Slideshow'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error uploading image: $e');
      Navigator.pop(context); // Dismiss the progress dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to upload image. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _selectFile() async {
    print('browse working');
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    } else {
      // User canceled image picker
    }
  }

  void _showSnackBar() {
    print('Working');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(221, 222, 169, 144),
      ),
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 209, 201),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 120, 79, 54),
              ),
              height: 650,
              width: 500,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: SizedBox(
                      height: 50,
                      width: 400,
                      child: Center(
                          child: Text(
                        'Select any image',
                        style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 232, 209, 201),
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 320,
                    child: TextFormField(
                      onTap: _selectFile,
                      readOnly: true,
                      textAlign: TextAlign.start,
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Browse',
                        suffixIcon: const Icon(Icons.folder),
                        suffixIconColor: const Color.fromARGB(255, 114, 77, 64),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 232, 209, 201),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Border radius
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2), // Border color and width
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 114, 77, 64),
                              width: 2), // Border color when focused
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 250,
                        width: 350,
                        color: Color.fromARGB(255, 120, 79, 54),
                        child: _selectedFile.path.isNotEmpty
                            ? Container(
                                height: 200, // Adjust height as needed
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: _selectedFile.path.startsWith('http')
                                      ? Image.network(_selectedFile.path)
                                      : Image.file(_selectedFile),
                                ),
                              )
                            : null,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: FloatingActionButton(
                        elevation: 0,
                        foregroundColor: const Color.fromARGB(255, 114, 77, 64),
                        backgroundColor:
                            const Color.fromARGB(255, 232, 209, 201),
                        onPressed: () async {
                          if (_selectedFile.path.isNotEmpty) {
                            await uploadImage(_selectedFile, context);
                          } else {
                            print('No image selected');
                          }
                        },
                        child: const Text(
                          'Upload',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
