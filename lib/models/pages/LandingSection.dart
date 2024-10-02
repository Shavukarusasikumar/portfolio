import 'package:flutter/material.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80, // Full height minus app bar
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            return _buildDesktopLayout(context);
          } else {
            return _buildMobileLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildContent(context),
        ),
        Expanded(
          flex: 2,
          child: _buildProfileSection(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 48),
          _buildProfileSection(context),
          SizedBox(height: 48),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 280,
          height: 280,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/images/profile_picture.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 24),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvailableForHire(),
        SizedBox(height: 24),
        Text(
          "Flutter Developer &\nUI/UX Designer",
          style: TextStyle(
            fontSize: 48,
            height: 1.2,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Crafting beautiful cross-platform experiences",
          style: TextStyle(
            fontSize: 24,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
        SizedBox(height: 24),
        Text(
          "I'm a dynamic and results-driven professional with expertise in Flutter development, UI/UX design, and efficient programming solutions.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            height: 1.6,
          ),
        ),
        SizedBox(height: 32),
        _buildStats(),
      ],
    );
  }

  Widget _buildAvailableForHire() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Available for Hiring',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialButton(
          icon: Icons.share,
          onPressed: () {},
        ),
        _SocialButton(
          icon: Icons.code,
          onPressed: () {},
        ),
        _SocialButton(
          icon: Icons.mail,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Wrap(
      spacing: 40,
      runSpacing: 24,
      children: [
        _StatItem(value: '30+', label: 'Projects\nCompleted'),
        _StatItem(value: '9+', label: 'Ongoing\nProjects'),
        _StatItem(value: '1+', label: 'Years of\nExperience'),
        _StatItem(value: '130+', label: 'Client\nRetention'),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({
    Key? key,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}