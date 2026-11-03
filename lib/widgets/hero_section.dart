import 'package:flutter/material.dart';
import 'package:osama_portfolio/data/profile.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';
import 'package:osama_portfolio/utils/links.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final wide = width >= 1040;
    final nameSize = wide ? 88.0 : (width >= 760 ? 68.0 : 48.0);

    final header = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Profile.location.toUpperCase(),
          style: AppType.ui(
            12,
            color: AppColors.brassBright,
            weight: FontWeight.w700,
            letterSpacing: 1.8,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Osama',
          style: AppType.display(
            nameSize,
            color: AppColors.cream,
            letterSpacing: -1.5,
          ),
        ),
        Text(
          'Abdelaziz',
          style: AppType.display(
            nameSize,
            color: AppColors.cream,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          Profile.role,
          style: AppType.ui(
            wide ? 18 : 16,
            color: AppColors.brassBright,
            weight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'iOS, Android, and dashboard products',
          style: AppType.body(15, color: AppColors.creamMute, height: 1.4),
        ),
      ],
    );

    return ContentFrame(
      top: wide ? 36 : 28,
      bottom: wide ? 40 : 36,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header,
                      const SizedBox(height: 28),
                      const _Summary(),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                const Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(width: 460, child: _PortraitColumn()),
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: header),
                    const SizedBox(width: 16),
                    const SizedBox(width: 188, child: _Portrait()),
                  ],
                ),
                const SizedBox(height: 24),
                const _Summary(),
                const SizedBox(height: 24),
                const _NowLedger(),
              ],
            ),
          const SizedBox(height: 28),
          const _Stats(),
        ],
      ),
    );
  }
}

class _PortraitColumn extends StatelessWidget {
  const _PortraitColumn();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_Portrait(), SizedBox(height: 16), _NowLedger()],
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Portrait of Osama Abdelaziz',
      image: true,
      container: true,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            const Positioned.fill(
              child: Padding(
                padding: EdgeInsets.only(top: 14, left: 14),
                child: ColoredBox(color: AppColors.brassBright),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(right: 14, bottom: 14),
                child: ColoredBox(
                  color: AppColors.paper,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      Profile.portraitAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return ColoredBox(
                          color: AppColors.paper,
                          child: Center(
                            child: Text(
                              'OA',
                              style: AppType.display(
                                42,
                                color: AppColors.brass,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Profile.summary,
          style: AppType.body(17, color: AppColors.cream, height: 1.6),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            PortfolioButton(
              label: 'Email',
              onDark: true,
              onPressed: () => openExternal(context, Profile.mailto),
            ),
            PortfolioButton(
              label: 'GitHub',
              filled: false,
              onDark: true,
              onPressed: () => openExternal(context, Profile.github),
            ),
            PortfolioButton(
              label: 'LinkedIn',
              filled: false,
              onDark: true,
              onPressed: () => openExternal(context, Profile.linkedIn),
            ),
          ],
        ),
      ],
    );
  }
}

class _NowLedger extends StatelessWidget {
  const _NowLedger();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.inkRaised,
        border: Border.all(color: const Color(0x22F6F1E8)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NOW',
              style: AppType.ui(
                12,
                color: AppColors.brassBright,
                weight: FontWeight.w700,
                letterSpacing: 1.6,
              ),
            ),
            const SizedBox(height: 8),
            for (final role in Profile.currentRoles)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Color(0x22F6F1E8))),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            role.company,
                            style: AppType.ui(
                              16,
                              color: AppColors.cream,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          role.city,
                          style: AppType.ui(14, color: AppColors.creamMute),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      role.products
                          .map((product) => product.label)
                          .join('  ·  '),
                      style: AppType.body(
                        14,
                        color: AppColors.creamMute,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0x22F6F1E8))),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 22),
        child: Row(
          children: [
            Expanded(
              child: _Stat(value: '6+', label: 'Years'),
            ),
            _StatRule(),
            Expanded(
              child: _Stat(value: '5', label: 'Companies'),
            ),
            _StatRule(),
            Expanded(
              child: _Stat(value: '3', label: 'Countries'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 760;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: AppType.display(wide ? 40 : 30, color: AppColors.cream),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: AppType.ui(
            13,
            color: AppColors.creamMute,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _StatRule extends StatelessWidget {
  const _StatRule();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: const Color(0x22F6F1E8),
    );
  }
}

class IndustriesStrip extends StatelessWidget {
  const IndustriesStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.paper,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: ContentFrame(
          top: 18,
          bottom: 18,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              _FocusLabel('Real estate'),
              _FocusDot(),
              _FocusLabel('Travel'),
              _FocusDot(),
              _FocusLabel('Healthcare'),
              _FocusDot(),
              _FocusLabel('Automotive'),
              _FocusDot(),
              _FocusLabel('Logistics'),
              _FocusDot(),
              _FocusLabel('Enterprise'),
            ],
          ),
        ),
      ),
    );
  }
}

class _FocusLabel extends StatelessWidget {
  const _FocusLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: AppType.ui(13, weight: FontWeight.w700));
  }
}

class _FocusDot extends StatelessWidget {
  const _FocusDot();

  @override
  Widget build(BuildContext context) {
    return Text(
      '·',
      style: AppType.ui(13, color: AppColors.brass, weight: FontWeight.w700),
    );
  }
}
