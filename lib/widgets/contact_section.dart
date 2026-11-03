import 'package:flutter/material.dart';
import 'package:osama_portfolio/data/profile.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';
import 'package:osama_portfolio/utils/links.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 760;
    return ColoredBox(
      color: AppColors.ink,
      child: ContentFrame(
        top: wide ? 88 : 64,
        bottom: 28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '04',
              style: AppType.ui(
                13,
                color: AppColors.brassBright,
                weight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Contact',
              style: AppType.display(wide ? 56 : 40, color: AppColors.cream),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                'Cairo, Egypt. Email, phone, and the profiles I keep up to date.',
                style: AppType.body(
                  17,
                  color: AppColors.creamMute,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 28),
            DecoratedBox(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0x22F6F1E8))),
              ),
              child: Column(
                children: [
                  _ContactLink(
                    label: 'Email',
                    value: Profile.email,
                    onTap: () => openExternal(context, Profile.mailto),
                  ),
                  _ContactLink(
                    label: 'Phone',
                    value: Profile.phoneDisplay,
                    onTap: () => openExternal(context, Profile.phoneUri),
                  ),
                  _ContactLink(
                    label: 'GitHub',
                    value: Profile.githubLabel,
                    onTap: () => openExternal(context, Profile.github),
                  ),
                  _ContactLink(
                    label: 'LinkedIn',
                    value: Profile.linkedInLabel,
                    onTap: () => openExternal(context, Profile.linkedIn),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Text(
              '© 2026 ${Profile.name}  ·  ${Profile.role}',
              style: AppType.ui(13, color: AppColors.creamMute),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 700;
    final labelStyle = AppType.ui(
      13,
      color: AppColors.brassBright,
      weight: FontWeight.w700,
      letterSpacing: 0.4,
    );
    final valueStyle = AppType.ui(
      wide ? 18 : 16,
      color: AppColors.cream,
      weight: FontWeight.w600,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Color(0x22F6F1E8))),
        ),
        child: wide
            ? Row(
                children: [
                  SizedBox(width: 110, child: Text(label, style: labelStyle)),
                  Expanded(child: Text(value, style: valueStyle)),
                  const Icon(
                    Icons.arrow_outward,
                    size: 18,
                    color: AppColors.creamMute,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: labelStyle),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(child: Text(value, style: valueStyle)),
                      const Icon(
                        Icons.arrow_outward,
                        size: 18,
                        color: AppColors.creamMute,
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
