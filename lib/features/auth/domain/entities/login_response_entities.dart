import 'package:equatable/equatable.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';

class LoginResponseEntities extends Equatable {
  // {
  //     "user": {
  //       "id": 4,
  //       "name": "Wael",
  //       "phone": "05123123122",
  //       "email": "Wael@app.com",
  //       "points": null,
  //       "guss_points": null
  //     },
  //     "token": "10|sHUjouVfrGcN5ISg80L4JbkmWzNOaZVWPQB3B3h9c1d1fe74"
  //   }
  final UserModel user;
  final String token;

  const LoginResponseEntities({required this.user, required this.token});

  @override
  List<Object?> get props => [user, token];
}
