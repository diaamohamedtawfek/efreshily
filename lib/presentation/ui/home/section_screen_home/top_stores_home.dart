import 'package:efreshily/presentation/ui/store/list_store_hor.dart';
import 'package:efreshily/presentation/widgets/text_app.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../widgets/go.dart';
import '../../store/storre.dart';

class TopStoresHome extends StatefulWidget {
  const TopStoresHome({Key? key}) : super(key: key);

  @override
  State<TopStoresHome> createState() => _TopStoresHomeState();
}

class _TopStoresHomeState extends State<TopStoresHome> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child:  Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: S
                    .of(context)
                    .top_stores,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 20.0,
                textAlign: TextAlign.start,
              ),

              const SizedBox(width: 3,),

              InkWell(
                onTap: (){
                  Go.to(context: context, page: const Store());
                },
                child: TextApp(
                  text: S
                      .of(context)
                      .seeMore,
                  color: const Color(0xfff7941d),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16,),

          SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child:const ListStoreHor()
          ),
        ],
      ),
    );
  }
}
