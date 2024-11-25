import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/controller/order_controller.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';

class OrderTypeButton extends StatelessWidget {
  final String text;
  final int index;
  const OrderTypeButton({Key? key, required this.text, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.find<OrderController>().setOrderTypeIndex(index);
      },
      child: GetBuilder<OrderController>(builder: (order) {
        return Padding(
          padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall,
              vertical: order.orderTypeIndex == index ? Dimensions.paddingSizeSmall : Dimensions.paddingSizeChat),
          child: Container(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: order.orderTypeIndex == index ?
              Theme.of(context).cardColor : Theme.of(context).primaryColor.withOpacity(.75),
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeOverLarge),
            ),
            child: Text(text, style: order.orderTypeIndex == index ? AlmaraiMedium.copyWith(color: order.orderTypeIndex == index
                ? Get.isDarkMode ? Colors.white:Theme.of(context).primaryColor  : Theme.of(context).cardColor):
            AlmaraiRegular.copyWith(color: order.orderTypeIndex == index
                ? Theme.of(context).cardColor : Theme.of(context).cardColor.withOpacity(.8))),
          ),
        );
      },
      ),
    );
  }
}