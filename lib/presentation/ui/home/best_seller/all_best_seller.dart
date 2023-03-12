import 'package:efreshily/core/resources/colors_app.dart';
import 'package:efreshily/generated/l10n.dart';
import 'package:efreshily/presentation/ui/list_all_offer.dart';
import 'package:efreshily/presentation/widgets/app_bar_all.dart';
import 'package:flutter/material.dart';

class AllBestSeller extends StatefulWidget {
  const AllBestSeller({Key? key}) : super(key: key);

  @override
  State<AllBestSeller> createState() => _AllBestSellerState();
}

class _AllBestSellerState extends State<AllBestSeller> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(_scrollListener);
  }
  void _scrollListener() {
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBarAll(nameAppBar: S
            .of(context)
            .best_seller, showBack: true),
        body: const SafeArea(
          child: ListAllOffers(scrollPhysics: ScrollPhysics(),topSpace: 22),
        )
    );
  }

}


