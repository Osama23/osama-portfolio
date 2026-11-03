import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osama_portfolio/widgets/background_section.dart';
import 'package:osama_portfolio/widgets/contact_section.dart';
import 'package:osama_portfolio/widgets/experience_section.dart';
import 'package:osama_portfolio/widgets/hero_section.dart';
import 'package:osama_portfolio/widgets/site_chrome.dart';
import 'package:osama_portfolio/widgets/skills_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scroll = ScrollController();
  final _items = [
    NavDestination(
      index: '01',
      id: 'work',
      label: 'Work',
      sectionKey: GlobalKey(),
    ),
    NavDestination(
      index: '02',
      id: 'skills',
      label: 'Skills',
      sectionKey: GlobalKey(),
    ),
    NavDestination(
      index: '03',
      id: 'background',
      label: 'Background',
      sectionKey: GlobalKey(),
    ),
    NavDestination(
      index: '04',
      id: 'contact',
      label: 'Contact',
      sectionKey: GlobalKey(),
    ),
  ];

  String? _activeId;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    final next = _sectionAtTop();
    if (next != _activeId && mounted) {
      setState(() => _activeId = next);
    }
  }

  String? _sectionAtTop() {
    String? active;
    for (final item in _items) {
      final box =
          item.sectionKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.attached || !box.hasSize) continue;
      if (box.localToGlobal(Offset.zero).dy <= 150) active = item.id;
    }
    return active;
  }

  Future<void> _openSection(String id) async {
    setState(() => _menuOpen = false);
    final item = _items.firstWhere((entry) => entry.id == id);
    final target = item.sectionKey.currentContext;
    if (target == null) return;
    await Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 640),
      curve: Curves.easeOutCubic,
      alignment: 0.02,
    );
  }

  void _scrollToTop() {
    setState(() => _menuOpen = false);
    _scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 640),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 920;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: const Color(0xFF14110E),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF14110E),
        body: Column(
          children: [
            PortfolioHeader(
              destinations: _items,
              activeId: _activeId,
              menuOpen: _menuOpen,
              onBrand: _scrollToTop,
              onSelect: _openSection,
              onMenu: () => setState(() => _menuOpen = !_menuOpen),
            ),
            Expanded(
              child: Stack(
                children: [
                  Scrollbar(
                    controller: _scroll,
                    thumbVisibility: wide,
                    child: SelectionArea(
                      child: SingleChildScrollView(
                        controller: _scroll,
                        primary: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const HeroSection(),
                            const IndustriesStrip(),
                            ExperienceSection(key: _items[0].sectionKey),
                            SkillsSection(key: _items[1].sectionKey),
                            BackgroundSection(key: _items[2].sectionKey),
                            ContactSection(key: _items[3].sectionKey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_menuOpen && !wide) ...[
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => setState(() => _menuOpen = false),
                        child: const ColoredBox(color: Color(0x6614110E)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: PortfolioMenu(
                        destinations: _items,
                        activeId: _activeId,
                        onSelect: _openSection,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
