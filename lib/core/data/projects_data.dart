import 'model/project.dart';

final List<Project> projects = [
  Project(
      title: '_Reply',
      projectIconResource: 'images/reply_app_icon.png',
      shortDescription:
      'Easily send your own custom, pre-defined messages through any platform',
      longDescription: 'This is a rebuild of my previous app “Reply” that I built using Flutter to make it available on both iOS and Android.\n\nI learned how to properly manage app state, sign in users with Apple, implement an observer pattern, publish an app to the Apple App Store, and implement MVVM architecture in a Flutter application.\n\nThis project shows that I am able to build complete apps for iOS as well as Android.',
      googlePlayStoreLink:
      'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply_flutter',
  appleAppStoreLink: 'https://apps.apple.com/us/app/id1522893504',
  dateLaunched: 'July 2020'),
  Project(
      title: 'Reply',
      projectIconResource: 'images/reply_app_icon.png',
      shortDescription:
      'Easily send your own custom, pre-defined messages through any platform',
      longDescription: 'This was my first experience implementing a remote database in an Android application and using Firebase products. In addition to learning how to implement Cloud Firestore with Architecture Components and MVVM architecture, I learned how to authenticate users with Firebase, sign in and sign out users, implement complex navigation flows using the Navigation component, and how to publish an app to the Google Play Store.\n\nI built this app because it solves a personal pain point- retyping the same message and having to copy and paste the same message to each platform I want to post it to.\n\nIt also showcases my mobile app development skills: I am able to develop entire Android apps on my own from the initial idea to publishing the completed app, implementing the UI, functionalities, logic, app architecture, database, and user experience along the way.',
  dateLaunched: 'May 2020', googlePlayStoreLink: 'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply'),
  Project(
      title: 'Torch',
      projectIconResource: 'images/torch_app_icon.png',
      shortDescription:
      'Discover and stay focused on what is most important to you',
      longDescription: 'From building this app, I learned more about working with data in Cloud Firestore, nested navigation flows, and building an app using clean architecture.\n\nI created this app to help me focus on the most important thing in my life. There are plenty of goal-tracking apps, but they allow you to set multiple goals, which can be distract you from your most important. I was intentional when designing Torch to only allow one overarching goal to be set at a time and focus on progressing each day rather than achieving a specific outcome.',
  dateLaunched: 'May 2020',
  googlePlayStoreLink: 'https://play.google.com/store/apps/details?id=dev.ashtonjones.torch'),
];