import 'model/project.dart';

final List<Project> projects = [
  Project(
      title: 'Ashton Jones\' Medium Feed',
      projectGIFResource: 'images/ashton_jones_medium_feed_demo.gif',
      shortDescription: 'A Flutter app containing an RSS feed of my Medium articles',
      longDescription: 'I decided to experiment with Medium\'s RSS feed, because it would make creating an MVP for a Flutter app I am working on effortless. I learned how to access data from an RSS feed, parse RSS feed data, and extract data from a feed and display it in an application',
      dateLaunched: 'January 2021',
      technologiesUsed: ['flutter', 'dart', 'material design'],
      githubLink: 'https://github.com/ashtonjonesdev/ashton_jones_medium_feed',
      projectIconResource: 'images/ashton_jones_medium_feed_app_icon.png'
  ),
  Project(
      title: 'Favorite Countries',
      projectGIFResource: 'images/favorite_countries.gif',
      shortDescription: 'Android app to keep track of your favorite countries and what you like about them',
      longDescription: 'I decided to build a travel app to help me keep a list of countries I would like to visit and why. I learned how to build native Android apps using Kotlin, implement search within an app, how to implement Java/Kotlin interoperability, and how to implement dynamic theme support to automatically switch between light and dark mode based on the device setting.',
      dateLaunched: 'October 2020',
      technologiesUsed: ['android sdk', 'kotlin', 'material design'],
      githubLink: 'https://github.com/ashtonjonesdev/favorite_countries',
      projectIconResource: 'images/favorite_countries_icon.png'
  ),
  Project(
      title: 'SpikeChat',
      projectGIFResource: 'images/spikechat_demo.gif',
      shortDescription: 'A fully functional chat application built with Flutter and Stream!',
      longDescription: 'I found out about Stream\'s chat API and wanted to experiment with it. I decided to build a Spikeball group chat application for me and my friends to plan times to play Spikeball. I learned how to implement authentication in Flutter without using Firebase, how to implement shared preferences in Flutter, how to speed up iOS build times, and how to use regular expressions to validate text input.',
      dateLaunched: 'September 2020',
      technologiesUsed: ['flutter', 'dart', 'flutter sdk', 'stream sdk', 'material design'],
      githubLink: 'https://github.com/ashtonjonesdev/spike_chat',
      projectIconResource: 'images/spike_chat_logo.png'
  ),
  Project(
    title: 'Portfolio Website',
    projectGIFResource: 'images/ashton_jones_dev_website.gif',
    shortDescription: 'My portfolio website- this site!',
    longDescription: 'I built my portfolio website using Flutter for Web. I learned how to build for the Web using Flutter, make UI elements flexible to adapt to different screen sizes, resize images and provide consistent dimensions, and implement complex Flare animations. You can find the project here',
    dateLaunched: 'August 2020',
    technologiesUsed: ['flutter', 'dart', 'flutter sdk', 'flare', 'material design'],
    githubLink: 'https://github.com/ashtonjonesdev/ashton_jones_dev_website',
    projectIconResource: 'images/ash.png'
  ),
  Project(
      title: '_Reply',
      projectIconResource: 'images/reply_app_icon.png',
      shortDescription:
      'Easily send your own custom, pre-defined messages through any platform',
      longDescription: 'This is a rebuild of my previous app “Reply” that I built using Flutter to make it available on both iOS and Android. I learned how to properly manage app state, sign in users with Apple, implement an observer pattern, publish an app to the Apple App Store, and implement MVVM architecture in a Flutter application. This project shows that I am able to build complete apps for iOS as well as Android.',
      googlePlayStoreLink:
      'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply_flutter',
  appleAppStoreLink: 'https://apps.apple.com/us/app/id1522893504',
  githubLink: 'https://github.com/ashtonjonesdev/reply_flutter',
  dateLaunched: 'July 2020', projectGIFResource: 'images/_replyDemo.gif', technologiesUsed: ['flutter', 'dart', 'fluttersdk', 'provider', 'cloud firestore', 'firebase authentication', 'mvvm architecture', 'material design'
  ]),
  Project(
      title: 'Reply',
      projectIconResource: 'images/reply_app_icon.png',
      shortDescription:
      'Easily send your own custom, pre-defined messages through any platform',
      longDescription: 'This was my first experience implementing a remote database in an Android application and using Firebase products. In addition to learning how to implement Cloud Firestore with Architecture Components and MVVM architecture, I learned how to authenticate users with Firebase, sign in and sign out users, implement complex navigation flows using the Navigation component, and how to publish an app to the Google Play Store.\n\nI built this app because it solves a personal pain point- retyping the same message and having to copy and paste the same message to each platform I want to post it to.\n\nIt also showcases my mobile app development skills: I am able to develop entire Android apps on my own from the initial idea to publishing the completed app, implementing the UI, functionalities, logic, app architecture, database, and user experience along the way.',
  dateLaunched: 'May 2020', googlePlayStoreLink: 'https://play.google.com/store/apps/details?id=dev.ashtonjones.reply', githubLink: 'https://github.com/ashtonjonesdev/Reply', projectGIFResource: 'images/reply.gif', technologiesUsed: ['java', 'androidsdk', 'android architecture components', 'firebase authentication', 'cloud firestore', 'mvvm architecture', 'material design']),
  Project(
      title: 'Torch',
      projectIconResource: 'images/torch_app_icon.png',
      shortDescription:
      'Discover and stay focused on what is most important to you',
      longDescription: 'From building this app, I learned more about working with data in Cloud Firestore, nested navigation flows, and building an app using clean architecture.\n\nI created this app to help me focus on the most important thing in my life. There are plenty of goal-tracking apps, but they allow you to set multiple goals, which can be distract you from your most important. I was intentional when designing Torch to only allow one overarching goal to be set at a time and focus on progressing each day rather than achieving a specific outcome.',
  dateLaunched: 'May 2020',
  googlePlayStoreLink: 'https://play.google.com/store/apps/details?id=dev.ashtonjones.torch', githubLink: 'https://github.com/ashtonjonesdev/Torch', projectGIFResource: 'images/torchdemo.gif', technologiesUsed: ['java', 'androidsdk', 'android architecture components', 'firebase authentication', 'cloud firestore', 'mvvm architecture', 'material design']),
];