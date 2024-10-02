import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperienceSection extends StatelessWidget {
  final List<WorkExperience> experiences = [
    WorkExperience(
      company: 'Mobile Solutions Ltd.',
      position: 'Flutter Developer',
      duration: '2018 - 2020',
      description: 'Developed and maintained multiple Flutter applications for various clients.',
      icon: Icons.phone_android,
    ),
    // Add more work experiences as needed
  ];

   ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 30),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.1,
                isFirst: index == 0,
                isLast: index == experiences.length - 1,
                indicatorStyle: IndicatorStyle(
                  width: 40,
                  height: 40,
                  indicator: _buildIndicator(experiences[index].icon),
                  drawGap: true,
                ),
                endChild: _buildExperienceCard(context, experiences[index]),
                beforeLineStyle: LineStyle(
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }

  Widget _buildExperienceCard(BuildContext context, WorkExperience experience) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 20, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.position,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              experience.company,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              experience.duration,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: 8),
            Text(experience.description),
          ],
        ),
      ),
    );
  }
}

class WorkExperience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final IconData icon;

  WorkExperience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required this.icon,
  });
}