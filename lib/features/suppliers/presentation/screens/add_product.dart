// import 'package:branding/features/suppliers/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/add_products_widget.dart';

class AddProductScreen extends StatefulWidget {
  static String routePath = "/add-products";

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    // this method to upload the images ,title and price from admin app to firebase
    // void _uploadForm() async {
    //   final isValid = _formKey.currentState!.validate();
    //   FocusScope.of(context).unfocus();

    //   if (isValid) {
    //     _formKey.currentState!.save();
    //     if (_pickedImage == null) {
    //       GlobalMethods.errorDialog(
    //           subtitle: 'Please pick up an image', context: context);
    //       return;
    //     }
    //     final _uuid = const Uuid().v4();
    //     try {
    //       setState(() {
    //         _isLoading = true;
    //       });
    //       fb.StorageReference storageRef =
    //           fb.storage().ref().child('productsImages').child(_uuid + 'jpg');
    //       final fb.UploadTaskSnapshot uploadTaskSnapshot =
    //           await storageRef.put(kIsWeb ? webImage : _pickedImage).future;
    //       Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
    //       await FirebaseFirestore.instance.collection('products').doc(_uuid).set({
    //         'id': _uuid,
    //         'title': _titleController.text,
    //         'description': _descriptionController.text,
    //         'price': _priceController.text,
    //         'imageUrl': imageUri.toString(),
    //         'productCategoryName': _catValue,
    //         'createdAt': Timestamp.now(),
    //         'isOnSale': false,
    //         'salePrice': 0.1,
    //       });
    //       _clearForm();
    //       // this method to show massage after update
    //       Fluttertoast.showToast(
    //         msg: "Product uploaded succefully",
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //       );
    //     } on FirebaseException catch (error) {
    //       GlobalMethods.errorDialog(
    //           subtitle: '${error.message}', context: context);
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     } catch (error) {
    //       GlobalMethods.errorDialog(subtitle: '$error', context: context);
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     } finally {
    //       setState(() {
    //         _isLoading = false;
    //       });
    //     }
    //   }
    // }

    //   Future<void> _pickImage() async {
    //   if (!kIsWeb) {
    //     final ImagePicker _picker = ImagePicker();
    //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //     if (image != null) {
    //       var selected = File(image.path);
    //       setState(() {
    //         _pickedImage = selected;
    //       });
    //     } else {
    //       print('No image has been picked');
    //     }
    //   } else if (kIsWeb) {
    //     final ImagePicker _picker = ImagePicker();
    //     XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //     if (image != null) {
    //       var f = await image.readAsBytes();
    //       setState(() {
    //         webImage = f;
    //         _pickedImage = File('a');
    //       });
    //     } else {
    //       print('No image has been picked');
    //     }
    //   } else {
    //     print('Something went wrong');
    //   }
    // }

    //     Widget dottedBorder({
    //   required Color color,
    // }) {
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: DottedBorder(
    //         dashPattern: const [6.7],
    //         borderType: BorderType.RRect,
    //         color: color,
    //         radius: const Radius.circular(12),
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Icon(
    //                 Icons.image_outlined,
    //                 color: color,
    //                 size: 50,
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               TextButton(
    //                   onPressed: (() {
    //                     _pickImage();
    //                   }),
    //                   child: TextWidget(
    //                     text: 'Choose an image',
    //                     color: Colors.blue,
    //                   ))
    //             ],
    //           ),
    //         )),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: AddProductWidget( ),
           
        ),
      ),
    );
  }
}
