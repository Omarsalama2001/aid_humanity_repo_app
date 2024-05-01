import 'package:aid_repository/bloc/app_bloc.dart';
import 'package:aid_repository/entities/item_entity.dart';
import 'package:aid_repository/pages/scan_qr_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestItemsPage extends StatelessWidget {
  RequestItemsPage({super.key});
  List<String> container1 = ["Accessory Gift Sets", "Bangles", "Beauty Accessories", "Belts", "Bracelets", "Caps", "Clutches", "Cufflinks", "Cushion Covers", "Earrings", "Fragrance Gift Sets", "Free Gifts", "Gloves", "Hair Accessories", "Hats", "Headbands", "Jewellery Sets", "Keychains", "Mufflers", "Necklaces and Chains", "Pendants", "Rings", "Scarves", "Shoe Accessories", "Shoe Laces", "Socks", "Stoles", "Sunglasses", "Travel Accessories", "Wallets", "Watches", "Wristbands"];

  String c1 = "C1-Accessories and related to it";

  List<String> container2 = ["Baby Dolls", "Bath Robes", "Booties", "Bras", "Briefs", "Camisoles", "Capris", "Clothing Sets", "Shapewear", "Stockings", "Tights", "Tops"];

  String c2 = "C2-Girls InnerWear";

  List<String> container3 = ["Churidars", "Dresses", "Dupattas", "Heels", "Jeggings", "Jumpsuits", "Kurta Sets", "Kurtis", "Leggings", "Lehenga Cholis", "Nightdresses", "Patialas", "Rompers", "Salwars", "Salwars and Dupattas", "Sarees", "Shrugs", "Skirts", "Tunics"];

  String c3 = "C3-Women's Outerwear";

  List<String> container4 = [
    "Body Lotions",
    "Body Washes and Scrubs",
    "Compacts",
    "Concealers",
    "Deodorants",
    "Eye Creams",
    "Eyeshadows",
    "Face Moisturisers",
    "Face Scrubs and Exfoliators",
    "Face Serums and Gels",
    "Face Washes and Cleansers",
    "Hair Colours",
    "Highlighters and Blushes",
    "Kajals and Eyeliners",
    "Lip Cares",
    "Lip Glosses",
    "Lip Liners",
    "Lip Plumpers",
    "Lipsticks",
    "Makeup Removers",
    "Mascaras",
    "Masks and Peels",
    "Men's Grooming Kits",
    "Nail Essentials",
    "Nail Polishes",
    "Perfume and Body Mists",
    "Sunscreens",
    "Toners"
  ];

  String c4 = "C4-Personal care products";

  List<String> container5 = ["Boxers", "Innerwear Vests", "Nehru Jackets", "Night Suits", "Suspenders", "Ties", "Ties and Cufflinks"];

  String c5 = "C5-Men clothes";

  List<String> container6 = ["Handbags", "Backpacks", "Duffel Bags", "Laptop Bags", "Mobile Pouches", "Rucksacks", "Tablet Sleeves", "Trolley Bags", "Trunks", "Waist Pouches"];

  String c6 = "C6-Bags";

  List<String> container7 = ["Casual Shoes", "Formal Shoes", "Flats", "Flip Flops", "Sandals", "Sports Sandals", "Sports Shoes"];

  String c7 = "C7-shoes";

  List<String> container8 = ["Jackets", "Jeans", "Kurtas", "Lounge Pants", "Lounge Shorts", "Lounge T-shirts", "Rain Jackets", "Rain Trousers", "Robes", "Shorts", "Shirts", "Sweaters", "Sweatshirts", "Swimwear", "Track Pants", "Track Pants", "Trousers", "T-shirts", "Waistcoats", "Tracksuits"];

  String c8 = "C5-Men clothes or C3-Women's Outerwear";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ScanRequestPage()),
              );
            },
            icon: const Icon(Icons.qr_code_scanner_sharp),
          )
        ],
        title: const Text('shipment Items'),
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetRequestloadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetRequestSuccessState) {
            if (state.requestItems.isEmpty) {
              return const Center(child: Text("not Found"));
            }
            return ListView.builder(itemBuilder: (_, index) => _itemWidget(state.requestItems[index]), itemCount: state.requestItems.length);
          }
          return const Center(child: Text("not Found"));
        },
      ),
    );
  }

  _itemWidget(ItemEntity item) => Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ]),
        child: Row(children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CachedNetworkImage(
              imageUrl: item.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(value: progress.progress)),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Category : ${item.category}'),
              Text('Gender : ${item.gender}'),
              Text('Quantity : ${item.quantity}'),
              Text('Type : ${item.type}'),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Container',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _checkContainer(item.type.trimLeft()),
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          )
        ]),
      );
  String _checkContainer(String type) {
    if (container1.contains(type)) {
      return c1;
    }
    if (container2.contains(type)) {
      return c2;
    }
    if (container3.contains(type)) {
      return c3;
    }
    if (container4.contains(type)) {
      return c4;
    }
    if (container5.contains(type)) {
      return c5;
    }
    if (container6.contains(type)) {
      return c6;
    }
    if (container7.contains(type)) {
      return c7;
    }
    if (container8.contains(type)) {
      return c8;
    } else {
      return "random";
    }
  }
}
