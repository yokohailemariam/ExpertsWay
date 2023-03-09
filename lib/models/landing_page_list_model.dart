class HomepageList {
  final String title;
  final String imageUrl;
  final String icon;
  final String level;
  final String hours;
  final double rating;

  HomepageList({
    required this.title,
    required this.imageUrl,
    required this.icon,
    required this.level,
    required this.hours,
    required this.rating,
  });
}

final homepageListData = <HomepageList>[
  HomepageList(
    title: 'Complete JavaScript Course',
    imageUrl:
        'https://miro.medium.com/v2/resize:fit:1400/1*YQgaKfVzK-YpxyT3NYqJAg.png',
    icon: 'https://cdn-icons-png.flaticon.com/512/5968/5968292.png',
    level: 'Beginner',
    hours: '20hrs',
    rating: 4.9,
  ),
  HomepageList(
    title: 'An Introduction to Programming in Go',
    imageUrl: 'https://uploads.sololearn.com/uploads/courses/1164.png',
    icon:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1200px-Go_Logo_Blue.svg.png',
    level: 'Beginner',
    hours: '6.5hrs',
    rating: 4.9,
  ),
  HomepageList(
    title: 'C++ for Absolute Beginners',
    imageUrl:
        'https://miro.medium.com/v2/resize:fit:1024/1*SxQ9mqNjVUop7OpNyoUStg.png',
    icon: 'https://cdn-icons-png.flaticon.com/512/6132/6132222.png',
    level: 'Beginner',
    hours: '6.5hrs',
    rating: 4.9,
  ),
  HomepageList(
    title: 'Build Interactive Web Apps in React',
    imageUrl: 'https://www.cdmi.in/courses@2x/react-js-training-institute.jpg',
    icon:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png',
    level: 'Intermidiate',
    hours: '6.5hrs',
    rating: 4.9,
  ),
  HomepageList(
    title: 'C++ for Absolute Beginners',
    imageUrl:
        'https://miro.medium.com/v2/resize:fit:1024/1*SxQ9mqNjVUop7OpNyoUStg.png',
    icon: 'https://cdn-icons-png.flaticon.com/512/6132/6132222.png',
    level: 'Beginner',
    hours: '6.5hrs',
    rating: 4.9,
  ),
  HomepageList(
    title: 'Build Interactive Web Apps in React',
    imageUrl: 'https://www.cdmi.in/courses@2x/react-js-training-institute.jpg',
    icon:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png',
    level: 'Intermidiate',
    hours: '6.5hrs',
    rating: 4.9,
  ),
];
