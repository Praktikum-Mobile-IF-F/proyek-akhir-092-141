import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/WeaponModel.dart';

class WeaponDetailScreen extends StatefulWidget {
  final WeaponData weaponData;

  const WeaponDetailScreen({super.key, required this.weaponData});
  @override
  State<WeaponDetailScreen> createState() => _WeaponDetailScreenState();
}

class _WeaponDetailScreenState extends State<WeaponDetailScreen> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      appBar: AppBar(
        title: Center(
          child: Text('Weapon Detail', style: TextStyle(color: Colors.white)),
        ), // Centered title
        backgroundColor: Colors.black, // Black AppBar
        iconTheme: IconThemeData(color: Colors.white), // White icons
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              favoriteController.setFavorite('weapon', widget.weaponData.uuid!);
            });
            // Handle back button press
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite,
                color: favoriteController.checkFavorite(
                        'weap', widget.weaponData.uuid!)
                    ? Colors.red
                    : Colors.white),
            onPressed: () {
              // Handle favorite button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            WeaponHeader(
              weaponTitle: widget.weaponData.displayName!, weaponImage: widget.weaponData.displayIcon!,
            ),
            SizedBox(height: 16),
            WeaponStats(
              weaponCategory: widget.weaponData.shopData!.category!,
              weaponMag: widget.weaponData.weaponStats!.magazineSize!.toInt(),
              equipTime: widget.weaponData.weaponStats!.equipTimeSeconds!.toDouble(),
              reloadTime: widget.weaponData.weaponStats!.reloadTimeSeconds!.toInt(),
              price: widget.weaponData.shopData!.cost!.toInt(),
            ),
          ],
        ),
      ),
    );
  }
}

class WeaponHeader extends StatelessWidget {
  final String weaponTitle;
  final String weaponImage;

  const WeaponHeader({super.key, required this.weaponTitle, required this.weaponImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            weaponTitle, //displayname
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Image.network(weaponImage, height: 100), //displayicon
        ),
      ],
    );
  }
}

class WeaponStats extends StatelessWidget {
  final String weaponCategory;
  final int weaponMag;
  final double equipTime;
  final int reloadTime;
  final int price;

  const WeaponStats(
      {super.key,
      required this.weaponCategory,
      required this.weaponMag,
      required this.equipTime,
      required this.reloadTime,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8, // Adjust this factor as needed
      child: Column(
        children: [
          StatRow(label: 'Category', value: weaponCategory), //shopData.category
          StatRow(
              label: 'Magazine / Ammo',
              value: weaponMag.toString()), //weaponstats.magazinesize
          StatRow(
              label: 'Equip Time',
              value: '$equipTime Second'), //weaponstats.equiptimesecond
          StatRow(
              label: 'Reload Time',
              value: '$reloadTime Second'), //weaponstats.ereloadtimesecond
          StatRow(label: 'Price', value: '$price') //shopData.cost
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final String value;

  StatRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.white)),
          Text(value,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }
}

class DamageColumn extends StatelessWidget {
  final String bodyPart;
  final String damage;

  DamageColumn({required this.bodyPart, required this.damage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.person,
            color: Colors.white), // You can use custom icons/images here
        Text(bodyPart, style: TextStyle(color: Colors.white)),
        Text(damage,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }
}