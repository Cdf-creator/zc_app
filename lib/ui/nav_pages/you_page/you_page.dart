import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'widgets/profile_page_head.dart';
import 'widgets/status_form.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<YouPageViewModel>.reactive(
      viewModelBuilder: () => YouPageViewModel(),
      onModelReady: (model) => model.getUserPresence(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          orgTitle: Text(You, style: ZuriTextStyle.organizationNameText()),
          bottomNavBarScreen: true,
          leadingWidth: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => model.getUserPresence(),
                  child: ProfilePageHead(
                    isActive: model.currentStatus == 'Active',
                    name: model.username,
                    currentStatus: model.currentStatus,
                    image: model.profileImage,
                  ),
                ),
                const SizedBox(height: 30),
                StatusForm(onPressed: model.setStatus),
                const SizedBox(height: 20),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    PauseNotification,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local!.pauseNotifications,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.pauseNotifications,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  topBorder: false,
                  text: Text.rich(
                    TextSpan(
                      text: local.setStatusText,
                      style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text: model.otherStatus,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  icon: SvgPicture.asset(
                    away,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  onPressed: model.toggleStatus,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    Saved_Items,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.savedItems,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewSavedItem,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    View_Profile,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.viewProfile,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: () => model.getUserPresence(),
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    notification,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.notifications,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    preference,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.preferences,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewPreferences,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    Log_Out,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.signOut,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.signOutAccount,
                  topBorder: false,
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
