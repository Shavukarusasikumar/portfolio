// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_portifolio/models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  ProjectDetailsPage({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              project.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 8),
                  Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Additional project details and features can be added here.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
