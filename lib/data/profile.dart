class Product {
  const Product(this.label, {this.url});

  final String label;
  final String? url;
}

class Role {
  const Role({
    required this.company,
    required this.city,
    required this.location,
    required this.period,
    required this.summary,
    required this.current,
    this.products = const [],
  });

  final String company;
  final String city;
  final String location;
  final String period;
  final String summary;
  final bool current;
  final List<Product> products;
}

class SkillGroup {
  const SkillGroup({required this.title, required this.items});

  final String title;
  final List<String> items;
}

class Profile {
  const Profile._();

  static const name = 'Osama Abdelaziz';
  static const portraitAsset = 'assets/images/portrait.jpg';
  static const role = 'Senior Flutter Developer';
  static const location = 'Cairo, Egypt';
  static const email = 'osama.abdelaziz23@gmail.com';
  static const phoneDisplay = '+20 115 259 7274';
  static const phoneUri = 'tel:+201152597274';
  static const mailto = 'mailto:osama.abdelaziz23@gmail.com';
  static const linkedIn = 'https://www.linkedin.com/in/osamamahmoud23/';
  static const linkedInLabel = 'linkedin.com/in/osamamahmoud23';
  static const github = 'https://github.com/Osama23';
  static const githubLabel = 'github.com/Osama23';

  static const summary =
      'Senior Flutter Developer with 6+ years of experience building scalable, '
      'high-performance mobile applications for international companies in real '
      'estate, automotive, logistics, and enterprise systems.';

  static const focus = [
    'Real estate',
    'Travel',
    'Healthcare',
    'Automotive',
    'Logistics',
    'Enterprise',
  ];

  static const roles = [
    Role(
      company: 'SAK Real Estate',
      city: 'Riyadh',
      location: 'Riyadh, Saudi Arabia',
      period: 'Dec 2022 - Present',
      current: true,
      products: [
        Product(
          'Sak iOS',
          url: 'https://apps.apple.com/us/app/%D9%85%D9%86%D8%B5%D8%A9-%D8%B5%D9%83-%D8%A7%D9%84%D8%B9%D9%82%D8%A7%D8%B1%D9%8A%D8%A9/id1630137958',
        ),
        Product(
          'Sak Android',
          url: 'https://play.google.com/store/apps/details?id=com.getsak.sak',
        ),
        Product('SAK Dashboard'),
      ],
      summary:
          'Electronic platform for managing and documenting real estate '
          'transactions in Saudi Arabia, with digital tools for the sector '
          'aligned with Vision 2030.',
    ),
    Role(
      company: 'Happy Trip',
      city: 'Riyadh',
      location: 'Riyadh, Saudi Arabia',
      period: 'June 2025 - Present',
      current: true,
      products: [
        Product(
          'Happy Trip iOS',
          url: 'https://apps.apple.com/in/app/happy-trip/id1501353461',
        ),
      ],
      summary:
          'Travel platform for planning, booking, and managing trips across '
          'Saudi Arabia, built for residents and visitors.',
    ),
    Role(
      company: 'Axon',
      city: 'Cairo',
      location: 'Cairo, Egypt',
      period: 'June 2024 - May 2025',
      current: false,
      products: [
        Product(
          'Axon iOS',
          url: 'https://apps.apple.com/eg/app/axon/id1547799748',
        ),
        Product(
          'Axon Android',
          url: 'https://play.google.com/store/apps/details?id=com.heit.axon&hl=en',
        ),
      ],
      summary:
          'Wellness and healthcare-benefits platform that connects people in '
          'Egypt with medical and wellness providers.',
    ),
    Role(
      company: 'Autoly Co',
      city: 'Toronto',
      location: 'Toronto, Canada',
      period: 'Dec 2020 - Nov 2022',
      current: false,
      summary:
          'Automotive platform for buying, selling, owning, and maintaining '
          'vehicles, from listings and trades to maintenance alerts and repair '
          'services.',
    ),
    Role(
      company: 'NTG Clarity',
      city: 'Cairo',
      location: 'Cairo, Egypt',
      period: 'Apr 2019 - Nov 2020',
      current: false,
      summary:
          'Software engineering for telecom, enterprise, and digital '
          'transformation products as part of the NTG Clarity group.',
    ),
  ];

  static const skills = [
    SkillGroup(
      title: 'State management',
      items: ['Bloc', 'Provider', 'Riverpod'],
    ),
    SkillGroup(
      title: 'Architecture',
      items: ['Clean Architecture', 'MVVM', 'MVP', 'MVC'],
    ),
    SkillGroup(
      title: 'Engineering',
      items: ['OOP', 'SOLID', 'Design patterns', 'Clean code'],
    ),
    SkillGroup(
      title: 'Data and APIs',
      items: [
        'Firebase',
        'REST APIs',
        'GraphQL',
        'WebSockets',
        'Push notifications',
        'Testing',
      ],
    ),
    SkillGroup(
      title: 'Delivery',
      items: ['Shorebird', 'GitHub Actions', 'Fastlane', 'Codemagic', 'CI/CD'],
    ),
    SkillGroup(title: 'Version control', items: ['Git', 'GitHub']),
  ];

  static List<Role> get currentRoles =>
      roles.where((role) => role.current).toList(growable: false);
}
