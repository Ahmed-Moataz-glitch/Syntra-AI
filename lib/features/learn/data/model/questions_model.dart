// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionsModel {
  final int questionNumber;
  final String question;
  final List<String> options;
  String selectedAnswer;

  QuestionsModel({
    required this.questionNumber,
    required this.question,
    required this.options,
    required this.selectedAnswer,
  });

  QuestionsModel copyWith({
    int? questionNumber,
    String? question,
    List<String>? options,
    String? selectedAnswer,
  }) {
    return QuestionsModel(
      questionNumber: questionNumber ?? this.questionNumber,
      question: question ?? this.question,
      options: options ?? this.options,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
    );
  }
}

List<QuestionsModel> questionsList = [
  QuestionsModel(
    questionNumber: 1,
    question:
        'When approaching a complex problem, what do you usually focus on\nfirst?',
    options: [
      'Understanding the overall system and how its components interact',
      'Breaking down the problem into smaller, manageable parts',
      'Identifying the most critical component that needs to be addressed',
      'Thinking about the potential end-user experience and interfaces',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 2,
    question:
        'You\'re tasked with designing a system that involves multiple services\ninteracting with each other. How would you approach the\ncommunication between these services?',
    options: [
      'Design a centralized hub that handles all communication between services',
      'Use a message queue to allow services to communicate asynchronously',
      'Implement a peer-to-peer communication model where services interact directly',
      'Focus on creating a robust API for each service to expose its functionality',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 3,
    question:
        'When working on a project, you notice that the database query\nperformance is becoming a bottleneck. What would you do to address\nthis issue?',
    options: [
      'Optimize the database queries by indexing and caching',
      'Scale up the database hardware to increase processing power',
      'Implement a caching layer to reduce the number of database queries',
      'Consider using a different database technology or data storage solution',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 4,
    question:
        'You\'re building a web application that requires users to upload and\nprocess large files. How would you handle the file processing to\nensure it doesn\'t impact the application\'s performance?',
    options: [
      'Use a worker queue to process files in the background',
      'Process files synchronously, but use a progress bar to show the user the status',
      'Store files in a temporary location and process them during off-peak hours',
      'Distribute file processing across multiple servers to scale horizontally',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 5,
    question:
        'When designing a user interface, what do you think is the most\nimportant aspect to consider?',
    options: [
      'Ensuring the interface is visually appealing and consistent with the brand',
      'Making sure the interface is intuitive and easy to use for the target audience',
      'Providing a wide range of features and customization options',
      'Optimizing the interface for performance and fast loading times',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 6,
    question:
        'You\'re tasked with integrating a third-party library into your project.\nThe library has a complex architecture and is not well-documented.\nHow would you approach this integration?',
    options: [
      'Spend time reading and understanding the library\'s source code to ensure a deep understanding',
      'Look for existing integrations or examples of the library being used in other projects',
      'Focus on getting the basic functionality working and then iterate on the integration',
      'Consider reaching out to the library\'s community or support team for guidance',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 7,
    question:
        'When working on a team project, you notice that there are conflicting\nopinions on how to implement a particular feature. How would you\nhandle this situation?',
    options: [
      'Put forward your own opinion and try to convince the team to adopt your approach',
      'Encourage an open discussion to understand the reasoning behind each team member\'s opinion',
      'Suggest a prototype or proof-of-concept to test and validate different approaches',
      'Escalate the issue to a team lead or manager to make a decision',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 8,
    question:
        'You\'re tasked with debugging a complex issue that is occurring\nintermittently in a distributed system. What would you do to identify\nthe root cause of the issue?',
    options: [
      'Use logging and monitoring tools to collect data and identify patterns',
      'Implement a debugging framework to step through the code and inspect variables',
      'Create a simulated environment to reproduce the issue and test hypotheses',
      'Use statistical analysis and machine learning techniques to identify correlations and anomalies',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 9,
    question:
        'When designing a data storage system, what do you think is the most\nimportant factor to consider in terms of data retrieval and querying?',
    options: [
      'Data normalization and schema design to ensure efficient querying',
      'Indexing and caching mechanisms to improve query performance',
      'Data partitioning and sharding to distribute load and improve scalability',
      'Data compression and encryption to ensure security and reduce storage costs',
    ],
    selectedAnswer: '',
  ),
  QuestionsModel(
    questionNumber: 10,
    question:
        'You\'re tasked with creating a data visualization dashboard to help\nstakeholders understand complex data insights. What would you\nfocus on to ensure the dashboard is effective?',
    options: [
      'Selecting the most relevant and meaningful metrics to display',
      'Designing an intuitive and user-friendly interface to navigate the data',
      'Using interactive and dynamic visualizations to facilitate exploration and discovery',
      'Ensuring the dashboard is optimized for performance and can handle large datasets',
    ],
    selectedAnswer: '',
  ),
];
