import 'package:flutter/material.dart';
import 'package:sixvalley_delivery_boy/controller/order_controller.dart';
import 'package:sixvalley_delivery_boy/controller/splash_controller.dart';
import 'package:sixvalley_delivery_boy/helper/price_converter.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/images.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:get/get.dart';

class OrderedItemProductList extends StatelessWidget {
  final OrderController? orderController;
  const OrderedItemProductList({Key? key, this.orderController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
      decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius:  BorderRadius.only(topLeft: Radius.circular(Dimensions.paddingSizeDefault),
          topRight: Radius.circular(Dimensions.paddingSizeDefault))
    ),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
            child: Text('item_info'.tr, style: AlmaraiMedium.copyWith(color: Theme.of(context).colorScheme.secondary,fontSize: Dimensions.fontSizeLarge),),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderController!.orderDetails!.length,
            itemBuilder: (context, index) {
              return Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeSmall),
                      child: Text('${'item'.tr} ${index+1}',style: AlmaraiRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                    ),
                    Row(children: [
                    SizedBox(height: Dimensions.productImageSizeOrderDetails,
                      width: Dimensions.productImageSizeOrderDetails,
                      child: ClipRRect(borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          imageErrorBuilder: (c,o,s) => Image.asset(Images.placeholder),
                          placeholder: Images.placeholder,
                          image: '${Get.find<SplashController>().baseUrls!.productThumbnailUrl}'
                              '/${orderController!.orderDetails![index].productDetails!.thumbnail}',
                          height: Dimensions.productImageSizeOrderDetails,
                          width: Dimensions.productImageSizeOrderDetails, fit: BoxFit.cover,),),),
                     SizedBox(width: Dimensions.paddingSizeSmall),


                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Row(children: [
                            Expanded(child: Text(
                              orderController!.orderDetails![index].productDetails!.name!,
                              style: AlmaraiMedium.copyWith(fontSize: Dimensions.fontSizeDefault,
                                  color: Theme.of(context).highlightColor),
                              maxLines: 2, overflow: TextOverflow.ellipsis,),),
                          ],),
                             SizedBox(height: Dimensions.paddingSizeExtraSmall),


                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Row(children: [
                                  Text('${'quantity'.tr} : ',
                                      style: AlmaraiRegular.copyWith(color: Theme.of(context).highlightColor)),

                                  Text(' ${orderController!.orderDetails![index].qty}',
                                      style: AlmaraiMedium.copyWith(color: Theme.of(context).primaryColor)),],),
                                ]),


                            orderController!.orderDetails![index].variant != ''?
                            Row(
                              children: [
                                Text('${'variation'.tr} : ',
                                    style: AlmaraiRegular.copyWith(color: Theme.of(context).highlightColor)),
                                Text(' ${orderController!.orderDetails![index].variant}', style: AlmaraiMedium.copyWith()),
                              ],
                            ): const SizedBox(),

                            Row(children: [
                              Text('${'price'.tr} (${'per_unit'.tr}) : ', style: AlmaraiRegular.copyWith(color: Theme.of(context).highlightColor)),
                              Text(PriceConverter.convertPrice(orderController!.orderDetails![index].price),
                                  style: AlmaraiMedium.copyWith(color: Theme.of(context).primaryColor))]),


                          ]),
                    ),
                  ]),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                      child: Divider(height: .5,color: Theme.of(context).hintColor.withOpacity(.5),),
                    ),
                  ]);
            },
          ),
        ],
      ),
    );
  }
}
