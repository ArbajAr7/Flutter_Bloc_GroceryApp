import 'package:flutter/material.dart';
import 'package:learn_bloc/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              '${productDataModel.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ ${productDataModel.price}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text("${productDataModel.name}"),
                  Text("${productDataModel.description}"),
                ],
              ),
              Spacer(),

              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // homeBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                          productDataModel: productDataModel
                        ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.pinkAccent,
                      )),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
