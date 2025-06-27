import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailBook extends StatelessWidget {
  const DetailBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Container(
          width: context.width,
          height: context.height,
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  AppImage.randomImageCover(context),
                  Container(
                    width: context.width,
                    height: context.height, //
                    color: AppColors.greyBackground.withValues(alpha: 0.95),
                  ),
                  Container(
                    width: context.width,
                    height: context.height, //
                    color: Colors.black.withValues(alpha: 0.0125),
                  ),
                  Column(
                    children: [
                      cover(context), summaries(context), //
                    ],
                  ),
                  infocard(context),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: TranslateAnimation(
          offset: (context.height * .1),
          duration: const Duration(seconds: 1),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  margin: const EdgeInsets.only(left: 32, bottom: 32, right: 12),
                  decoration: BoxDecoration(
                    color: AppColors.whiteMain,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyNonActive,
                        blurRadius: 5,
                        offset: Offset(5, 5), //
                      ),
                    ],
                    borderRadius: BorderRadius.circular(64), //
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      color: AppColors.redDanger, //
                      size: 24, //
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  margin: const EdgeInsets.only(right: 12, bottom: 32),
                  decoration: BoxDecoration(
                    color: AppColors.whiteMain,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greyNonActive,
                        blurRadius: 5,
                        offset: Offset(5, 5), //
                      ),
                    ],
                    borderRadius: BorderRadius.circular(64), //
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle_filled_rounded,
                      color: AppColors.greenMain,
                      size: 28, //
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    margin: const EdgeInsets.only(right: 32, bottom: 32),
                    decoration: BoxDecoration(
                      color: AppColors.whiteMain,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyNonActive,
                          blurRadius: 5,
                          offset: Offset(5, 5), //
                        ),
                      ],
                      borderRadius: BorderRadius.circular(64), //
                    ),
                    child: Row(
                      children: [
                        Spacing.horizontal(8),
                        Expanded(
                          child: AppButton.primary(
                            onPressed: () {},
                            title: 'Start Reading!',
                            context: context, //
                          ),
                        ),
                        Spacing.horizontal(8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cover(BuildContext context) {
    return Container(
      width: context.width,
      height: context.width * 1.175,
      padding: EdgeInsets.only(top: context.height * .085),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_rounded), //
          ),
          Column(
            children: [
              SizedBox(
                width: context.width * .7,
                child: Column(
                  children: [
                    Text("One Dark Window", style: context.titleMedium),
                    Spacing.vertical(12),
                    Text("Rachel Gilig", style: context.bodyLarge),
                    Spacing.vertical(16),
                  ],
                ),
              ),
              Container(
                width: context.width * .4,
                height: context.width * .6,
                decoration: BoxDecoration(
                  color: AppColors.whiteMain, //
                  borderRadius: BorderRadius.circular(8), //
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage.network(url: 'url'),
                ),
              ),
            ],
          ),
          SizedBox(width: context.width * .125),
        ],
      ),
    );
  }

  Widget summaries(BuildContext context) {
    return Container(
      width: context.width,
      color: AppColors.whiteMain, //
      padding: EdgeInsets.only(
        top: context.height * .08,
        right: 32,
        left: 32,
        bottom: context.height * .2, //
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Summaries', style: context.titleMedium),
          Spacing.vertical(16),
          Text(
            "Elspeth needs a monster. The monster might be her. Elspeth Spindle needs more than luck to stay safe in the eerie, mist-locked kingdom of Blunder—she needs a monster. She calls him the Nightmare, an ancient, mercurial spirit trapped in her head. He protects her. He keeps her secrets. But nothing comes for free, especially magic. When Elspeth meets a mysterious highwayman on the forest road, her life takes a drastic turn. Thrust into a world of shadow and deception, she joins a dangerous quest to cure Blunder from the dark magic infecting it. And the highwayman? He just so happens to be the King’s nephew, Captain of the most dangerous men in Blunder…and guilty of high treason. Together they must gather twelve Providence Cards—the keys to the cure. But as the stakes heighten and their undeniable attraction intensifies, Elspeth is forced to face her darkest secret yet: the Nightmare is slowly taking over her mind. And she might not be able to stop him.",
            style: context.labelLarge?.copyWith(height: 2),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget infocard(BuildContext context) {
    return Positioned(
      left: 32,
      right: 32,
      top: context.height / 2,
      child: Container(
        width: context.width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.whiteMain,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyNonActive,
              blurRadius: 0.25,
              offset: Offset(0.25, 0.25), //
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          //
        ), //
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            box(
              color: AppColors.greyNonActive.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Icon(Icons.star_rounded, color: AppColors.greenMain, size: 16),
                  Text('4', style: context.labelLarge?.toBlack), //
                ],
              ),
            ),
            box(
              color: AppColors.blueInfo.withValues(alpha: 0.1),
              child: Text('Fantasy', style: context.labelLarge?.toBlack), //
            ),
            box(
              color: AppColors.greenMain.withValues(alpha: 0.1),
              child: Text('999 Pages', style: context.labelLarge?.toBlack), //
            ),
          ],
        ),
      ),
    );
  }

  Widget box({Color? color, required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: child,
    );
  }
}
