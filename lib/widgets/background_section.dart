import 'package:flutter/material.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';

class BackgroundSection extends StatelessWidget {
  const BackgroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 800;
    const education = _InfoPanel(
      label: 'Education',
      title: 'Faculty of Computers & Informatics',
      detail: 'Zagazig University',
    );
    const languages = _LanguagePanel();

    return ColoredBox(
      color: AppColors.cream,
      child: ContentFrame(
        top: wide ? 80 : 56,
        bottom: wide ? 88 : 64,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              index: '03',
              title: 'Background',
              subtitle: 'Where I studied, and the languages I work in.',
            ),
            const SizedBox(height: 36),
            if (wide)
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: education),
                  SizedBox(width: 20),
                  Expanded(child: languages),
                ],
              )
            else
              const Column(
                children: [education, SizedBox(height: 16), languages],
              ),
          ],
        ),
      ),
    );
  }
}

class _InfoPanel extends StatelessWidget {
  const _InfoPanel({
    required this.label,
    required this.title,
    required this.detail,
  });

  final String label;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border.fromBorderSide(BorderSide(color: AppColors.line)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: AppType.ui(
                12,
                color: AppColors.brass,
                weight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppType.display(28, height: 1.15, letterSpacing: -0.4),
            ),
            const SizedBox(height: 8),
            Text(detail, style: AppType.ui(15, color: AppColors.mute)),
          ],
        ),
      ),
    );
  }
}

class _LanguagePanel extends StatelessWidget {
  const _LanguagePanel();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.paper,
        border: Border.fromBorderSide(BorderSide(color: AppColors.line)),
      ),
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PanelLabel('Languages'),
            SizedBox(height: 8),
            _LanguageLine(name: 'Arabic', level: 'Native'),
            _LanguageLine(name: 'English', level: 'Fluent'),
          ],
        ),
      ),
    );
  }
}

class _PanelLabel extends StatelessWidget {
  const _PanelLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: AppType.ui(
        12,
        color: AppColors.brass,
        weight: FontWeight.w700,
        letterSpacing: 1.4,
      ),
    );
  }
}

class _LanguageLine extends StatelessWidget {
  const _LanguageLine({required this.name, required this.level});

  final String name;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: AppType.display(28, letterSpacing: -0.4)),
          ),
          Text(
            level,
            style: AppType.ui(
              15,
              color: AppColors.mute,
              weight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
