import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key, required this.channelName}) : super(key: key);
  final ChannelInfoViewModel model;
  final String channelName;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#$channelName",
                    style: AppTextStyles.body1Bold,
                  ),
                  UIHelper.verticalSpaceSmall,
                  UIHelper.verticalSpaceMedium,
                  Text(
                    Description,
                    style: AppTextStyles.body1Bold,
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    '${model.channelDescription}',
                    style: AppTextStyles.body1Light.copyWith(letterSpacing: 0.005),
                  ),
                  UIHelper.verticalSpaceExtraSmall,
                  Text(
                    MarkCreatedChannel,
                    style: AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005),
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    Topic,
                    style: AppTextStyles.headerStyle1.copyWith(fontSize: 16.sp),
                  ),
                  UIHelper.verticalSpaceSmall,
                  Text(
                    CreatingZuri,
                    style: AppTextStyles.body1Light.copyWith(fontSize: 16.sp),
                  ),
                  UIHelper.verticalSpaceSmall,
                  UIHelper.verticalSpaceMedium,
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: AppColors.borderColor,
            ),
            UIHelper.verticalSpaceMedium,
            Center(
              child: InkWell(
                onTap: () {
                  model.navigateToEditChannel();
                },
                child: Text(
                  Edit,
                  style: AppTextStyles.bodyBig..copyWith(fontSize: 16.sp),
                ),
              ),
            ),
            UIHelper.verticalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
