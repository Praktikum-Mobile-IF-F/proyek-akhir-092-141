
import 'package:flutter/material.dart';
import 'package:project_prak_tpm/screens/Home/tab/AgentTab.dart';
import 'package:project_prak_tpm/screens/Home/tab/BundleTab.dart';
import 'package:project_prak_tpm/screens/Home/tab/MapTab.dart';
import 'package:project_prak_tpm/screens/Home/tab/WeaponTab.dart';

TextEditingController searchController = TextEditingController();

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  late List<Widget> _widgetSelection;

  @override
  void initState(){
    super.initState();
    _widgetSelection = [
      AgentTab(searchText: searchController.text,),
      MapTab(searchText: searchController.text,),
      WeaponTab(searchText: searchController.text),
      BundleTab(searchText: searchController.text)
    ];

    searchController.addListener(() {
      setState(() {
        _widgetSelection = [
          AgentTab(searchText: searchController.text,),
          MapTab(searchText: searchController.text,),
          WeaponTab(searchText: searchController.text),
          BundleTab(searchText: searchController.text)
        ];
      });
    });
  }

  String searchQuery = '';

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _performSearch() {
    // Implement search logic here
    setState(() {
      searchQuery = searchController.text;
      print("SEARCH INPUT: $searchQuery");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const Expanded(
              child: Text(
                'Valorant App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 200, // Set the width of the search bar
              height: 36, // Set the height of the search bar
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      setState(() {
                      });
                    },
                  ),
                ),
                style: const TextStyle(color: Colors.black, fontSize: 16),
                onSubmitted: (value) {
                  _performSearch();
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _menuTab(),
          const SizedBox(height: 8),
          Expanded(
            child: searchQuery.isEmpty
                ? _widgetSelection[selectedIndex]
                : _searchResults(),
          ),
        ],
      ),
    );
  }

  Widget _menuTab() {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          _tabItem(
            'Agent',
            selectedIndex == 0,
                () => onTabSelected(0),
          ),
          _tabItem(
            'Maps',
            selectedIndex == 1,
                () => onTabSelected(1),
          ),
          _tabItem(
            'Weapons',
            selectedIndex == 2,
                () => onTabSelected(2),
          ),
          _tabItem(
            'Bundles',
            selectedIndex == 3,
                () => onTabSelected(3),
          ),
        ],
      ),
    );
  }

  Widget _tabItem(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [

            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.red : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Container(
                height: 2,
                width: 20,
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }

  Widget _searchResults() {
    return Center(
      child: Text(
        'Search results for "$searchQuery"',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
