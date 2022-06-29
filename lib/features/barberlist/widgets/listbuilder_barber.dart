import 'package:flutter/material.dart';
import 'package:tc_client_app/constants/utils.dart';
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
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SizedBox(
          width: screenWidth(context),
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            separatorBuilder: (context, _) => const SizedBox(height: 15),
            itemBuilder: (context, index) =>
                SingleCardBarber(item: data[index]),
          ),
        ),
      ),
    );
  }
}
