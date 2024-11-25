import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sixvalley_delivery_boy/data/model/body/transaction_type_model.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';

class TransactionCardWidget extends StatelessWidget {
  final TransactionTypeModel? transactionTypeModel;
  final int? selectedIndex;

  const TransactionCardWidget({Key? key, this.selectedIndex, this.transactionTypeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 150,width:150, padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
    decoration: BoxDecoration(
      color: transactionTypeModel!.index == selectedIndex? Get.isDarkMode? Theme.of(context).hintColor : Theme.of(context).primaryColor:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.35) : Theme.of(context).colorScheme.secondaryContainer,
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)
    ),
    child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 30,child: Image.asset(transactionTypeModel!.icon,
              color: transactionTypeModel!.index == selectedIndex? Theme.of(context).cardColor : Theme.of(context).primaryColor)),
           SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(NumberFormat.compact().format(transactionTypeModel!.amount),
              style: AlmaraiMedium.copyWith(color: transactionTypeModel!.index == selectedIndex? Theme.of(context).cardColor : Theme.of(context).primaryColor,
              fontSize: Dimensions.fontSizeLarge)),
           SizedBox(height: Dimensions.paddingSizeExtraSmall),
          Text(transactionTypeModel!.title.tr,textAlign: TextAlign.center, maxLines: 2,
              style: AlmaraiRegular.copyWith(color: transactionTypeModel!.index == selectedIndex?
          Theme.of(context).cardColor : Theme.of(context).primaryColor)),

        ],
      ),
    ),);
  }
}
