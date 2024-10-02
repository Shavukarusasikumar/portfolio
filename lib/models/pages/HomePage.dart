import 'package:flutter/material.dart';
import 'package:my_portifolio/models/pages/SkillsGridSection.dart';
import 'package:provider/provider.dart';
import 'package:my_portifolio/models/pages/AchievementsSection.dart';
import 'package:my_portifolio/models/pages/ContactSection.dart';
import 'package:my_portifolio/models/pages/ExperienceSection.dart';
import 'package:my_portifolio/models/pages/LandingSection.dart';
import 'package:my_portifolio/models/pages/ProjectsSection.dart';
import 'package:my_portifolio/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 3,
            child: MainContent(),
          ),
          Consumer<NavigationProvider>(
            builder: (context, navProvider, child) {
              return SideNavigation(navProvider: navProvider);
            },
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  MainContentState createState() => MainContentState();
}

class MainContentState extends State<MainContent> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'projects': GlobalKey(),
    'experience': GlobalKey(),
    'skills' : GlobalKey(),
    'achievements': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NavigationProvider>(context, listen: false).setScrollCallback(scrollToSection);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, child) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              LandingSection(key: _sectionKeys['home']),
              ProjectsSection(key: _sectionKeys['projects']),
              ExperienceSection(key: _sectionKeys['experience']),
              SkillsGrid(key:_sectionKeys['skills']),
              AchievementsSection(key: _sectionKeys['achievements']),
              ContactSection(key: _sectionKeys['contact']),
            ],
          ),
        );
      },
    );
  }

  void scrollToSection(String sectionName) {
    final key = _sectionKeys[sectionName];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}

class SideNavigation extends StatelessWidget {
  final NavigationProvider navProvider;

  const SideNavigation({Key? key, required this.navProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          _buildNavItem(Icons.home, 'home'),
          _buildNavItem(Icons.work, 'projects'),
          _buildNavItem(Icons.business_center, 'experience'),
          _buildNavItem(Icons.call_split , 'skills'),
          _buildNavItem(Icons.star, 'achievements'),
          _buildNavItem(Icons.contact_mail, 'contact'),
          const Spacer(),
          ThemeToggle(),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String page) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: navProvider.currentPage == page
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: navProvider.currentPage == page ? Colors.white : Colors.white60),
        onPressed: () => navProvider.setPage(page),
      ),
    );
  }
}