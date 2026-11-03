import 'package:flutter/material.dart';
import 'package:osama_portfolio/pages/portfolio_page.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osama Abdelaziz — Senior Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: PortfolioTheme.light(),
      home: const PortfolioPage(),
    );
  }
}
