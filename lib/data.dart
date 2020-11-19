import 'package:graphql/client.dart';
import 'package:flutter/material.dart';

String email = "";
String password = "";
String pass = "";
bool lowerCase = false, upperCase = false, number = false, minChar = false;
String name = "";
String gender = "";
String city, state, mobile;
int age, height, weight;
String selcExercise = "";
String selcPeriod = "";
Color bmiCol = Colors.red;
Color activeColor = Colors.red;
Color activeColorP = Colors.black;
double bmi = (weight * 10000) / (height * height);
String bmiLog = "";
String tempname = name;
String tempgender = gender;
String tempcity = city, tempstate = state, tempmobile = mobile;
int tempage = age, tempheight = height, tempweight = weight;
String token;

final Map<DateTime, List> exerciseDays = {
  DateTime(2020, 11, 11): ['New Year\'s Day'],
  DateTime(2020, 11, 6): ['Epiphany'],
  DateTime(2020, 11, 4): ['Valentine\'s Day'],
  DateTime(2020, 11, 1): ['Easter Sunday'],
  DateTime(2020, 11, 2): ['Easter Monday'],
};
final Map<DateTime, List> periodDays = {
  DateTime(2020, 11, 1): ['Easter Sunday'],
  DateTime(2020, 11, 2): ['Easter Monday'],
};
HttpLink _httpLink = HttpLink(
  uri: "https://healthzen-backend.herokuapp.com/graphql",
);
AuthLink _authLink = AuthLink(
  //  headerKey: "Authorization",
  getToken: () async {
    return "$token";
  },
);
Link _link = _authLink.concat(_httpLink);
GraphQLClient _client = GraphQLClient(
  defaultPolicies: DefaultPolicies(
      mutate: Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
      query: Policies(fetch: FetchPolicy.noCache)),
  cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
  link: _link,
);

Future<int> getToken() async {
  String getAuthToken = """
  mutation{
    tokenAuth(email : "$email", password: "$password"){
      token
    }
  }
""";
  MutationOptions tokenGet = MutationOptions(
    documentNode: gql(getAuthToken),
  );

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    token = result.data["tokenAuth"]["token"];

    return 1;
  }
}

Future<int> getProfile() async {
  print(token);
  String queryProfile = """
  {
    myprofile{
      name
      Age
      Height
      Weight
      Gender
      mobile
      city 
      state
    }
  }
""";
  QueryOptions myprofile = QueryOptions(
      documentNode: gql(queryProfile), fetchPolicy: FetchPolicy.networkOnly);

  QueryResult result = await _client.query(myprofile);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print(result.data.toString());
    name = result.data["myprofile"]["name"];
    age = result.data["myprofile"]["Age"];
    height = result.data["myprofile"]["Height"];
    weight = result.data["myprofile"]["Weight"];
    gender = result.data["myprofile"]["Gender"];
    city = result.data["myprofile"]["city"];
    state = result.data["myprofile"]["state"];
    mobile = result.data["myprofile"]["mobile"];
    return 1;
  }
}

Future<int> createUser() async {
  String createMutation = """
  mutation{
    createUser(email:"",password:""){
      user{
        email
      }
    }
  }
""";
  MutationOptions createAcc = MutationOptions(
      documentNode: gql(createMutation),
      fetchPolicy: FetchPolicy.networkOnly,
      errorPolicy: ErrorPolicy.all,
      onError: (val) {
        print(val);
      });

  QueryResult result = await _client.mutate(createAcc);
  print(result);
  if (result.loading) {
    print("loading");
    return 0;
  } else if (result.hasException) {
    print("failed");
    print(result.exception);
    return 0;
  } else {
    print("done");
    // String tempVar = result.data["createUser"]["__typename"];
    // print(tempVar);
    return 1;
  }
}

String getbmiLog() {
  if (bmi > 18.5 && bmi <= 25) {
    bmiCol = Colors.green;
    return "You are Fit!";
  } else if (bmi > 25 && bmi <= 30) {
    bmiCol = Colors.red;
    return "You are Overweight!";
  } else if (bmi > 30 && bmi <= 35) {
    bmiCol = Colors.red;
    return "You are Obese Class-1";
  } else if (bmi > 35 && bmi <= 40) {
    bmiCol = Colors.red;
    return "You are Obese Class-2";
  } else if (bmi > 40) {
    bmiCol = Colors.red;
    return "You are Obese Class-3";
  } else if (bmi > 17 && bmi <= 18.5) {
    bmiCol = Colors.green;
    return "You are Mild Thin!";
  } else if (bmi > 16 && bmi <= 17) {
    bmiCol = Colors.green;
    return "You are Moderate Thin!";
  } else if (bmi <= 16) {
    bmiCol = Colors.red;
    return "You are Obese Severe Thin!";
  }
}

Future<int> updateProfileFunction() async {
  // print(tempname);
  print(tempgender);
  if (tempname == "" || tempname == null) {
    tempname = name;
  }
  if (tempmobile == "" || tempmobile == null) {
    tempmobile = mobile;
  }
  if (tempstate == "" || tempstate == null) {
    tempstate = state;
  }
  if (tempcity == "" || tempcity == null) {
    tempcity = city;
  }
  if (tempheight == null) {
    tempheight = height;
  }
  if (tempweight == null) {
    tempweight = weight;
  }
  if (tempage == null) {
    tempage = age;
  }

  String createMutation = '''
  mutation{
    updateProfile(name : "$tempname", 
    mobile : "$tempmobile", 
    age : $tempage , 
    gender : "$gender",
    city :"$tempcity", 
    state : "$tempstate", 
    weight : $tempweight,
    height:$tempheight){
        profile{
        name
      }
    }
  }
''';
  MutationOptions createOptions = MutationOptions(
    documentNode: gql(createMutation),
  );

  QueryResult result = await _client.mutate(createOptions);
  if (result.loading) {
    print("loading");
    return 1;
  } else if (result.hasException) {
    print("failed");
    print(result.exception);
    return 0;
  } else {
    print("done");
    String tempVar = result.data["updateProfile"]["profile"]["name"].toString();
    print(tempVar);
    return 1;
  }
}
