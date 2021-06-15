import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/splash/splash_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  SplashController get controller => Get.put(SplashController());
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(Icons.amp_stories_rounded),
              Spacer(),
              GestureDetector(
                onTap: controller.navtoLoginPage,
                child: Text(
                  'Bỏ qua',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimens.textBody),
                ),
              ),
            ],
          ).paddingAll(AppDimens.paddingDefault),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (page) {
                controller.currentPage.value = page;
              },
              children: <Widget>[
                ...listGuide.map((element) => _buildPageview(element))
              ],
            ),
          ),
          // _buildContent(
          //     listGuide[controller.pageController.value.page.toInt()]),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.paddingHuge),
        height: 70,
        width: double.infinity,
        child: Row(
          children: [
            Obx(
              () => controller.currentPage.value != 0
                  ? GestureDetector(
                      onTap: () {
                        pageController
                            .jumpToPage(controller.currentPage.value - 1);
                      },
                      child: Container(
                        width: 70,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white70,
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (controller.currentPage.value != 2) {
                    pageController.jumpToPage(controller.currentPage.value + 1);
                  } else {
                    controller.navtoLoginPage();
                  }
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF42A5F5),
                        Color(0xFF0D47A1),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(AppDimens.paddingDefault),
                  child: Row(
                    children: [
                      Expanded(
                          child: Obx(
                        () => Text(
                          controller.currentPage.value != 2
                              ? 'Tiếp tục'
                              : 'Bắt đầu trải nghiệm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppDimens.textBody),
                        ),
                      )),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageview(SplashContentModel model) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(AppStrings.imgLogo)),
          Text(
            model.title,
            style: TextStyle(
                color: AppColors.textBlue,
                fontSize: AppDimens.textHuge,
                fontWeight: FontWeight.bold),
          ).paddingSymmetric(vertical: AppDimens.paddingDefault),
          Text(
            model.content,
            style:
                TextStyle(color: AppColors.grey, fontSize: AppDimens.textBody),
          ).paddingOnly(bottom: AppDimens.paddingHuge),
        ],
      ).paddingAll(AppDimens.paddingDefault);
}

class SplashContentModel {
  String pathImage;
  String title;
  String content;
  SplashContentModel(this.pathImage, this.title, this.content);
}

List<SplashContentModel> listGuide = [
  SplashContentModel(AppStrings.imgSplash1, 'Tiết kiệm hôm nay',
      'Chủ động kiểm soát, điều chỉnh tiêu thụ và tiết kiệm điện năng mọi lúc mọi nơi'),
  SplashContentModel(AppStrings.imgSplash2, 'Tích điểm liền tay',
      'Tham gia thử thách, hoàn thành mục tiêu và tích lũy điểm thưởng Epoint liền tay'),
  SplashContentModel(AppStrings.imgSplash3, 'Đổi ngay ưu đãi',
      'Đổi ngya quà tặng, tận hưởng ưu đãi và chia sẻ với bạn bè, người thân'),
];
