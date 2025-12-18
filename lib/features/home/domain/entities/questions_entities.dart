import 'package:equatable/equatable.dart';
import 'package:eltyp_delivery/features/home/data/models/questions_model.dart';
import 'package:eltyp_delivery/features/profile/data/models/cars_model.dart';

class QuestionsResponseEntities extends Equatable {
  const QuestionsResponseEntities({
    required this.questions,
    required this.messageBar,
  });

  final List<QuestionsModel> questions;

  final List<MessageBarModel> messageBar;

  @override
  List<Object?> get props => [questions, messageBar];
}

class MessageBarEntities extends Equatable {
  const MessageBarEntities({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
}

class QuestionsEntities extends Equatable {
  const QuestionsEntities({
    required this.id,
    required this.teamOne,
    required this.expireAt,
    required this.teamTwo,
    required this.status,
    required this.distributedAt,
    required this.expireDate,
    required this.expireTime,
    required this.points,
    required this.season,
    required this.currentUserAnswer,
  });

  final int id;
  final TeamModel teamOne;
  final TeamModel teamTwo;
  final String status;
  final String expireAt;
  final String distributedAt;
  final String expireDate;
  final String expireTime;
  final int points;
  final SeasonModel season;
  final CurrentUserAnswerModel? currentUserAnswer;

  @override
  List<Object?> get props => [
    id,
    expireAt,
    teamOne,
    teamTwo,
    status,
    distributedAt,
    expireDate,
    expireTime,
    points,
    season,
    currentUserAnswer,
  ];
}

class TeamEntities extends Equatable {
  const TeamEntities({
    required this.id,
    required this.name,
    required this.color,
    required this.image,
    required this.teamGroup,
  });

  final int id;
  final String name;
  final String image;
  final String color;
  final NameIdModel teamGroup;

  @override
  List<Object?> get props => [id, name, image, color, teamGroup];
}

class SeasonEntities extends Equatable {
  const SeasonEntities({
    required this.id,
    required this.name,
    required this.defaultSeasonalPoints,
    required this.defaultPermanentPoints,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.leagueName,
    required this.leagueLogo,
  });

  final int id;
  final String name;
  final String image;
  final String leagueName;
  final String leagueLogo;
  final int? defaultSeasonalPoints;
  final int? defaultPermanentPoints;
  final String startDate;
  final String endDate;

  @override
  List<Object?> get props => [
    id,
    name,
    defaultSeasonalPoints,
    image,
    defaultPermanentPoints,
    startDate,
    leagueLogo,
    leagueName,
    endDate,
  ];
}

class CurrentUserAnswerEntities extends Equatable {
  // "current_user_answer": {
  //       "id": 1,
  //       "user_id": 6,
  //       "season_question_id": 1,
  //       "selected_answer": "b",
  //       "is_correct": false,
  //       "points_earned": 0,
  //       "created_at": "2025-09-23T15:31:11.000000Z",
  //       "updated_at": "2025-09-23T15:31:11.000000Z"
  //     }
  const CurrentUserAnswerEntities({
    required this.id,
    required this.userId,
    required this.seasonQuestionId,
    required this.selectedAnswer,
    required this.isCorrect,
    required this.pointsEarned,
    required this.createdAt,
    required this.updatedAt,
    required this.answerOne,
    required this.answerTwo,
  });

  final int id;
  final int userId;
  final int seasonQuestionId;
  final int answerOne;
  final int answerTwo;
  final String selectedAnswer;
  final bool isCorrect;
  final int pointsEarned;
  final String createdAt;
  final String updatedAt;

  @override
  List<Object?> get props => [
    id,
    userId,
    seasonQuestionId,
    answerOne,
    answerTwo,
    selectedAnswer,
    isCorrect,
    pointsEarned,
    createdAt,
    updatedAt,
  ];
}
