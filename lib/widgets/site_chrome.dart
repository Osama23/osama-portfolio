import 'package:flutter/material.dart';
import 'package:osama_portfolio/theme/portfolio_theme.dart';

class NavDestination {
  const NavDestination({
    required this.index,
    required this.id,
    required this.label,
    required this.sectionKey,
  });

  final String index;
  final String id;
  final String label;
  final GlobalKey sectionKey;
}

class ContentFrame extends StatelessWidget {
  const ContentFrame({
    super.key,
    required this.child,
    this.top = 0,
    this.bottom = 0,
    this.alignment = Alignment.topCenter,
  });

  final Widget child;
  final double top;
  final double bottom;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Align(
      alignment: alignment,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: PortfolioWidth.frame),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            PortfolioWidth.page(width),
            top,
            PortfolioWidth.page(width),
            bottom,
          ),
          child: SizedBox(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
  });

  final String index;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 760;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index,
          style: AppType.ui(
            13,
            color: AppColors.brass,
            weight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 10),
        Text(title, style: AppType.display(wide ? 56 : 40)),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            subtitle,
            style: AppType.body(17, color: AppColors.mute, height: 1.5),
          ),
        ),
      ],
    );
  }
}

class PortfolioButton extends StatelessWidget {
  const PortfolioButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.filled = true,
    this.onDark = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool filled;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final foreground = filled
        ? (onDark ? AppColors.ink : AppColors.cream)
        : (onDark ? AppColors.cream : AppColors.ink);
    final background = filled
        ? (onDark ? AppColors.brassFill : AppColors.ink)
        : Colors.transparent;
    final borderColor = filled
        ? background
        : (onDark ? AppColors.creamMute : AppColors.ink);

    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(foreground),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          final hovered =
              states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.pressed) ||
              states.contains(WidgetState.focused);
          if (!hovered) return background;
          if (filled) {
            return Color.alphaBlend(
              Colors.black.withValues(alpha: 0.08),
              background,
            );
          }
          return (onDark ? AppColors.cream : AppColors.ink).withValues(
            alpha: 0.08,
          );
        }),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        ),
        minimumSize: WidgetStateProperty.all(const Size(0, 48)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.chip),
            side: BorderSide(color: borderColor),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          AppType.ui(14, weight: FontWeight.w700, letterSpacing: 0.3),
        ),
      ),
      child: Text(label),
    );
  }
}

class SkillChip extends StatelessWidget {
  const SkillChip(this.label, {super.key, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = AppType.ui(13, weight: FontWeight.w600);
    final chip = DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        border: Border.all(color: AppColors.line),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(label, style: style),
      ),
    );
    if (onPressed == null) return chip;

    // The page sits inside a SelectionArea, which takes the click on web
    // unless this control opts out of selection. Button padding stays on the
    // chip so desktop visual density cannot shrink it.
    return SelectionContainer.disabled(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.ink),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            final hovered =
                states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.pressed);
            if (!hovered) return Colors.transparent;
            return AppColors.ink.withValues(alpha: 0.06);
          }),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          minimumSize: WidgetStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.chip),
            ),
          ),
          textStyle: WidgetStateProperty.all(style),
          mouseCursor: WidgetStateProperty.all(SystemMouseCursors.click),
        ),
        child: chip,
      ),
    );
  }
}

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({
    super.key,
    required this.destinations,
    required this.activeId,
    required this.menuOpen,
    required this.onBrand,
    required this.onSelect,
    required this.onMenu,
  });

  final List<NavDestination> destinations;
  final String? activeId;
  final bool menuOpen;
  final VoidCallback onBrand;
  final ValueChanged<String> onSelect;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final wide = PortfolioWidth.showsNav(MediaQuery.sizeOf(context).width);
    return Material(
      color: AppColors.paper,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ColoredBox(
            color: AppColors.brass,
            child: SizedBox(height: 3, width: double.infinity),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.line)),
            ),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                height: 64,
                child: ContentFrame(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      _BrandButton(onPressed: onBrand),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Osama Abdelaziz',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppType.ui(15, weight: FontWeight.w700),
                        ),
                      ),
                      if (wide)
                        for (final item in destinations)
                          _NavButton(
                            label: item.label,
                            active: item.id == activeId,
                            onPressed: () => onSelect(item.id),
                          )
                      else
                        Semantics(
                          button: true,
                          label: menuOpen ? 'Close menu' : 'Open menu',
                          child: IconButton(
                            onPressed: onMenu,
                            color: AppColors.ink,
                            icon: Icon(menuOpen ? Icons.close : Icons.menu),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioMenu extends StatelessWidget {
  const PortfolioMenu({
    super.key,
    required this.destinations,
    required this.activeId,
    required this.onSelect,
  });

  final List<NavDestination> destinations;
  final String? activeId;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.paper,
      elevation: 8,
      shadowColor: Colors.black26,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: ContentFrame(
          top: 8,
          bottom: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in destinations)
                TextButton(
                  onPressed: () => onSelect(item.id),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    minimumSize: const Size(double.infinity, 48),
                    alignment: Alignment.centerLeft,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: item.id == activeId
                        ? AppColors.brass
                        : AppColors.ink,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Text(
                          item.index,
                          style: AppType.ui(
                            13,
                            color: AppColors.brass,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppType.display(32, letterSpacing: -0.6),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandButton extends StatelessWidget {
  const _BrandButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.brass,
        minimumSize: const Size(40, 40),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.control),
          side: const BorderSide(color: AppColors.brass, width: 1.2),
        ),
      ),
      child: Text(
        'OA',
        style: AppType.ui(12, color: AppColors.brass, weight: FontWeight.w800),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.active,
    required this.onPressed,
  });

  final String label;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: active ? AppColors.brass : AppColors.ink,
        backgroundColor: active
            ? AppColors.brass.withValues(alpha: 0.1)
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        minimumSize: const Size(0, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
      ),
      child: Text(label, style: AppType.ui(14, weight: FontWeight.w700)),
    );
  }
}
