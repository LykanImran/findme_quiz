class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}


/// just have to fetch the question here using the model above


const List sample_data = [
  {
    "id": 1,
    "question":
        "How many time zones are there in Russia?",
    "options": ['11', '6', '15', '2'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "OS computer abbreviation usually means ?",
    "options": ["Order of Significance","Open Software","Operating System","Optical Sensor"],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Select the most appropriate synonym of the given word -Glorious ?",
    "options": ['Splendid', 'Unusual', "Enormous", 'Gentle'],
    "answer_index": 0,
  },
];
