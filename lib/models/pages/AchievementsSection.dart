import 'package:flutter/material.dart';

class AchievementsSection extends StatelessWidget {
  final List<Achievement> achievements = [
    Achievement(
      title: 'Best Mobile App Award',
      description: 'Received the Best Mobile App Award for the innovative design and functionality of FlutterChat app.',
      year: '2022',
      icon: Icons.emoji_events,
    ),
    Achievement(
      title: 'Flutter Certification',
      description: 'Obtained advanced Flutter certification from Google.',
      year: '2021',
      icon: Icons.school,
    ),
    // Add more achievements as needed
  ];

   AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Achievements',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              return _buildAchievementCard(context, achievements[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(BuildContext context, Achievement achievement) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                Text(
                  achievement.year,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Text(
                    achievement.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(
              achievement.icon,
              size: 32,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class Achievement {
  final String title;
  final String description;
  final String year;
  final IconData icon;

  Achievement({
    required this.title,
    required this.description,
    required this.year,
    required this.icon,
  });
}