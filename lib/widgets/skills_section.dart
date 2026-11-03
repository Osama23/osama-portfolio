import 'package:flutter/material.dart';
import 'package:osama_portfolio/data/profile.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 800;
    return ColoredBox(
      color: AppColors.paper,
      child: ContentFrame(
        top: wide ? 36 : 28,
        bottom: wide ? 28 : 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              index: '02',
              title: 'Skills',
              subtitle: 'State management, architecture, and the delivery tools around them.',
            ),
            const SizedBox(height: 20),
            DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.line)),
              ),
              child: Column(
                children: [
                  for (final group in Profile.skills)
                    _SkillRow(group: group, wide: wide),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  const _SkillRow({required this.group, required this.wide});

  final SkillGroup group;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      group.title,
      style: AppType.ui(16, weight: FontWeight.w700),
    );
    final chips = Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [for (final item in group.items) SkillChip(item)],
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line)),
      ),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 200, child: label),
                const SizedBox(width: 24),
                Expanded(child: chips),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [label, const SizedBox(height: 12), chips],
            ),
    );
  }
}
