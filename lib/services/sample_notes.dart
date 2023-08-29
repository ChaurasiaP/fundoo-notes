class Note{
  final int id;
  final String title;
  final String content;
  final DateTime lastUpdatedTime;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.lastUpdatedTime
  });

  static List<Note> getSampleNotes()  =>
      [
    Note(
      id: 1,
      title: "Buy groceries",
      content: "Milk, eggs, bread, and vegetables",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 2,
      title: "Finish homework",
      content: "Complete math and science assignments, lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 3,
      title: "Call Mom",
      content: "Discuss weekend plans",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 4,
      title: "Go for a run",
      content: "Run for 30 minutes lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum in the park",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 5,
      title: "Read a book",
      content: "Start reading 'The Great Gatsby'",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 6,
      title: "Pay bills",
      content: "Electricity, water, and internet bills",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 7,
      title: "Plan vacation",
      content: "Research destinations and book flights",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 8,
      title: "Attend meeting",
      content: "Project update meeting at lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 2 PM",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 9,
      title: "Clean the garage",
      content: "Organize tools and equipment",
      lastUpdatedTime: DateTime.now(),
    ),
    Note(
      id: 10,
      title: "Write thank you cards",
      content: "Thank friends for birthdaylorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum  gifts",
      lastUpdatedTime: DateTime.now(),
    )
  ];
}