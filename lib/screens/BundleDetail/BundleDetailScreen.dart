import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/controller/HistoryController.dart';
import 'package:project_prak_tpm/model/BundleModel.dart';
import 'package:project_prak_tpm/utils/color/colorPalette.dart';

class BundleDetailScreen extends StatefulWidget {
  final BundleData bundleData;

  const BundleDetailScreen({super.key, required this.bundleData});
  @override
  State<BundleDetailScreen> createState() => _BundleDetailScreenState();
}

class _BundleDetailScreenState extends State<BundleDetailScreen> {
  FavoriteController favoriteController = FavoriteController();
  HistoryController historyController = HistoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Set background color to black
      appBar: AppBar(
        title: const Center(
          child: Text('Bundle Detail', style: TextStyle(color: Colors.white)),
        ), // Centered title
        backgroundColor: Colors.black, // Black AppBar
        iconTheme: const IconThemeData(color: Colors.white), // White icons
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorPallete.secondaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,
                color: favoriteController.checkFavorite(
                    'bundle', widget.bundleData.id!.toString())
                    ? Colors.red
                    : Colors.white),
            onPressed: () {
              favoriteController.setFavorite('bundle', widget.bundleData.id!.toString());
              setState(() {});
              // Handle favorite button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _bundleHeader(
                bundleTitle: widget.bundleData.name!,
                bundleImage: widget.bundleData.splashImage!,
                bundlePrice: widget.bundleData.price!.toString()
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
  Widget _bundleHeader(
      {required String bundleTitle, required String bundleImage, required String bundlePrice}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            bundleTitle, //displayname
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Image.network(bundleImage, height: 200, fit: BoxFit.cover,), //displayicon
        ),
        _submitButton()
      ],
    );
  }

  Widget _submitButton() {
    return Center(
      child: Container(
        width: 300,
        margin: const EdgeInsets.only(top: 50),
        child: ElevatedButton(
            onPressed: () {
              showAlertDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorPallete.primaryColor,
              foregroundColor: ColorPallete.secondaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                  child: Image.asset('assets/images/valorant_coin.png'),
                ),
                const SizedBox(width: 10,),
                Text(widget.bundleData.price!.toString()),
              ],
            )),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Purchase'),
          content: const Text('Are you sure you want to purchase this bundle?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                historyController.setHistory(widget.bundleData, context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

