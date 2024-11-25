import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/controller/profile_controller.dart';
import 'package:sixvalley_delivery_boy/controller/splash_controller.dart';
import 'package:sixvalley_delivery_boy/controller/wallet_controller.dart';
import 'package:sixvalley_delivery_boy/helper/price_converter.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/images.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_button.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_home_app_bar.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_snackbar.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_text_field.dart';
import 'package:sixvalley_delivery_boy/view/screens/wallet/widget/bank_info_view.dart';

class BalanceWithdrawScreen extends StatefulWidget {
  const BalanceWithdrawScreen({Key? key}) : super(key: key);

  @override
  State<BalanceWithdrawScreen> createState() => _BalanceWithdrawScreenState();
}

class _BalanceWithdrawScreenState extends State<BalanceWithdrawScreen> {


  final List<int> _suggestedAmount = [1000,2000,3000,4000,5000];
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomRiderAppBar(title: 'withdraw',isBack: true),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: SingleChildScrollView(
          child: GetBuilder<ProfileController>(
            builder: (profileController) {
              return Column(children: [
                Padding(
                  padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        SizedBox(width: 30,child: Image.asset(Images.riderWallet,color: Theme.of(context).primaryColor,)),
                         SizedBox(width: Dimensions.paddingSizeSmall),

                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                          child: Text('total_withdrawable_balance'.tr,
                              style: AlmaraiMedium.copyWith(color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5) : Theme.of(context).primaryColor,fontSize: Dimensions.fontSizeDefault)),
                        ),
                      ],),
                      Text(PriceConverter.convertPrice(profileController.profileModel!.withdrawableBalance),
                          style: AlmaraiBold.copyWith(color: Get.isDarkMode? Colors.white :
                          Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeLarge))
                    ],
                  ),
                ),

                InkWell(
                  onTap: ()=>Get.to(const BankInfoView()),
                  child: GetBuilder<ProfileController>(
                    builder: (profileController) {

                      String? accountNumber = profileController.profileModel!.accountNo;
                      String firstPart = '';
                      String lastPart = '';
                      if(accountNumber != null){
                        if(accountNumber.length > 5){
                          firstPart = accountNumber.substring(0, 5);
                          lastPart = accountNumber.substring(accountNumber.length-3, accountNumber.length-1);
                        }else{
                          firstPart = accountNumber;
                        }

                      }
                      String acNumber = accountNumber != null? firstPart+'****************'+lastPart : '04582*****65';



                      return Container(
                          decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                        boxShadow: [BoxShadow(color: Get.isDarkMode ? Colors.grey[900]! :Colors.grey[300]!, blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))],
                      ),
                          padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                          child: Row(children: [
                            SizedBox(width: 30,child: Image.asset(Images.bank)),
                             SizedBox(width: Dimensions.paddingSizeDefault,),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                Text(profileController.profileModel!.bankName?? 'add_a_bank_account'.tr),
                                Text('AC $acNumber',style: AlmaraiRegular.copyWith(color: Theme.of(context).hintColor),),
                              ],),
                            ),
                             Padding(
                              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                              child: const Icon(Icons.edit),
                        )
                      ],));
                    }
                  ),
                ),

                 SizedBox(height: Dimensions.paddingSizeDefault),


                Container(width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                  boxShadow: [BoxShadow(color: Get.isDarkMode ? Colors.grey[900]! :Colors.grey[300]!, blurRadius: 5, spreadRadius: 1, offset: const Offset(0,2))],
                ),
                    padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: Text('withdraw_amount'.tr, style: AlmaraiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                      ),
                     Padding(
                       padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                       child: SizedBox(width: 200, child: Stack(
                         children: [


                           CustomTextField(hintText: 'enter_amount'.tr,
                             inputType: TextInputType.phone,
                             inputAction: TextInputAction.done,
                             controller: amountController,

                           ),
                           Container(
                             transform: Matrix4.translationValues(30.0, 12.0, 0.0),
                             child: Text(Get.find<SplashController>().myCurrency!.symbol!,
                                 style: AlmaraiMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge,
                                     color: Theme.of(context).primaryColor)),
                           ),
                         ],
                       )),
                     ),
                      Divider(color: Theme.of(context).primaryColor.withOpacity(.25)),




                      SizedBox(height: 60,
                        child: ListView.builder(itemCount: _suggestedAmount.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (amountContext, index){
                          return InkWell(
                            onTap: (){
                              amountController.text = _suggestedAmount[index].toString();
                            },
                            child: Padding(
                              padding:  EdgeInsets.all(Dimensions.paddingSizeSmall),
                              child: Container(padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5): Theme.of(context).primaryColor.withOpacity(.75))),
                                child: Center(child: Text(_suggestedAmount[index].toString(),
                                  style: AlmaraiRegular.copyWith(color:Get.isDarkMode? Theme.of(context).hintColor.withOpacity(.5): Theme.of(context).primaryColor),)),),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: Text('remark'.tr, style: AlmaraiBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge),),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
                        child: SizedBox(width: 200, child: Row(
                          children: [
                            Expanded(child: CustomTextField(hintText: 'remark_text'.tr,
                            controller: noteController)),
                          ],
                        )),
                      ),
                      Divider(color: Theme.of(context).primaryColor.withOpacity(.25)),
                    ],),),
              ]);
            }
          ),
        ),
      ),

      bottomNavigationBar: MediaQuery.of(context).viewInsets.bottom == 0?
      GetBuilder<WalletController>(
        builder: (walletController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor
            ),
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeDefault),
            height: 80,
            child: !walletController.isWithdraw?
            CustomButton(onTap: (){
              String withdrawAmount =  amountController.text.trim();
              String withdrawNote = noteController.text.trim();
              if(withdrawAmount.isEmpty){
                showCustomSnackBar('amount_is_required'.tr);
              }else if(double.parse(withdrawAmount) <= 0){
                showCustomSnackBar('amount_is_greater_than_0'.tr);
              }else{
                walletController.sendWithdrawRequest(withdrawAmount, withdrawNote).then((value) {
                  if(value.statusCode == 200){
                    amountController.text = '';
                    noteController.text = '';
                  }
                });
              }

              }, btnTxt: 'send_withdraw_request'.tr):
            Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 40,height: 40,
                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
              ],
            ),
          );
        }
      ):const SizedBox(),
    );
  }
}
