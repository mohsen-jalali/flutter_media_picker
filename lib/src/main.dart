import 'package:flutter/material.dart';
import 'package:media_picker/src/widgets/media_picker_bottom_sheet.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class MediaPicker {
  static Future<String?> showMediaPickerModal(
      BuildContext context, {
        final Color? backgroundColor,
        final double? mediaWidgetWidth,
        final double? mediaHorizontalSpacing,
        final double? mediaVerticalSpacing,
        final BorderRadius? mediaBorderRadius,
        final BoxShape? mediaBoxShape,
        final List<BoxShadow>? mediaBoxShadow,
        final BoxFit? mediaFit,
        final Border? mediaBorder,
        final Color? mediaBackgroundColor,
        final Color? mediaSkeletonBaseColor,
        final Color? mediaSkeletonShimmerColor,
        final Color? dropDownSelectedItemBackgroundColor,
        final Color? dropDownBackgroundColor,
        final Color? headersIconsColor,
        final Color? headersIconsBorderColor,
        final TextStyle? dropDownButtonTextStyle,
        final TextStyle? dropDownItemsTextStyle,
        final Widget? mediaLoadingWidget,
      }) async {
    final PermissionState ps = await PhotoManager.requestPermissionExtend(requestOption: const PermissionRequestOption(iosAccessLevel: IosAccessLevel.addOnly));
    if (ps.hasAccess) {
      return await showFlexibleBottomSheet(
        context: context,
        minHeight: 0,
        initHeight: 0.45,
        maxHeight: 1,
        useRootNavigator: true,
        isSafeArea: true,
        bottomSheetColor: backgroundColor ?? Colors.white,
        builder: (context, scrollController, offset) => MediaPickerBottomSheet(
          scrollController: scrollController,
          backgroundColor: backgroundColor,
          mediaWidgetWidth: mediaWidgetWidth,
          headersIconsColor: headersIconsColor,
          headersIconsBorderColor: headersIconsBorderColor,
          mediaVerticalSpacing: mediaVerticalSpacing,
          mediaHorizontalSpacing: mediaHorizontalSpacing,
          mediaSkeletonShimmerColor: mediaSkeletonShimmerColor,
          mediaSkeletonBaseColor: mediaSkeletonBaseColor,
          mediaFit: mediaFit,
          mediaBorder: mediaBorder,
          mediaBackgroundColor: mediaBackgroundColor,
          mediaBorderRadius: mediaBorderRadius,
          mediaBoxShadow: mediaBoxShadow,
          mediaBoxShape: mediaBoxShape,
          mediaLoadingWidget: mediaLoadingWidget,
          dropDownSelectedItemBackgroundColor: dropDownSelectedItemBackgroundColor,
          dropDownBackgroundColor: dropDownBackgroundColor,
          dropDownButtonTextStyle: dropDownButtonTextStyle,
          dropDownItemsTextStyle: dropDownItemsTextStyle,
        ),
      );
    } else {}

    return null;
  }
}
