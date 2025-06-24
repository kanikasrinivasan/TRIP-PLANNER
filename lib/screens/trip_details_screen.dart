import 'package:flutter/material.dart';
import 'booking_screen.dart';

class TripDetailsScreen extends StatelessWidget {
  final String destination;

  const TripDetailsScreen({super.key, required this.destination});

  Map<String, String> getDetails(String place) {
    const details = {
      'bali': '''
Bali is the "Island of the Gods," known for its stunning beaches and terraced rice fields.
It offers spiritual serenity through its temples and daily rituals.
Ubud’s artistic charm and jungle retreats attract soul seekers.
The Balinese culture is warm, vibrant, and rooted in ancient traditions.
In Bali, you don’t just visit—you feel, you heal, you awaken.''',

      'paris': '''
Paris, the "City of Love," is famed for its romantic streets and iconic Eiffel Tower.
Stroll along the Seine, explore art in the Louvre, and savor French pastries.
The city seamlessly blends historic elegance with modern fashion and charm.
It’s a destination where every moment feels like a scene from a movie.
Paris is always a good idea.''',

      'tokyo': '''
Tokyo is a dazzling fusion of futuristic innovation and centuries-old tradition.
Explore neon-lit streets, serene temples, and quirky themed cafes.
From cherry blossoms in spring to sumo tournaments, every season has charm.
Its culture, cuisine, and energy captivate visitors from around the world.
Tokyo is not a city, it’s an experience.''',

      'switzerland': '''
Switzerland is a land of snow-capped peaks, crystal-clear lakes, and green meadows.
Ride scenic trains, enjoy Swiss chocolates, and discover alpine villages.
It’s a peaceful escape for nature lovers and adventure seekers alike.
Every corner offers postcard-perfect views and serenity.
Switzerland is a dream in every direction.''',

      'china': '''
China is a vast land rich with ancient heritage and modern marvels.
Visit the Great Wall, Terracotta Warriors, and vibrant cityscapes.
From rural villages to booming metropolises, contrast is everywhere.
Its history spans dynasties and philosophies that shaped the world.
To know China is to journey through time itself.''',

      'japan': '''
Japan blends the charm of old traditions with sleek modern life.
Explore Kyoto’s temples, Tokyo’s tech, and Hokkaido’s snowy slopes.
Experience the grace of tea ceremonies and the thrill of anime culture.
Each season paints Japan in a new palette of beauty.
In Japan, time slows down and beauty speaks.''',

      'india': '''
India is a land of vibrant festivals, colorful markets, and spiritual depth.
From the Taj Mahal to backwaters of Kerala, its diversity amazes.
Experience yoga, spicy cuisine, and timeless traditions in every region.
The culture is rich, complex, and welcoming to all.
India is not a country, it’s an emotion.''',

      'maldives': '''
The Maldives is paradise with turquoise waters, white sands, and coral reefs.
Stay in overwater villas and snorkel among vibrant marine life.
A perfect escape for honeymooners and tranquility seekers alike.
The sunsets and ocean breeze offer peace like nowhere else.
Maldives: where the ocean kisses the sky.''',
    };

    const quotes = {
      'bali': 'The island is not just a place, it’s a feeling of calm, kindness, and quiet joy.',
      'paris': 'In Paris, even silence feels poetic and every step writes a story.',
      'tokyo': 'Tokyo is a rhythm — fast, bright, and endlessly alive, yet deeply rooted in peace.',
      'switzerland': 'In Switzerland, the mountains don’t just rise — they speak in whispers of peace.',
      'china': 'China is where the whispers of dynasties echo through ancient stone.',
      'japan': 'Tradition and technology walk hand-in-hand through the streets of Japan.',
      'india': 'India doesn’t just welcome you — it embraces you in a tapestry of tradition and warmth.',
      'maldives': 'In the Maldives, the sky kisses the sea in a whisper of light.',
    };

    return {
      'quote': quotes[place.toLowerCase()] ?? '',
      'description': details[place.toLowerCase()] ?? 'Explore the beauty and culture of $place.',
    };
  }

  String getImage(String place) {
    return 'assets/images/${place.toLowerCase()}.jpg';
  }

  @override
  Widget build(BuildContext context) {
    final imagePath = getImage(destination);
    final details = getDetails(destination);
    final quote = details['quote']!;
    final description = details['description']!;

    return Scaffold(
      appBar: AppBar(title: Text(destination)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image banner
          SizedBox(
            width: double.infinity,
            height: 220,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Image not found'));
              },
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Explore $destination',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),

          // Quote
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '"$quote"',
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6C63FF), // You can choose another color here
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Description Paragraph
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
                height: 1.5,
              ),
            ),
          ),

          const Spacer(),

          // Book Now Button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(destination: destination),
                    ),
                  );
                },
                child: const Text("Book Now"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
