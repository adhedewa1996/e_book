import 'package:avatar_glow/avatar_glow.dart';
import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shadow_box.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/domain/entities/story.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

class Comment {
  static Widget reviews({
    required List<Review> reviews, //
    required BuildContext context,
    bool showBottomMargin = true,
    required double width,
  }) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(bottom: showBottomMargin ? 32 : 0),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          for (Review review in reviews)
            Container(
              width: width,
              margin: EdgeInsets.only(
                bottom: showBottomMargin ? 16 : 8,
                right: 8, //
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteMain,
                boxShadow: ShadowBox.normal(),
                borderRadius: BorderRadius.circular(8), //
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: AppImage.assets(
                      name: AppImages.userProfile, //
                      width: 16,
                      height: 16,
                    ),
                  ),
                  Spacing.vertical(8),
                  Text(review.name, style: context.labelSmall?.toBold), //
                  Spacing.vertical(8),
                  Text(review.comment, style: context.labelSmall?.copyWith(fontStyle: FontStyle.italic)),
                  Spacing.vertical(8),
                  Book.iconstar(stars: review.star), //
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CommentToolTip extends StatefulWidget {
  const CommentToolTip({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  State<CommentToolTip> createState() => _CommentToolTipState();
}

class _CommentToolTipState extends State<CommentToolTip> {
  final _controller = SuperTooltipController();

  void makeTooltip() {
    _controller.showTooltip();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          makeTooltip();
        },
        child: SuperTooltip(
          showBarrier: true,
          controller: _controller,
          popupDirection: TooltipDirection.left,
          showDropBoxFilter: true,
          sigmaX: 10,
          sigmaY: 10,
          touchThroughAreaShape: ClipAreaShape.rectangle,
          touchThroughAreaCornerRadius: 32,
          barrierColor: AppColors.whiteMain.withValues(alpha: 0.25),
          shadowOffset: Offset(5, 5),
          borderColor: AppColors.whiteMain,
          shadowColor: AppColors.darkMain.withValues(alpha: 0.25),
          content: Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Comment.reviews(
              reviews: widget.reviews,
              context: context, //
              showBottomMargin: false,
              width: Get.width * .8,
            ),
          ),
          child: AvatarGlow(
            startDelay: const Duration(milliseconds: 1000),
            glowColor: AppColors.greenMain,
            glowShape: BoxShape.rectangle,
            curve: Curves.fastOutSlowIn,
            glowBorderRadius: BorderRadius.circular(8),
            glowRadiusFactor: .5,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.greenMain,
                borderRadius: BorderRadius.circular(8), //
              ),
              child: Center(
                child: Text(
                  '${widget.reviews.length}',
                  style: context.labelMedium?.toWhite, //
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
