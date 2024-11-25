import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/controller/profile_controller.dart';
import 'package:sixvalley_delivery_boy/helper/price_converter.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:sixvalley_delivery_boy/view/screens/wallet/wallet_screen.dart';


class BalanceWithdrawWidget extends StatelessWidget {
  final ProfileController? profileController;
  const BalanceWithdrawWidget({Key? key, this.profileController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(padding:  EdgeInsets.all(Dimensions.paddingSizeLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: Theme.of(context).primaryColor.withOpacity(.05),
      ),child: Row(children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [

            Text(PriceConverter.convertPrice(profileController!.profileModel!.withdrawableBalance),
                style: AlmaraiMedium.copyWith(color: Theme.of(context).primaryColorLight, fontSize: Dimensions.fontSizeExtraLarge)),
             SizedBox(height: Dimensions.paddingSizeDefault),

            Text('withdrawable_balance'.tr,style: AlmaraiRegular.copyWith(color: Theme.of(context).primaryColorLight),),

          ],),
        ),
        InkWell(
          onTap: (){
            Get.to(const WalletScreen());
            // Get.to(const BalanceWithdrawScreen());
          },
          child: Icon(CupertinoIcons.arrow_right, size:Dimensions.iconSizeLarge, color: Theme.of(context).cardColor.withOpacity(.65))
        )
      ],),);
  }
}
