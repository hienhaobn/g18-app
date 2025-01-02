import 'package:app/base/base_get_view.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:app/ui/account_page/widget_account_page/appbar_account_page.dart';
import 'package:app/ui/account_page/widget_account_page/manager_of_account_page.dart';
import 'package:app/ui/account_page/widget_account_page/shared_of_account_page.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/section_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// tài khoản màn nội bộ

class AccountPage extends BaseGetWidget<AccountPageController> {
  const AccountPage({super.key});

  @override
  AccountPageController get controller => Get.put(AccountPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarAccountPage(
            controller: controller,
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionColumn(
              label: 'Quản lý',
              colorLabel: AppColors.p4C28A5,
              child: ManagerOfAccountPage(
                controller: controller,
              ),
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SectionColumn(
              label: 'Chung',
              colorLabel: AppColors.p4C28A5,
              child: SharedOfAccountPage(
                controller: controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}


