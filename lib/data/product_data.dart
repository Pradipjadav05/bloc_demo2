import '../home/models/products_data_model.dart';

class ProductData {
  static List<Map<String, dynamic>> groceryProducts = [
    {
      'id': '1',
      'name': 'Bananas',
      'description': 'Fresh bananas from Ecuador',
      'price': 0.49,
      'imageUrl': 'https://cdn.shopify.com/s/files/1/0258/4307/3103/products/asset_2_800x.jpg?v=1571839043',
    },
    {
      'id': '2',
      'name': 'Grapes',
      'description': 'Organic, locally grown apples',
      'price': 1.99,
      'imageUrl': 'https://www.jiomart.com/images/product/original/590000452/sharad-seedless-grapes-1-kg-product-images-o590000452-p590116963-0-202203171004.jpg',
    },
    {
      'id': '3',
      'name': 'Bread',
      'description': 'Brown Bread, Tasty',
      'price': 2.49,
      'imageUrl': 'https://thumbs.dreamstime.com/b/bread-cut-14027607.jpg',
    },
    {
      'id': '4',
      'name': 'Mango',
      'description': 'Fresh mango from Junagadh',
      'price': 3.99,
      'imageUrl': 'https://t4.ftcdn.net/jpg/05/41/05/85/360_F_541058586_BI3eaJvZO132lNExAwbARYSg7FfHknWz.jpg',
    },
  ];

  static List<ProductDataModel> product = groceryProducts
      .map((product) => ProductDataModel(
    id: product['id'],
    name: product['name'],
    description: product['description'],
    price: product['price'],
    imageUrl: product['imageUrl'],
  ))
      .toList();
}
