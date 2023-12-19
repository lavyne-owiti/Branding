
import 'package:branding/features/suppliers/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final selectedImageProvider =
    StateProvider.autoDispose<String>((ref) => 'default_image_path.jpg');

final categoryProvider = StateProvider.autoDispose<String>((ref) {
  return "Product";
});

class AddProductWidget extends ConsumerStatefulWidget {
  // final Product product;

  const AddProductWidget(
      {
      // required this.product,
      super.key});

  @override
  ConsumerState<AddProductWidget> createState() => _AddProductWidgetState();
}

class _AddProductWidgetState extends ConsumerState<AddProductWidget> {
  final formKey = GlobalKey<FormState>();
  String? imageUrl;
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  List<String> categories = [
    'Product',
    'Service',
    'Craft',
    'Promotional Product'
  ];
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedFile.path;
      // ref.read(selectedImageProvider).state = pickedFile.path;
    }
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      final productController = ref.read(productControllerProvider.notifier);
      final category = ref.read(categoryProvider);
      final selectedImage = ref.read(selectedImageProvider);

       int? quantity = int.tryParse(quantityController.text.trim());
      double? price = double.tryParse(priceController.text.trim());

      if(quantity != null && price != null){
        productController.addProduct(
        name: titleController.text.trim(),
        quantity: quantity,
        price: price,
        description: descriptionController.text.trim(),
        imageUrl: selectedImage,
        category: category,
      );
      }
      
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(selectedImageProvider);
    final category = ref.watch(categoryProvider);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Title'),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ))),
            onChanged: (value) {
              // setState(() {
              //   title = value;
              // });
            },
          ),
          const SizedBox(height: 16),
          const Text('Product Quantity:'),
          TextField(
            controller: quantityController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding:const EdgeInsets.all(16),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ))),
            onChanged: (value) {
              // setState(() {
              //   title = value;
              // });
            },
          ),
          const SizedBox(height: 16),
          const Text('Product Description:'),
          TextField(
            controller: descriptionController,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ))),
            onChanged: (value) {
              // setState(() {
              //   description = value;
              // });
            },
          ),
          const SizedBox(height: 16),
          const Text('Image URL:'),
          Row(
            children: [
              ElevatedButton(
                onPressed: pickImage,
                child:const Text('Pick Image'),
              ),
             const  SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  controller: TextEditingController(text: selectedImage),
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Price:'),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
                contentPadding:const EdgeInsets.all(16),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1.0,
                    ))),
            onChanged: (value) {
              // setState(() {
              //   price = value;
              // });
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          const Text('Product Category:'),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            value: category,
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.all(16),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              // setState(() {
              //   productCategory = value.toString();
              // });
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                submit();
              },
              child:const Text('Add Product'),
            ),
          ),
        ],
      ),
    );
  }
}



