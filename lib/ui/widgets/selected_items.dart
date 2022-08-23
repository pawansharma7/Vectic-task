import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_etic/controllers/cart_controller.dart';
import 'package:task_etic/data/product_data.dart';
import 'package:task_etic/helper/colors.dart';
import 'package:task_etic/helper/responsive.dart';
import 'package:task_etic/helper/styles.dart';

class SelectedItemsCount extends StatelessWidget {
  final int selected, totalPrice;
  const SelectedItemsCount(
      {Key? key, required this.selected, required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repsonse = Provider.of<ProductCart>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(color: greyColor),
      child: ListTile(
        leading: Checkbox(
          activeColor: primaryColor,
          onChanged: (val) {
            if (repsonse.selectedItems.isEmpty) {
              for (var i = 0; i < productName.length; i++) {
                repsonse.addToCart(productName[i], productPrice[i]);
              }
            } else if (repsonse.selectedItems.length == productName.length) {
              repsonse.clearCart();
            } else {
              repsonse.clearCart();
              for (var i = 0; i < productName.length; i++) {
                repsonse.addToCart(productName[i], productPrice[i]);
              }
            }
          },
          value: repsonse.selectedItems.isNotEmpty,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '${repsonse.selectedItems.length}/${productName.length} items selected'
                      .toUpperCase(),
                  style: Styles()
                      .selectedItemsTextStyle
                      .copyWith(fontSize: getFontSize(13)),
                ),
                Text(
                  ' (₹${repsonse.totalPrice})',
                  style: Styles()
                      .selectedItemsTextStyle
                      .copyWith(color: primaryColor),
                ),
              ],
            ),
            Image.asset(
              'assets/delete.png',
              scale: 25,
              color: Colors.black,
            )
          ],
        ),
        trailing: Icon(Icons.favorite_border, color: Colors.grey[700]),
      ),
    );
  }
}
