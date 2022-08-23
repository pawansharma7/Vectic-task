// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_etic/controllers/cart_controller.dart';
import 'package:task_etic/data/product_data.dart';
import 'package:task_etic/helper/colors.dart';
import 'package:task_etic/helper/responsive.dart';
import 'package:task_etic/helper/styles.dart';

class ProductWidget extends StatefulWidget {
  final String productImage,
      productName,
      productDescription,
      productSoldBy,
      productLeft,
      productPrice,
      productOGPrice;
  String productQty, productSize;
  ProductWidget(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productDescription,
      required this.productSoldBy,
      required this.productQty,
      required this.productLeft,
      required this.productOGPrice,
      required this.productPrice,
      required this.productSize})
      : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  // default size for every type of app
  double deviceHeight = 690;
  double deviceWidth = 360;

  // to set orientation
  getOrientation() {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.portrait) {
      setState(() {
        deviceHeight = MediaQuery.of(context).size.height;
      });
    } else {
      setState(() {
        deviceHeight = MediaQuery.of(context).size.width;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<ProductCart>(context);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          width: size.width,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.productImage,
                  height: getProportionateScreenHeight(140),
                  width: getProportionateScreenWidth(size.width * 0.27),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: Styles().boldContentStyle,
                    ),
                    Text(
                      widget.productDescription,
                      style: Styles().contentStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Sold by:" + widget.productSoldBy,
                      style: Styles().smallContentStyle,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.redAccent.withOpacity(0.1)),
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              // height: 30,
                              color: Colors.grey[100],
                              child: DropdownButton<String>(
                                isDense: true,
                                underline: const SizedBox(),
                                focusColor: Colors.grey[500],
                                elevation: 0,
                                selectedItemBuilder: (_) {
                                  return [
                                    Text(
                                      "Size: " + widget.productSize,
                                      style: Styles().boldContentStyle,
                                    ),
                                    Text(
                                      "Size: " + widget.productSize,
                                      style: Styles().boldContentStyle,
                                    ),
                                    Text(
                                      "Size: " + widget.productSize,
                                      style: Styles().boldContentStyle,
                                    )
                                  ];
                                },
                                style: const TextStyle(color: Colors.black),
                                value: widget.productSize,
                                items: productSize.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: Styles().boldContentStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? val) {
                                  setState(() {
                                    log(val.toString());
                                    widget.productSize = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                              // height: 30,
                              color: Colors.grey[100],
                              child: DropdownButton<String>(
                                isDense: true,
                                focusColor: Colors.white,
                                underline: const SizedBox(),
                                style: const TextStyle(color: Colors.black),
                                value: widget.productQty,
                                selectedItemBuilder: (_) {
                                  return [
                                    Text(
                                      "Qty: " + widget.productQty,
                                      style: Styles().boldContentStyle,
                                    ),
                                    Text(
                                      "Qty: " + widget.productQty,
                                      style: Styles().boldContentStyle,
                                    ),
                                    Text(
                                      "Qty: " + widget.productQty,
                                      style: Styles().boldContentStyle,
                                    )
                                  ];
                                },
                                items: productQty.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: Styles().boldContentStyle,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? val) {
                                  // if (int.parse(val!) >
                                  //     int.parse(widget.productQty)) {
                                  //   response.increaseQuantity(
                                  //       widget.productPrice, val);
                                  // } else {
                                  //   response.decreaseQuantity(
                                  //       widget.productPrice, val);
                                  // }
                                  setState(() {
                                    log(val.toString());
                                    widget.productQty = val!;
                                  });
                                },
                              )),
                          const SizedBox(width: 7),
                          widget.productLeft != '0'
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: primaryColor, width: 1),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    widget.productLeft + " left",
                                    style: Styles().smallTextstyle,
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Row(
                        children: [
                          Text(
                            "₹" + widget.productPrice,
                            style: Styles().boldContentStyle,
                          ),
                          const Spacer(),
                          widget.productOGPrice != widget.productPrice
                              ? Text(
                                  "₹" + widget.productOGPrice,
                                  style: Styles().boldContentStyle.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey[400],
                                      ),
                                )
                              : const SizedBox(),
                          const Spacer(),
                          widget.productOGPrice != widget.productPrice
                              ? Text(
                                  (100 -
                                              (int.parse(widget.productPrice) *
                                                      100) /
                                                  int.parse(
                                                      widget.productOGPrice))
                                          .round()
                                          .toString() +
                                      "% OFF",
                                  style: Styles().boldContentStyle.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w400),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 12,
          top: 25,
          child: Checkbox(
            value: response.selectedItems.contains(widget.productName),
            onChanged: (vc) {
              if (response.selectedItems.contains(widget.productName)) {
                if (mounted) {
                  setState(() {
                    response.removeFromCart(
                        widget.productName, widget.productPrice);
                  });
                }
              } else {
                if (mounted) {
                  setState(() {
                    response.addToCart(widget.productName, widget.productPrice);
                  });
                }
              }
            },
          ),
        ),
        Positioned(
          right: 10,
          top: 5,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
