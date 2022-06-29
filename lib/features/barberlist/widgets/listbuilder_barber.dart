import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tc_client_app/features/barberlist/widgets/single_card_barber.dart';
import 'package:tc_client_app/models/barber_model.dart';

class ListBuilderBarber extends StatelessWidget {
  final List<BarberModel> data;

  const ListBuilderBarber({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SizedBox(
          width: 1.sw,
          child: ListView.separated(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            separatorBuilder: (context, _) => SizedBox(height: 15.h),
            itemBuilder: (context, index) =>
                SingleCardBarber(item: data[index]),
          ),
        ),
      ),
    );
  }
}
