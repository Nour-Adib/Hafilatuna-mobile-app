import 'package:get/get.dart';
import 'package:hafilatuna/models/leaderboard.model.dart';

class LeaderboardController extends GetxController {
  Leaderboard obj1 = Leaderboard(name: 'Ahmed', action: 100);
  Leaderboard obj2 = Leaderboard(name: 'Nidal', action: 234);
  Leaderboard obj3 = Leaderboard(name: 'Dhruv', action: 478);
  Leaderboard obj4 = Leaderboard(name: 'Aaron', action: 479);
  Leaderboard obj5 = Leaderboard(name: 'Aslam', action: 524);

  List<Leaderboard> activities = [];

  add() {
    activities = [];
    activities.add(obj5);
    activities.add(obj4);
    activities.add(obj3);
    activities.add(obj2);
    activities.add(obj1);
  }
}
