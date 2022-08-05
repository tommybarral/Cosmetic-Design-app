import 'package:cosmetic_skin_app/models/product.dart';
import 'package:cosmetic_skin_app/models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddingFormProductScreen extends StatefulWidget {
  AddingFormProductScreen({Key? key}) : super(key: key);

  @override
  State<AddingFormProductScreen> createState() => _AddingFormProductScreenState();
}

class _AddingFormProductScreenState extends State<AddingFormProductScreen> {
  final _form = GlobalKey<FormState>();

  final _imageUrlController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  final _imageFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  var _editingProduct = Product(
    id: '',
    title: '',
    imageUrl: '',
    description: '',
    price: 0,
  );

  SizedBox containerButton(Color color, Function() pressed, String titleButton) {
    return SizedBox(
      height: 60,
      width: 130,
      child: FlatButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: pressed,
        child: Text(titleButton),
      ),
    );
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }
  @override
  void initState() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void dispose() {
    _imageFocusNode.dispose();
    _imageFocusNode.removeListener(_updateImageUrl);
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    } else {
    _form.currentState!.save();
    }
    if (_editingProduct.id != null) {
      //Provider.of<ProductData>(context).getProduct(_editingProduct.id, _editingProduct);
    } else {
      try {
      } catch (error) {
        print(error);
        throw error;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87, width: 2),
                      ),
                      child: _imageUrlController.text.isEmpty
                          ? const Center(child: Text('Enter an URL'))
                          : Image.network(_imageUrlController.text, fit: BoxFit.cover),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _imageUrlController,
                      focusNode: _imageFocusNode,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'imageUrl',
                      ),
                      onSaved: (value) {
                        _editingProduct = Product(
                          id: _editingProduct.id,
                          title: _editingProduct.title,
                          imageUrl: value.toString(),
                          description: _editingProduct.description,
                          price: _editingProduct.price,
                        );
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_titleFocusNode);
                      },
                    ),
                    TextFormField(
                      controller: _titleController,
                      focusNode: _titleFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      onSaved: (value) {
                        _editingProduct = Product(
                          id: _editingProduct.id,
                          title: value.toString(),
                          imageUrl: _editingProduct.imageUrl,
                          description: _editingProduct.description,
                          price: _editingProduct.price,
                        );
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_descriptionFocusNode);
                      },
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      focusNode: _descriptionFocusNode,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'description',
                      ),
                      onSaved: (value) {
                        _editingProduct = Product(
                          id: _editingProduct.id,
                          title: _editingProduct.title,
                          imageUrl: _editingProduct.imageUrl,
                          description: value.toString(),
                          price: _editingProduct.price,
                        );
                      },

                    ),
                    TextFormField(
                      controller: _priceController,
                      focusNode: _priceFocusNode,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        labelText: 'price',
                      ),
                      onSaved: (value) {
                        _editingProduct = Product(
                          id: _editingProduct.id,
                          title: _editingProduct.title,
                          imageUrl: _editingProduct.imageUrl,
                          description: _editingProduct.description,
                          price: double.parse(value!),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          containerButton(Colors.red, () {Navigator.of(context);}, 'Cancel'),
                          containerButton(Colors.green, () {_saveForm();}, 'Add product'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
