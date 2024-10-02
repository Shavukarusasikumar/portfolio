import 'package:flutter/material.dart';

class SkillsGrid extends StatelessWidget {
  final List<Skill> skills = [
    Skill('Flutter', 'assets/icons8-flutter-50.png', Colors.blue),
    Skill('Dart', 'assets/icons8-dart-50.png', Colors.blue[700]!),
    // Skill('Python', 'assets/python_icon.png', Colors.yellow[700]!),
    Skill('Firebase', 'assets/icons8-firebase-50.png', Colors.amber),
    Skill('Figma', 'assets/icons8-figma-50.png', Colors.purple),
    Skill('Git', 'assets/icons8-github-50.png', Colors.orange),
  ];

  SkillsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth > 600 ? 4 : 3;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return SkillItem(skill: skills[index]);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class SkillItem extends StatelessWidget {
  final Skill skill;

  const SkillItem({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            skill.iconPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 8),
          Text(
            skill.name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Skill {
  final String name;
  final String iconPath;
  final Color color;

  Skill(this.name, this.iconPath, this.color);
}
