import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_etic/data/product_data.dart';
import 'package:task_etic/helper/colors.dart';
import 'package:task_etic/helper/responsive.dart';
import 'package:task_etic/helper/styles.dart';
import 'package:task_etic/ui/widgets/product_item.dart';
import 'package:task_etic/ui/widgets/selected_items.dart';

import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final response = Provider.of<ProductCart>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          size: 27,
        ),
        elevation: 2,
        title: Text(
          'Shopping bag'.toUpperCase(),
          style: Styles().appBarStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.grey[600],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height - (AppBar().preferredSize.height * 2),
              child: Column(
                children: [
                  SelectedItemsCount(
                      selected: response.selectedItems.length,
                      totalPrice: response.totalPrice),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(
                          productImage: productImages[index],
                          productDescription: productDesc[index],
                          productName: productName[index],
                          productSoldBy: productSoldBy[index],
                          productSize: productSize[index],
                          productQty: productQty[index],
                          productLeft: productLeft[index],
                          productPrice: productPrice[index],
                          productOGPrice: productOgPrice[index],
                        );
                      },
                    ),
                  ),
                  response.selectedItems.isNotEmpty ?  SizedBox(
                      height: getProportionateScreenHeight(93)) : const SizedBox()
                ],
              ),
            ),
            response.selectedItems.isNotEmpty
                ? Positioned(
                    bottom: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(color: lightPink),
                          width: size.width,
                          alignment: Alignment.center,
                          child: Text(
                            response.selectedItems.length.toString() +
                                " Items selected for this order",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(
                              top: 11,right: 15, left: 15),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            height: getProportionateScreenHeight(55),
                            minWidth: size.width - 30,
                            onPressed: () {},
                            child: Text(
                              "Place Order".toUpperCase(),
                              style: Styles().materialButton.copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5),
                            ),
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
