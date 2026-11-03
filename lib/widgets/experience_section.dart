import 'package:flutter/material.dart';
import 'package:osama_portfolio/data/profile.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';
import 'package:osama_portfolio/utils/links.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final desk = MediaQuery.sizeOf(context).width >= 900;
    return ColoredBox(
      color: AppColors.paper,
      child: ContentFrame(
        top: desk ? 88 : 64,
        bottom: 28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              index: '01',
              title: 'Work',
              subtitle: 'Product work for companies in Saudi Arabia, Egypt, and Canada.',
            ),
            const SizedBox(height: 40),
            for (final role in Profile.roles) _RoleTile(role: role, desk: desk),
          ],
        ),
      ),
    );
  }
}

class _RoleTile extends StatelessWidget {
  const _RoleTile({required this.role, required this.desk});

  final Role role;
  final bool desk;

  @override
  Widget build(BuildContext context) {
    final period = Text(
      role.period,
      style: AppType.ui(
        14,
        weight: FontWeight.w700,
        color: role.current ? AppColors.brass : AppColors.mute,
      ),
    );
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role.company,
          style: AppType.display(desk ? 36 : 30, letterSpacing: -0.5),
        ),
        const SizedBox(height: 8),
        Text(role.location, style: AppType.ui(14, color: AppColors.mute)),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(role.summary, style: AppType.body(16)),
        ),
        if (role.products.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final product in role.products)
                SkillChip(
                  product.label,
                  onPressed: product.url == null
                      ? null
                      : () => openExternal(context, product.url!),
                ),
            ],
          ),
        ],
      ],
    );

    if (!desk) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 28),
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: AppColors.lineStrong)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [period, const SizedBox(height: 10), details],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 180,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: period,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(22, 0, 0, 36),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.lineStrong)),
              ),
              child: details,
            ),
          ),
        ],
      ),
    );
  }
}
