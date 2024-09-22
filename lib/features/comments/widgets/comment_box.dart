import 'package:flutter/material.dart';
import 'package:lingo_panda_assignment/features/comments/models/comment.dart';

class CommentBox extends StatelessWidget {
  final Comment comment;
  final bool isMaskedEmail;

  const CommentBox({super.key, required this.comment, required this.isMaskedEmail});

  String getEmail() {
    if(!isMaskedEmail) {
      return comment.email;
    }
    final parts = comment.email.split('@');
    final username = parts[0];
    final domain = parts[1];

    // Mask part of the username
    final maskedUsername = username.replaceRange(1, username.length - 1, '*' * (username.length - 2));
    return '$maskedUsername@$domain';
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(left: 10, top: 12),
      width: double.infinity,
      height: 191,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePic(text: comment.name.substring(0, 1).toUpperCase()),
          const SizedBox(width: 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileRow(label: 'Name', text: comment.name),
              ProfileRow(label: 'Email', text: getEmail()),
              const SizedBox(height: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Wrap(
                  children: [
                    Text(
                     comment.body,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  final String label;
  final String text;

  const ProfileRow({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.70,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    overflow: TextOverflow.ellipsis,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  final String text;

  const ProfilePic({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
