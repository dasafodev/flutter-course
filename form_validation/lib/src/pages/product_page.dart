import 'package:flutter/material.dart';
import 'package:form_validation/src/models/product_model.dart';
import 'package:form_validation/src/providers/products_provider.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final ProductsProvider productsProvider = ProductsProvider();

  ProductModel product = new ProductModel();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      product = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual), onPressed: () {_selectPhoto}),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  _createName(),
                  _createPrice(),
                  _createAvailable(),
                  _createButton(),
                ],
              )),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Producto'),
      onSaved: (value) => product.title = value,
      validator: (val) => (val.length < 3) ? 'Ingrese un nombre valido' : null,
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (value) => product.value = double.parse(value),
      validator: (val) =>
          (utils.isNumeric(val)) ? null : 'Ingrese un precio valido',
    );
  }

  Widget _createButton() {
    return RaisedButton.icon(
      onPressed: (_loading)?null:_submit,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    setState(() {
    _loading = true;
    });
    (product.id == null)
        ? productsProvider.createProduct(product)
        : productsProvider.editProduct(product);
    showSnackBar('Registro guardado');
    Navigator.pop(context);
  }

  Widget _createAvailable() {
    return SwitchListTile(
      value: product.available,
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        setState(() {
          product.available = value;
        });
      },
      title: Text('Disponible'),
    );
  }

  void showSnackBar(String message){

    final SnackBar snackbar = SnackBar(content: Text(message),duration: Duration(milliseconds: 1500),);
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
