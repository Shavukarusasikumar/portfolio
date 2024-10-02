class Project {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

final List<Project> projects = [
  Project(
    id: 1,
    title: 'Flutter Chat App',
    description: 'A real-time chat application built with Flutter and Firebase.',
    imageUrl: 'assets/images/project1.png',
  ),
  Project(
    id: 2,
    title: 'Task Management App',
    description: 'A productivity app for managing tasks and projects.',
    imageUrl: 'assets/images/project2.png',
  ),
  Project(
    id: 3,
    title: 'E-commerce App',
    description: 'A full-featured e-commerce app with cart and checkout functionality.',
    imageUrl: 'assets/images/project1.png',
  ),
];