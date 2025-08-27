import 'package:flutter/material.dart';
import 'sessionlist_page.dart';
import 'my_account_page.dart';

class SidebarPage extends StatelessWidget {
  const SidebarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Section
          Stack(
            children: [
              Container(
                color: const Color(0xFFAC9A58),
                padding: const EdgeInsets.only(top: 60, left: 20),
                height: 130,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyAccountPage(),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/user_icon.png',
                          width: 46,
                          height: 46,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 5),
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontFamily: 'TT Commons Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'userlogin@gmail.com',
                            style: TextStyle(
                              fontFamily: 'TT Commons Regular',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Close Button moved to top-right corner
              Positioned(
                top: 2,
                right: 3,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Menu Items
          ListTile(
            leading: const Icon(Icons.schedule, color: Colors.black),
            title: const Text(
              'Session List',
              style: TextStyle(
                fontFamily: 'TT Commons Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Color(0xFFAC9A58)),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SessionListPage(),
                ),
              );
            },
          ),
          const Divider(indent: 16, endIndent: 16, color: Color(0xFFE5E5E5)),

          ListTile(
            leading: const Icon(Icons.confirmation_number, color: Colors.black),
            title: const Text(
              "Today's Reservations",
              style: TextStyle(
                fontFamily: 'TT Commons Regular',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Color(0xFFAC9A58)),
            onTap: () {
              // Handle reservation logic (to do)
            },
          ),

          const Spacer(),

          // Logout button
          Container(
            color: const Color(0xFFAC9A58),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 56,
            child: Row(
              children: [
                const Icon(Icons.logout, color: Colors.white),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Log out',
                    style: TextStyle(
                      fontFamily: 'TT Commons Regular',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
