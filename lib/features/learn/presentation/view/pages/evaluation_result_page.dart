import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syntra_ai/core/utils/app_dialogs.dart';
import 'package:syntra_ai/core/utils/app_toast.dart';
import 'package:syntra_ai/features/learn/domain/entities/evaluate_project_request_entity.dart';
import 'package:syntra_ai/features/learn/presentation/view_model/learn_cubit.dart';
import 'package:toastification/toastification.dart';

class EvaluationResultPage extends StatefulWidget {
  final LearnCubit learnCubit;
  final EvaluateProjectRequestEntity evaluateProjectRequestEntity;
  const EvaluationResultPage(
      {super.key,
      required this.learnCubit,
      required this.evaluateProjectRequestEntity});

  @override
  State<EvaluationResultPage> createState() => _EvaluationResultPageState();
}

class _EvaluationResultPageState extends State<EvaluationResultPage> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.learnCubit.evaluateProject(widget.evaluateProjectRequestEntity);
      await widget.learnCubit.getEvaluationResult(widget.evaluateProjectRequestEntity.studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluation Result'),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<LearnCubit, LearnState>(
            bloc: widget.learnCubit,
            listenWhen: (previous, current) =>
                current is EvaluateProjectLoading ||
                current is EvaluateProjectSuccess ||
                current is EvaluateProjectError,
            listener: (context, state) {
              if (state is EvaluateProjectLoading) {
                AppDialogs.showLoadingDialog(context,
                    title: 'Evaluating your project...');
              }
              if (state is EvaluateProjectSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (state is EvaluateProjectError) {
                Navigator.of(context, rootNavigator: true).pop();
                AppToast.showToast(
                    context: context,
                    title: 'Error',
                    description: state.message,
                    type: ToastificationType.error);
              }
            },
          ),
          BlocListener<LearnCubit, LearnState>(
            bloc: widget.learnCubit,
            listenWhen: (previous, current) =>
                current is EvaluationResultLoading ||
                current is EvaluationResultSuccess ||
                current is EvaluationResultError,
            listener: (context, state) {
              if (state is EvaluationResultLoading) {
                AppDialogs.showLoadingDialog(context,
                    title: 'Getting evaluation result...');
              }
              if (state is EvaluationResultSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              if (state is EvaluationResultError) {
                Navigator.of(context, rootNavigator: true).pop();
                AppToast.showToast(
                    context: context,
                    title: 'Error',
                    description: state.message,
                    type: ToastificationType.error);
              }
            },
          ),
        ],
        child: BlocBuilder<LearnCubit, LearnState>(
          bloc: widget.learnCubit,
          buildWhen: (previous, current) => current is EvaluationResultSuccess,
          builder: (context, state) {
            if (state is EvaluationResultSuccess) {
              final evaluationResultResponseEntity =
                  state.evaluationResultResponseEntity;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Score: ${evaluationResultResponseEntity.score}/100',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Feedback:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      evaluationResultResponseEntity.feedback.suggestions,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
