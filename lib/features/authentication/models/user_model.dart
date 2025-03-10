
import 'package:e_commerce/features/utils/formatters/formatters.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Factory method for creating a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userName: json['userName'],
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }

  // Method for converting a UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

  // CopyWith method for immutability
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phoneNumber,
    String? profilePicture,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  //-- helper function to get full name
  String get fullName => '$firstName $lastName';

  //-- helper funciton to formati phone number
  String get formattedPhoneNumber => AppFormatters.formatPhoneNumber(phoneNumber);

  //-- static function to split full name into first name and last name
  static List<String> nameParts(fullName) => fullName.split(' ');

  //-- static function to genarate username from full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }

  //--static function to create an empty model
  static UserModel empty() =>
      UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');
}
