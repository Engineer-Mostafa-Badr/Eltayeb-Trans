import 'package:eltyp_delivery/features/home/domain/entities/questions_entities.dart';
import 'package:eltyp_delivery/features/profile/data/models/cars_model.dart';

class QuestionsResponseModel extends QuestionsResponseEntities {
  const QuestionsResponseModel({
    required super.questions,
    required super.messageBar,
  });

  factory QuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    return QuestionsResponseModel(
      questions: List<QuestionsModel>.from(
        json['questions'].map((x) => QuestionsModel.fromJson(x)),
      ),
      messageBar: List<MessageBarModel>.from(
        json['message_bar'].map((x) => MessageBarModel.fromJson(x)),
      ),
    );
  }

  QuestionsResponseModel copyWith({
    List<QuestionsModel>? questions,
    List<MessageBarModel>? messageBar,
  }) {
    return QuestionsResponseModel(
      questions: questions ?? this.questions,
      messageBar: messageBar ?? this.messageBar,
    );
  }
}

class MessageBarModel extends MessageBarEntities {
  const MessageBarModel({required super.text});

  factory MessageBarModel.fromJson(Map<String, dynamic> json) {
    return MessageBarModel(text: json['text'] ?? '');
  }
}

class QuestionsModel extends QuestionsEntities {
  const QuestionsModel({
    required super.id,
    required super.teamOne,
    required super.teamTwo,
    required super.status,
    required super.distributedAt,
    required super.expireDate,
    required super.expireTime,
    required super.points,
    required super.season,
    required super.expireAt,
    required super.currentUserAnswer,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) {
    return QuestionsModel(
      id: json['id'] ?? 0,
      teamOne: TeamModel.fromJson(json['team_one'] ?? {}),
      teamTwo: TeamModel.fromJson(json['team_two'] ?? {}),
      status: json['status'] ?? '',
      distributedAt: json['distributed_at'] ?? '',
      expireDate: json['expire_date'] ?? '',
      expireAt: json['expire_at'] ?? '',
      expireTime: json['expire_time'] ?? '',
      points: json['points'] ?? 0,
      season: SeasonModel.fromJson(json['season'] ?? {}),
      currentUserAnswer: json['current_user_answer'] != null
          ? CurrentUserAnswerModel.fromJson(json['current_user_answer'])
          : null,
    );
  }
}

class TeamModel extends TeamEntities {
  const TeamModel({
    required super.id,
    required super.color,
    required super.name,
    required super.image,
    required super.teamGroup,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      color: json['color'] ?? '',
      teamGroup: NameIdModel.fromJson(json['team_group'] ?? {}),
    );
  }
}

class SeasonModel extends SeasonEntities {
  const SeasonModel({
    required super.id,
    required super.name,
    required super.defaultSeasonalPoints,
    required super.defaultPermanentPoints,
    required super.startDate,
    required super.endDate,
    required super.image,
    required super.leagueName,
    required super.leagueLogo,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      defaultSeasonalPoints: json['default_seasonal_points'] ?? 0,
      defaultPermanentPoints: json['default_permanent_points'] ?? 0,
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      image: json['image'] ?? '',
      leagueName: json['league_name'] ?? '',
      leagueLogo: json['league_logo'] ?? '',
    );
  }
}

class CurrentUserAnswerModel extends CurrentUserAnswerEntities {
  const CurrentUserAnswerModel({
    required super.id,
    required super.userId,
    required super.seasonQuestionId,
    required super.selectedAnswer,
    required super.isCorrect,
    required super.pointsEarned,
    required super.createdAt,
    required super.updatedAt,
    required super.answerOne,
    required super.answerTwo,
  });

  factory CurrentUserAnswerModel.fromJson(Map<String, dynamic> json) {
    return CurrentUserAnswerModel(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      seasonQuestionId: json['season_question_id'] ?? 0,
      selectedAnswer: json['selected_answer'] ?? '',
      isCorrect: json['is_correct'] ?? false,
      pointsEarned: json['points_earned'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      answerOne: json['answer_one'] ?? 0,
      answerTwo: json['answer_two'] ?? 0,
    );
  }
}
