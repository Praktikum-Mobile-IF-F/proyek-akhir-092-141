import 'package:flutter/material.dart';
import 'package:project_prak_tpm/controller/FavoriteController.dart';
import 'package:project_prak_tpm/model/WeaponModel.dart';
import 'package:project_prak_tpm/screens/WeaponDetail/WeaponDetailScreen.dart';

class WeaponCard extends StatefulWidget {
  final WeaponData weaponData;

  const WeaponCard({super.key, required this.weaponData});

  @override
  _WeaponCardState createState() => _WeaponCardState();
}

class _WeaponCardState extends State<WeaponCard> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WeaponDetailScreen(weaponData: widget.weaponData)));
      },
      child: Card(
        color: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 140, // Memperbesar area gambar
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(widget.weaponData.displayIcon!),
                      fit: BoxFit.fitWidth
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.weaponData.displayName!,
                    style: const TextStyle(
                      fontSize: 18, // Mengurangi ukuran font
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    favoriteController.setFavorite('weapon', widget.weaponData.uuid!);
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    favoriteController.checkFavorite('weapon', widget.weaponData.uuid!) ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}