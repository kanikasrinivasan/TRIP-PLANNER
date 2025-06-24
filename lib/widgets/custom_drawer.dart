import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/place_suggestions_screen.dart';
import '../screens/map_screen.dart';
import '../screens/notes_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/rating_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // 🔷 DrawerHeader with Background Image
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/drawer_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Travel Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    )
                  ],
                ),
              ),
            ),
          ),

          ListTile(
            title: const Text("Trips"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
          ),
          ListTile(
            title: const Text("Place Suggestions"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaceSuggestionsScreen())),
          ),
          ListTile(
            title: const Text("Map"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MapScreen())),
          ),
          ListTile(
            title: const Text("Notes"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotesScreen())),
          ),
          const Divider(),
          ListTile(
            title: const Text("Feedback"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FeedbackScreen())),
          ),
          ListTile(
            title: const Text("Rate This App"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RatingScreen())),
          ),
        ],
      ),
    );
  }
}
