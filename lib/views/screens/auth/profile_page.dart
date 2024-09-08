import 'package:flutter/material.dart';
import 'package:zubi/views/screens/auth/profile_page_setting.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.purple,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Bessie Cooper",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "#Dance lover #food lovers",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem("456", "Follower"),
                      _buildStatItem("78", "Following"),
                      _buildStatItem("75", "Posts"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePageSetting()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
            TabBarSection(),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 8.0,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(icon: const Icon(Icons.home), onPressed: () {}),
      //       IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      //       const SizedBox(
      //           width: 48), // The dummy child for the floating action button
      //       IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
      //       IconButton(icon: const Icon(Icons.person), onPressed: () {}),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

class TabBarSection extends StatefulWidget {
  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.purple,
          tabs: [
            const Tab(text: "Video"),
            const Tab(text: "Savelist"),
          ],
        ),
        Container(
          height: 500, // Adjust height based on your content
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildGridView(),
              _buildGridView(), // Same grid for demonstration, change as needed
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: 9, // Adjust based on your content
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/profile_images/img_3.png',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
