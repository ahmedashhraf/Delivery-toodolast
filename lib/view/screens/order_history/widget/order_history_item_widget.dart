import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/controller/localization_controller.dart';
import 'package:sixvalley_delivery_boy/data/model/response/order_model.dart';
import 'package:sixvalley_delivery_boy/helper/date_converter.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/images.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:sixvalley_delivery_boy/view/screens/order/order_details_screen.dart';
import 'package:sixvalley_delivery_boy/view/screens/order/widget/cal_chat_widget.dart';
import 'package:sixvalley_delivery_boy/view/screens/order/widget/customer_info_widget.dart';


class OrderHistoryItemWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const OrderHistoryItemWidget({Key? key, this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(OrderDetailsScreen(orderModel: orderModel)),
      child: Padding(padding:  EdgeInsets.only(left: Dimensions.paddingSizeSmall, bottom : Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
        child: Container(padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(color: Theme.of(context).cardColor,
            boxShadow: [BoxShadow(color: Theme.of(context).primaryColor.withOpacity(.125),
                spreadRadius: .7, blurRadius: 2, offset: const Offset(0, 1))],
            borderRadius: BorderRadius.circular(10)),


          child: Stack(children: [

              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(padding:  EdgeInsets.only(left: 7,top: Dimensions.paddingSizeSmall),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                        Expanded(child: Text('${'order'.tr} #${orderModel!.id}',
                              style: AlmaraiMedium.copyWith(fontSize: Dimensions.fontSizeLarge,
                                  color: Theme.of(context).colorScheme.secondary)),),
                        CallAndChatWidget(orderModel: orderModel),
                      ])),


                Padding(padding:  EdgeInsets.fromLTRB( Dimensions.paddingSizeDefault,
                    Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, 0),
                  child: CustomerInfoWidget(orderModel: orderModel, showCustomerImage: true),),

                Padding(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                  child: Column(children: [
                    Row(children: [

                      SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                          color: Theme.of(context).primaryColor.withOpacity(.5))),
                      SizedBox(width: Dimensions.paddingSizeSmall),

                      Text('${'assigned'.tr} : ',style: AlmaraiRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                      Text(DateConverter.isoStringToLocalDateOnly(orderModel!.createdAt!), style: AlmaraiRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                    ],
                    ),
                    orderModel!.expectedDate != null?
                    Padding(padding:  EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall),
                      child: Row(children: [
                        SizedBox(width: Dimensions.iconSizeDefault, child: Image.asset(Images.calenderIcon,
                            color: Theme.of(context).primaryColor.withOpacity(.5))),
                        SizedBox(width: Dimensions.paddingSizeSmall),
                        Text('${'expected_date'.tr} : ',
                          style: AlmaraiRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall),),
                        Text(orderModel!.expectedDate!, style: AlmaraiRegular.copyWith(fontSize: Dimensions.fontSizeSmall),),
                      ],
                      ),
                    ): const SizedBox(),
                    SizedBox(height: Dimensions.paddingSizeSmall,),


                  ]),
                ),


              ]),
            ],
          ),
        ),
      ),
    );
  }
}
