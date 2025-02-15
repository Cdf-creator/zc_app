import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_loader.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// GENERATED IMPORTS -- DO NOT SIMPLY EDIT.
import 'forgot_password_email_view.form.dart';
import 'forgot_password_email_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'forgotEmail')])
class ForgotPasswordEmailView extends StatelessWidget
    with $ForgotPasswordEmailView {
  //bool isWrong = false;
  ForgotPasswordEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<ForgotPasswordEmailViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      viewModelBuilder: () => ForgotPasswordEmailViewModel(),
      builder: (context, model, child) => ModalProgressHUD(
        inAsyncCall: model.isLoading,
        color: AppColors.whiteColor,
        progressIndicator: const ZuriLoader(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(ZuriLogo),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Center(
                    child: Text(
                      local!.forgotPassword,
                      style: AppTextStyles.body1Bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Center(
                    child: Text(
                      local.forgotPasswordHeader,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 49.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      local.emailAddress,
                      style: AppTextStyles.body1Bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        child: TextField(
                          controller: forgotEmailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          textInputAction: TextInputAction.done,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.0),
                              ),
                            ),
                            hintText: EmailHintText,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              borderSide: BorderSide(
                                color: AppColors.zuriPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      ////Changes
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Visibility(
                          visible: model.inputError,
                          child: Column(
                            children: [
                              UIHelper.verticalSpaceSmall,
                              Text(
                                local.invalidEmail,
                                style: AppTextStyles.body2Medium.copyWith(
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Changes  ss
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: ElevatedButton(
                        onPressed: () {
                          // model.submitEmail();
                          model.validateEmailIsRegistered();
                        },
                        child: Text(
                          local.continueButton,
                          style: AppTextStyles.buttonText,
                        ),
                        style: ElevatedButton.styleFrom(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          primary: AppColors.zuriPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        model.navigateToSignIn();
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: local.backTo,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextSpan(
                              text: local.signIn,
                              style: AppTextStyles.body2Bold.copyWith(
                                color: AppColors.zuriPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
