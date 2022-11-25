import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/style_widget.dart';

import '../../data/database/database.dart';
import '../../data/database/local_item_model.dart';

class BoxPage extends StatefulWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  State<BoxPage> createState() => _BoxPageState();
}

class _BoxPageState extends State<BoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEFEFE,
      body: Column(
        children: [
          FutureBuilder<List<Product>>(
            future: LocalDatabase.getList(),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                var data = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 12,
                            bottom: 12,
                            right: 12,
                          ).r,
                          height: 130.h,
                          decoration: BoxDecoration(
                            color: AppColors.C_F5F6FA,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.C_B59DFB.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(4, 8),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 130,
                                child: Image.network(
                                  data[i].image_url,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    child: Center(
                                      child: Text(
                                        data[i].name.substring(0, 20),
                                        style: fontInterW400(
                                                appcolor: AppColors.C_1D1E20)
                                            .copyWith(fontSize: 13.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    '\$ ${data[i].price}',
                                    style: fontInterW400(
                                            appcolor: AppColors.C_9775FA)
                                        .copyWith(fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    width: 218.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            buttonCotrol(
                                                AppIcon.icon_arrow_down),
                                            SizedBox(width: 8.w),
                                            Text(
                                              '99',
                                              style: fontInterW400(
                                                      appcolor:
                                                          AppColors.C_1D1E20)
                                                  .copyWith(fontSize: 13.sp),
                                            ),
                                            SizedBox(width: 8.w),
                                            buttonCotrol(AppIcon.icon_arrpw_up),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: (() async {
                                            await LocalDatabase.deleteTaskById(
                                                data[i].id);
                                            setState(() {});
                                          }),
                                          child:
                                              buttonCotrol(AppIcon.icon_delete),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Snapshot error"),
                );
              } else {
                return const Center(
                  child: Text("ERROR"),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Container buttonCotrol(String iconName) {
    return Container(
      width: 30.w,
      height: 30.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.C_8F959E, width: 1),
      ),
      child: Center(
        child: SvgPicture.asset(
          iconName,
        ),
      ),
    );
  }
}
