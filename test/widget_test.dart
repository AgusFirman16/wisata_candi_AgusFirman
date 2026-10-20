import 'package:flutter_test/flutter_test.dart';

import 'package:wisata_agus/main.dart';

void main() {
  testWidgets('Wisata candi app shows profile information', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pengguna'), findsOneWidget);
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
