import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/features/comments/bloc/comment_bloc.dart';
import 'package:lingo_panda_assignment/features/comments/widgets/comment_box.dart';

class CommentScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const CommentScreen());

  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CommentBloc>(context).add(FetchComments());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            BlocBuilder<CommentBloc, CommentState>(
              builder: (context, state) {
                if (state is CommentLoaded) {
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.comments.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                      itemBuilder: (context, index) =>
                          CommentBox(comment: state.comments[index], isMaskedEmail: state.isMaskedEmail,),
                    ),
                  );
                }
                return const Center(
                  child: Text('No comments...'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
