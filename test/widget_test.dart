import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:osama_portfolio/data/profile.dart';
import 'package:osama_portfolio/main.dart';

void main() {
  testWidgets('desktop portfolio shows the portrait and opens contact', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Osama'), findsOneWidget);
    expect(find.text('Abdelaziz'), findsOneWidget);
    expect(find.text('SAK Real Estate'), findsWidgets);
    expect(find.text('Happy Trip'), findsWidgets);
    expect(
      find.bySemanticsLabel('Portrait of Osama Abdelaziz'),
      findsOneWidget,
    );

    await tester.tap(find.widgetWithText(TextButton, 'Contact'));
    await tester.pumpAndSettle();

    expect(find.text(Profile.email), findsOneWidget);
    expect(find.text('Zagazig University'), findsOneWidget);
  });

  testWidgets('narrow layout opens the section menu', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const PortfolioApp());

    await tester.tap(find.bySemanticsLabel('Open menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(TextButton, 'Work'));
    await tester.pumpAndSettle();

    expect(find.text('NTG Clarity'), findsOneWidget);
  });
}
