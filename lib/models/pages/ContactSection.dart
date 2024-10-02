import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildContactInfo(context)),
                    SizedBox(width: 40),
                    Expanded(child: _buildContactForm(context)),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContactInfo(context),
                    SizedBox(height: 40),
                    _buildContactForm(context),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactItem(Icons.email, 'Email', 'john.doe@example.com'),
        SizedBox(height: 20),
        _buildContactItem(Icons.phone, 'Phone', '+1 234 567 890'),
        SizedBox(height: 20),
        _buildContactItem(Icons.location_on, 'Location', 'New York, USA'),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String title, String content) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.subtitle1),
            Text(content, style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(labelText: 'Message'),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _isSubmitting ? null : _submitForm,
            child: _isSubmitting
                ? CircularProgressIndicator(color: Colors.white)
                : Text('Send Message'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      try {
        await FirebaseDatabase.instance.ref().child('messages').push().set({
          'name': _nameController.text,
          'email': _emailController.text,
          'message': _messageController.text,
          'timestamp': ServerValue.timestamp,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Message sent successfully!')),
        );

        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message. Please try again.')),
        );
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}