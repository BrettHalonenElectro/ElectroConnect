class QueriesMutations {
  String getNotificationsByUser(String userId) {
    return '''
    query getnotifications {
      allNotifications(condition: {userId: $userId}) {
        nodes {
          createdOn
          deleted
          message
          urgency
        }
      }
    }

    ''';
  }

  String loginMutation(String email, String password) {
    return """
      mutation signin {
        signin(input: {email: "$email", password: "$password"}) {
          jwtToken
        }
      }  
     """;
  }
}
