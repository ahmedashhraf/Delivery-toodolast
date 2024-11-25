import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sixvalley_delivery_boy/controller/splash_controller.dart';
import 'package:sixvalley_delivery_boy/data/model/response/order_model.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/images.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_image.dart';


class CustomerInfoWidget extends StatelessWidget {
  final bool showCustomerImage;
  final OrderModel? orderModel;
  final bool isShowShippingBilling;
  const CustomerInfoWidget({Key? key, this.orderModel, this.showCustomerImage = false, this.isShowShippingBilling = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          SizedBox(width: 14,child: Image.asset(Images.customerIcon)),
          const SizedBox(width: 8),
          showCustomerImage?
          Text('customer_info'.tr,style: AlmaraiMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
              color: Get.isDarkMode? Theme.of(context).hintColor: Theme.of(context).primaryColor)):

          Text('customer'.tr,style: AlmaraiMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
              color: Theme.of(context).colorScheme.tertiary))


        ],),



        Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeExtraLarge,
              top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                  orderModel!.customer != null ?
                  Text('${orderModel!.customer!.fName??''} ${orderModel!.customer!.lName??''}',
                      style: AlmaraiRegular.copyWith()):
                      orderModel?.isGuest == 1?
                      Text(orderModel!.shippingAddress!.contactPersonName??'', style: AlmaraiRegular.copyWith()):

                  Text('customer_deleted'.tr),
                   SizedBox(width: Dimensions.paddingSizeSmall),


                  (showCustomerImage && orderModel?.isGuest == 0) ?
                  Container(decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(.25),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: orderModel!.customer != null? CustomImage(
                        image: '${Get.find<SplashController>().baseUrls!.customerImageUrl}/${orderModel!.customer!.image}',
                        height: 20, width: 20, fit: BoxFit.cover,
                      ):const SizedBox(),
                    ),
                  ): const SizedBox(),
                ],
              ),


               SizedBox(height: Dimensions.paddingSizeExtraSmall),
              ((orderModel!.customer != null && orderModel!.shippingAddressData != null) || orderModel?.isGuest == 1)?
              Text('${jsonDecode(orderModel!.shippingAddressData!)['address']}',
                  style: AlmaraiRegular.copyWith(fontSize: Dimensions.fontSizeSmall,
                      color: Theme.of(context).hintColor)):const SizedBox(),
               SizedBox(height: Dimensions.paddingSizeSmall),

              isShowShippingBilling?
              Column(children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${'shipping_address'.tr} : ', style: AlmaraiMedium,),
                    Expanded(child: Text('${jsonDecode(orderModel!.shippingAddressData!)['address']}', style: AlmaraiRegular,)),
                  ],
                ),
                 SizedBox(height: Dimensions.paddingSizeSmall),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${'billing_address'.tr} : ',
                        style: AlmaraiMedium),
                    Expanded(child: Text('${orderModel!.billingAddress != null ?
                      jsonDecode(orderModel!.billingAddress!)['address'] : orderModel!.billingAddress ?? ''}',
                          style: AlmaraiRegular),
                    ),
                  ],
                ),
              ]): const SizedBox(),

            ],
          ),
        ),

      ],),
    );
  }
}
