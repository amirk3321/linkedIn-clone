
import 'package:linkedin_clone/model/company_model.dart';
import 'package:linkedin_clone/model/group_model.dart';
import 'package:linkedin_clone/model/user_model.dart';
import 'package:linkedin_clone/model/user_post_model.dart';

class FakeRepository{
  static final List<UserPostModel> postList =[
    UserPostModel(
        name: "Shehroz Jamal",
        profileUrl: "assets/profileImage4.jpeg",
        headline: "HR Executive ",
        tags: "#positivity #motivation #learning #progress #development #networking #business #jobhunters #jobseekers #connections #networking #linkedin #nevergiveup #staypositive #staystrong #positiveattitude",
        description: "Stay Strong!\n\nKeep Your Head Up!\n\nRejection means a better opportunity awaits you elsewhere.\n\nYour thoughts?",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "assets/postImage4.jpeg",
        likes: "800"
    ),
    UserPostModel(
        name: "Arslan nasir",
        profileUrl: "assets/profileImage6.jpeg",
        headline: "MEAN Stack Developer | Freelancer",
        tags: "#independenceday2020",
        description: "Without the sweat, toil and sacrifices of our heroes, we wouldn’t have this bright day that we celebrate today. Happy Independence Day.",
        isVideoPost: false,
        comments: "1k",
        video: "",
        isOnline: true,
        image: "assets/postImage6.jpeg",
        likes: "20k"
    ),
    UserPostModel(
        name: "Mohsin Ali",
        profileUrl: "assets/profileImage3.jpeg",
        headline: "Logo Designer | Freelancer |",
        tags: "#datascience #machinelearning #programming #python #joke",
        description: "Google, Stack Overflow are your saviors :)",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: true,
        image: "assets/postImage3.jpeg",
        likes: "230"
    ),
    UserPostModel(
        name: "Sahar Salimi",
        profileUrl: "assets/profileImage2.jpeg",
        headline: "LOGO DESIGN 🔹3D LOGO ANIMATION 🔹 DRAW CARTOON 🔹 BUSINESS CARD 🔹 PENCIL SKETCH 🔹 FLYER DESIGN 🔹 BROCHURE DESIGN 🔹",
        tags: "#Respect #SadioMane #PayBack #Love",
        description: "Rate my art work",
        isVideoPost: false,
        comments: "500",
        video: "",
        isOnline: false,
        image: "assets/postImage2.jpeg",
        likes: "10k"
    ),
    UserPostModel(
        name: "Ali Raza",
        profileUrl: "assets/profileImage1.jpeg",
        headline: "Creative Content Writer | Content Specialist | Storyteller ",
        tags: "#Respect #SadioMane #PayBack #Love",
        description: "The world famous football player Sadio Mane of Senegal (West Africa), whose income in Indian rupees is around Rs. 1 crore 40 lacs per week, was seen in many places with a broken mobile phone. In an interview when asked about it, he said, I'll get it fixed. When asked, Why you are not buying a new one? He said, I could buy thousands of it, 10s Ferraris, couple of Jet Planes, Diamond watches that I can buy, but why do I need all of these? I saw poverty, so I couldn't learn, I built schools so that people could learn, I didn't have shoes, I played without shoes, I didn't have good clothes, I didn't have food. I have so much today that I want to share it with my people instead of showing off.Huge respect for him! We all must spend atleast some portion of our excess incomes in people who are deserving and can't even buy necessities.",
        isVideoPost: false,
        comments: "400",
        video: "videos/flutterIntro.mp4",
        isOnline: false,
        image: "assets/postImage1.jpeg",
        likes: "1.1k"
    ),
    UserPostModel(
        name: "Flutter World",
        profileUrl: "assets/flutter_logo.png",
        headline: "Flutter Open Projects | Flutter Drat world",
        tags: "#FlutterOpenProject, #FlutterMagicWorld, #Mobile&WebOpenApps, #Flutter+Dart❤️",
        description: "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia.",
        isVideoPost: false,
        comments: "20k",
        video: "videos/flutterIntro.mp4",
        isOnline: true,
        image: "assets/flutter_post.jpeg",
        likes: "101k"
    ),
    UserPostModel(
        name: "Amazon Web Service (AWS)",
        profileUrl: "assets/profileImage5.png",
        headline: "4,594,488 followers",
        tags: "",
        description: "Better protect your S3 data with expanded Amazon GuardDuty threat detection to monitor for suspicious data access & other threats:",
        isVideoPost: false,
        comments: "400",
        video: "",
        isOnline: false,
        image: "assets/postImage5.jpeg",
        likes: "1k"
    ),
  ];
  static final userProfile = UserModel(
      headline: "Android & IOS Mobile Application flutter developer | Freelancer",
      profileUrl: "assets/profile.jpg",
      name: "Amir Khan",
      connections: "1,837",
      viewProfile: "300"
  );

  static final List<GroupModel> recentData = [
    GroupModel("Recent",[
      GroupModel("World Wide Flutter"),
      GroupModel("Flutter Developer Community"),
      GroupModel("Flutter Open Projects"),
      GroupModel("Firebase flutter"),
    ]),
    GroupModel("Groups",[
      GroupModel("World Wide Flutter"),
      GroupModel("Flutter Developer Community"),
      GroupModel("Flutter Open Projects"),
      GroupModel("Firebase flutter"),
    ]),
  ];

  static final List<CompanyModel> companyListData=[
    CompanyModel(
      name: "Pakistan Jobs",
      description: "We help to Build Your Career",
      profileUrl: "",
    ),
    CompanyModel(
      name: "Upwork",
      description: "company * internet ",
      profileUrl: "assets/icons/upwork.png",
    ),
    CompanyModel(
      name: "Flutter + Dart",
      description: "Open projects Contribution",
      profileUrl: "assets/icons/flutter_logo.jpeg",
    ),
  ];
}