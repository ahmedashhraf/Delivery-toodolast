import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixvalley_delivery_boy/controller/profile_controller.dart';
import 'package:sixvalley_delivery_boy/utill/images.dart';
import 'package:sixvalley_delivery_boy/utill/dimensions.dart';
import 'package:sixvalley_delivery_boy/utill/styles.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_button.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_home_app_bar.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_snackbar.dart';
import 'package:sixvalley_delivery_boy/view/base/custom_text_field.dart';

class BankInfoEditScreen extends StatefulWidget {
  const BankInfoEditScreen({Key? key}) : super(key: key);

  @override
  State<BankInfoEditScreen> createState() => _BankInfoEditScreenState();
}

class _BankInfoEditScreenState extends State<BankInfoEditScreen> {

  final FocusNode _accountNameFocus = FocusNode();
  final FocusNode _bankNameFocus = FocusNode();
  final FocusNode _branchNameFocus = FocusNode();
  final FocusNode _accountNumberFocus = FocusNode();


  final TextEditingController _accountNameController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();



  @override
  void initState() {
    _accountNameController.text = Get.find<ProfileController>().profileModel!.holderName??'';
    _bankNameController.text = Get.find<ProfileController>().profileModel!.bankName??'';
    _branchNameController.text = Get.find<ProfileController>().profileModel!.branch??'';
    _accountNumberController.text = Get.find<ProfileController>().profileModel!.accountNo??'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomRiderAppBar(title: 'bank_info'.tr,isBack: true,),
      body: Padding(
        padding:  EdgeInsets.all(Dimensions.paddingSizeDefault),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [


            Padding(
              padding:  EdgeInsets.only(bottom: Dimensions.paddingSizeDefault),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('account_holder_name'.tr, style: AlmaraiRegular),
                   SizedBox(height: Dimensions.paddingSizeSmall),

                  CustomTextField(
                    isShowBorder: true,
                    inputType: TextInputType.name,
                    focusNode: _accountNameFocus,
                    nextFocus: _bankNameFocus,
                    hintText:  'enter_account_name'.tr,
                    controller: _accountNameController,
                    noBg: true,
                    prefixIconUrl: Images.userIcon,
                    inputAction: TextInputAction.next,
                  ),

                   SizedBox(height: Dimensions.paddingSizeDefault),
                  Text('bank_name'.tr, style: AlmaraiRegular),

                   SizedBox(height: Dimensions.paddingSizeSmall),
                  CustomTextField(
                    isShowBorder: true,
                    inputType: TextInputType.name,
                    focusNode: _bankNameFocus,
                    nextFocus: _branchNameFocus,
                    hintText: 'enter_bank_name'.tr,
                    controller: _bankNameController,
                    noBg: true,
                    prefixIconUrl: Images.bankIcon,
                    inputAction: TextInputAction.next,
                  ),
                   SizedBox(height: Dimensions.paddingSizeDefault),
                  Text('branch_name'.tr, style: AlmaraiRegular),

                   SizedBox(height: Dimensions.paddingSizeSmall),
                  CustomTextField(
                    isShowBorder: true,
                    inputType: TextInputType.name,
                    focusNode: _branchNameFocus,
                    nextFocus: _accountNumberFocus,
                    hintText:  "enter_branch_name".tr,
                    controller: _branchNameController,
                    noBg: true,
                    prefixIconUrl: Images.branchNameIcon,
                    inputAction: TextInputAction.next,
                  ),

                   SizedBox(height: Dimensions.paddingSizeDefault),
                  Text('account_no'.tr, style: AlmaraiRegular),

                   SizedBox(height: Dimensions.paddingSizeSmall),
                  CustomTextField(
                    isShowBorder: true,
                    inputType: TextInputType.text,
                    focusNode: _accountNumberFocus,
                    hintText:  "enter_acc_number".tr,
                    noBg: true,
                    prefixIconUrl: Images.accNumberIcon,
                    controller: _accountNumberController,
                    inputAction: TextInputAction.done,

                  ),
                ],
              ),
            ),



             SizedBox(height: Dimensions.paddingSizeDefault,),
            GetBuilder<ProfileController>(
              builder: (profile) {
                return !profile.isUpdate ? CustomButton(onTap: (){
                  String accountName = _accountNameController.text.trim();
                  String bankName = _bankNameController.text.trim();
                  String branchName = _branchNameController.text.trim();
                  String accountNumber = _accountNumberController.text.trim();
                      if(accountName.isEmpty){
                        showCustomSnackBar('account_name_is_required'.tr);
                      }else if(bankName.isEmpty){
                        showCustomSnackBar('bank_name_is_required'.tr);
                      }else if(branchName.isEmpty){
                        showCustomSnackBar('branch_name_is_required'.tr);
                      }else if(accountNumber.isEmpty){
                        showCustomSnackBar('account_number_is_required'.tr);
                      }else{
                        profile.updateBankInfo(bankName, branchName, accountNumber, accountName);
                      }
                },
                    btnTxt: 'save'.tr)
                    : Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)));
              }
            ),

          ],
        ),
      ),
    );
  }
}
