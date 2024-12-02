class User {
  final int id;
  final String ticket;
  final String role;
  final String phone;
  final UserProfile profile;

  User({
    required this.id,
    required this.ticket,
    required this.role,
    required this.phone,
    required this.profile,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      ticket: json['ticket'],
      role: json['role'],
      phone: json['phone'],
      profile: UserProfile.fromJson(json['profile']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticket': ticket,
      'role': role,
      'phone': phone,
      'profile': profile.toJson(),
    };
  }
}

class UserProfile {
  final String name;
  final String surname;
  final String placeOfResidence;
  final String organization;

  UserProfile({
    required this.name,
    required this.surname,
    required this.placeOfResidence,
    required this.organization,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      surname: json['surname'],
      placeOfResidence: json['place_of_residence'],
      organization: json['organization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'place_of_residence': placeOfResidence,
      'organization': organization,
    };
  }
}
