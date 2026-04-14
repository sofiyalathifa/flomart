import 'package:flutter_test/flutter_test.dart';

import 'package:flomart/main.dart';

void main() {
  testWidgets('Flomart home renders key sections', (WidgetTester tester) async {
    await tester.pumpWidget(const FlomartApp());

    expect(find.text('Belanja Berdasarkan Kategori'), findsOneWidget);
    expect(find.text('Rekomendasi Benih Berkualitas'), findsOneWidget);
    expect(find.text('Pilihan Benih Terbaik'), findsOneWidget);
  });
}
