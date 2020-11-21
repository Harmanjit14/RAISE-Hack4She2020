import 'dart:async';
import 'package:graphql/client.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hasura_connect/hasura_connect.dart';

String email = "";
String password = "";
String pass = "";
bool lowerCase = false, upperCase = false, number = false, minChar = false;
String name = "";
String gender = "";
String city, state;
String mobile = "";
int age, height, weight;
String selcExercise = "";
String selcPeriod = "";
Color bmiCol = Colors.red;
Color activeColor = Colors.red;
Color activeColorP = Colors.black;
double bmi = (weight * 10000) / (height * height);
String bmiLog = "";
String tempname = name;
String tempgender = "M";
String tempcity = city, tempstate = state;
String tempmobile = mobile;
int tempage = age, tempheight = height, tempweight = weight;
String token;
String pString = "Start Tacking";
String jtitle, jdesc, jloc, jmob, jskills;
int jpay;
List<Map> jobs= new List(2);

final Map<DateTime, List> exerciseDays = {};
final Map<DateTime, List> periodDays = {};
List<String> ques = [
  "Describe Your Current Mood",
  "How do you Describe Yourself",
  "Do you think you have a mental issue",
  "What is your role in your family",
  "Choose a quote",
];

List<DropdownMenuItem<dynamic>> ans4 = [
  DropdownMenuItem(
    child: Text("I am worried"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("I dont think so"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("I feel Sad most of the times"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("I am fine"),
    value: 3,
  ),
];
List<DropdownMenuItem<dynamic>> ans3 = [
  DropdownMenuItem(
    child: Text("I am worried"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("I dont think so"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("I feel Sad most of the times"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("I am fine"),
    value: 3,
  ),
];
List<DropdownMenuItem<dynamic>> ans2 = [
  DropdownMenuItem(
    child: Text("I am worried"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("I dont think so"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("I feel Sad most of the times"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("I am fine"),
    value: 3,
  ),
];
List<DropdownMenuItem<dynamic>> ans1 = [
  DropdownMenuItem(
    child: Text("Terrible"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("socially awkward"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("cold"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("Happy"),
    value: 3,
  ),
];
List<DropdownMenuItem> ans0 = [
  DropdownMenuItem(
    child: Text("Terrible"),
    value: 0,
  ),
  DropdownMenuItem(
    child: Text("I am Fed up!"),
    value: 1,
  ),
  DropdownMenuItem(
    child: Text("Antisocial"),
    value: 2,
  ),
  DropdownMenuItem(
    child: Text("Happy"),
    value: 3,
  ),
];

Future<int> sendDistress() {
  print("started");
  Timer(Duration(seconds: 0), () async {
    print("1");
    await getAndsendLoc();
  });
  Timer(Duration(seconds: 20), () async {
    await getAndsendLoc();
  });
  Timer(Duration(seconds: 40), () async {
    await getAndsendLoc();
  });
}

Future<int> getAndsendLoc() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "JWT $token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  Position position = await Geolocator.getCurrentPosition(
      timeLimit: Duration(seconds: 10), desiredAccuracy: LocationAccuracy.best);
  double lat = position.latitude;
  double long = position.longitude;
  print(lat);
  print(long);
  String getAuthToken = """
  mutation{
    addPolice(latitude: "$lat" , longitude: "$long" ){
      __typename
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
    return 1;
  }
}

Future<int> getToken() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );

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
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
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
  HasuraConnect hasuraConnect =
      HasuraConnect("https://raise-backend.herokuapp.com/graphql");
  String createMutation = """
  mutation{
    createUser(email:"$email",password:"$password"){
      user{
        email
      }
    }
  }
""";
  // var result;
  // var excep;
  try {
    await hasuraConnect
        .mutation(createMutation)
        .then((value) => {print(value["data"]["createUser"]["user"]["email"])});
    return 1;
  } catch (e) {
    print(e);
    return 0;
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
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  // print(tempname);
  // print(tempgender);
  if (tempname == "" || tempname == null) {
    tempname = name;
  }
  if (tempmobile == "") {
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
    // bmiCal();
    return 1;
  }
}

Future<int> createProfileFunction() async {
  int temp = await getToken();
  if (temp == 1) {
    HttpLink _httpLink = HttpLink(
      headers: {
        "Authorization": "$token",
      },
      uri: "https://raise-backend.herokuapp.com/graphql",
    );
    AuthLink _authLink = AuthLink(
      //  headerKey: "Authorization",
      getToken: () async {
        return "JWT $token";
      },
    );
    Link _link = _authLink.concat(_httpLink);
    GraphQLClient _client = GraphQLClient(
      defaultPolicies: DefaultPolicies(
          mutate:
              Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
          query: Policies(fetch: FetchPolicy.noCache)),
      cache:
          NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
      link: _link,
    );
    String createMutation = '''
  mutation{
    createProfile(name : "$tempname", 
    age : $tempage , 
    mobile : "$tempmobile",
    gender : "$tempgender",
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
    if (result.hasException) {
      print("failed");
      print(result.exception);
      return 0;
    } else {
      print("done");
      String tempVar =
          result.data["createProfile"]["profile"]["name"].toString();
      print(tempVar);
      // bmiCal();
      return 1;
    }
  } else {
    return 0;
  }
}

Future<int> getExercise()async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  String createMutation = '''
    {
      getexerciseinfo{
        date
        month
        year
      }
    }
''';
  QueryOptions createOptions = QueryOptions(
    documentNode: gql(createMutation),
  );

  QueryResult result = await _client.query(createOptions);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    try {
      print(result.data.toString());
      int day = result.data["getexerciseinfo"][0]["date"];
      int mon = result.data["getexerciseinfo"][0]["month"];
      int yr = result.data["getexerciseinfo"][0]["year"];
      DateTime x = DateTime(yr, mon, day);
      exerciseDays[x] = ["P"];
      return 1;
    } catch (e) {
      return 1;
    }
  }
}

Future<int> getPeriodInfo() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  String createMutation = '''
    {
      getperiodinfo{
        date
        month
        year
      }
    }
''';
  QueryOptions createOptions = QueryOptions(
    documentNode: gql(createMutation),
  );

  QueryResult result = await _client.query(createOptions);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    try {
      print(result.data.toString());
      int day = result.data["getperiodinfo"][0]["date"];
      int mon = result.data["getperiodinfo"][0]["month"];
      int yr = result.data["getperiodinfo"][0]["year"];
      DateTime x = DateTime(yr, mon, day);
      var y = x.add(Duration(days: 28));
      var y1 = x.add(Duration(days: 27));
      var y2 = x.add(Duration(days: 29));
      var z = y.add(Duration(days: 28));
      var z1 = y.add(Duration(days: 27));
      var z2 = y.add(Duration(days: 29));
      periodDays[x] = ["P"];
      periodDays[y1] = ["P"];
      periodDays[y2] = ["P"];
      periodDays[z1] = ["P"];
      periodDays[z2] = ["P"];
      periodDays[y] = ["P"];
      periodDays[z] = ["P"];
      return 1;
    } catch (e) {
      return 1;
    }
  }
}

Future<int> addExercise() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  var temp = DateTime.now();
  String createMutation = '''
  mutation{
     addExercise(date:${temp.day},month:${temp.month},year:${temp.year}){
     __typename
   }
  }
''';
  MutationOptions createOptions = MutationOptions(
    documentNode: gql(createMutation),
  );
  QueryResult result = await _client.mutate(createOptions);

  if (result.hasException) {
    print("failed");
    print(result.exception);
    return 0;
  } else {
    print("done");
    // String tempVar = result.data["createProfile"]["profile"]["name"].toString();
    // print(tempVar);
    // bmiCal();
    return 1;
  }
}

Future<int> addPeriodInfo() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  var temp = DateTime.now();
  String createMutation = '''
  mutation{
     addPeriod(date:${temp.day},month:${temp.month},year:${temp.year}){
     __typename
   }
  }
''';
  MutationOptions createOptions = MutationOptions(
    documentNode: gql(createMutation),
  );
  QueryResult result = await _client.mutate(createOptions);

  if (result.hasException) {
    print("failed");
    print(result.exception);
    return 0;
  } else {
    print("done");
    // String tempVar = result.data["createProfile"]["profile"]["name"].toString();
    // print(tempVar);
    // bmiCal();
    return 1;
  }
}

Future<int> getJobs() async {
  HttpLink _httpLink = HttpLink(
    headers: {
      "Authorization": "$token",
    },
    uri: "https://raise-backend.herokuapp.com/graphql",
  );
  AuthLink _authLink = AuthLink(
    //  headerKey: "Authorization",
    getToken: () async {
      return "JWT $token";
    },
  );
  Link _link = _authLink.concat(_httpLink);
  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _link,
  );
  print(token);
  String queryProfile = """
  {
    alljobs{
      title
      description,
      pay,
      location,
      mobile,
      skillsrequired,
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
    
   Map<dynamic,dynamic> temp= {
      "title": result.data["alljobs"][0]["title"],
      "description":  result.data["alljobs"][0]["description"],
      "pay": result.data["alljobs"][0]["pay"],
      "location": result.data["alljobs"][0]["location"],
      "skills": result.data["alljobs"][0]["skillsrequired"],
    };
    print(temp.toString());
    jobs[2]= temp;
    print(temp.toString());
     Map<dynamic,dynamic> temp2 = {
      "title": result.data["alljobs"][1]["title"],
      "description":  result.data["alljobs"][1]["description"],
      "pay": result.data["alljobs"][1]["pay"],
      "location": result.data["alljobs"][1]["location"],
      "skills": result.data["alljobs"][1]["skillsrequired"],
    };
    jobs[2]= temp2;
    return 1;
  }
}
