import 'package:cached_network_image/cached_network_image.dart';
import 'package:efreshily/presentation/ui/store/products_store.dart';
import 'package:efreshily/presentation/widgets/go.dart';
import 'package:flutter/material.dart';

class ListStore extends StatefulWidget {
  const ListStore({Key? key}) : super(key: key);

  @override
  State<ListStore> createState() => _ListStoreState();
}

class _ListStoreState extends State<ListStore> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom+20),
        itemCount: 10,
        itemBuilder: (context,index){
          return InkWell(
            onTap: () {
              Go.to(context: context, page: const ProductsStore(nameStore: "Ikea",));
            },
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)
                    ),
                    boxShadow: [BoxShadow(
                        color: Color(0x0d898989),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                        spreadRadius: 0
                    )
                    ],
                    color: Color(0xfff9f9f9)
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: CachedNetworkImage(
                    height: 165,
                    fit: BoxFit.fill,
                    imageUrl: "https://www.loginbrands.com/images/Article/101553-Versace-Furniture-Brand-1.jpg",
                    // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7iURWVLdWCBhhA9Grj499C6WE5zjyHkE-Xw&usqp=CAU",
                    placeholder: (context,
                        url) =>
                    const Center(child:
                    CircularProgressIndicator()
                      ,),
                    errorWidget: (context,
                        url, error) =>
                        Center(
                          child: Image
                              .asset(
                            "assets/images/logo.png",
                            height: 85,
                            width: 85,
                            fit: BoxFit
                                .fill,
                          ),
                        ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
