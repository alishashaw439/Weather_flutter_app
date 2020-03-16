import 'package:clima/screens/city_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:clima/screens/location_screen.dart';

//void main() {

//  testWidgets('CityScreen has an icon button ', (WidgetTester tester) async {
//    await tester.pumpWidget(CityScreen());
//    var flat_button=find.byType(FlatButton(onPressed: Navigator.pop(), child: null));
//    expect(find.byType(FlatButton),findsOneWidget);



class MockNavigatorObserver extends Mock implements NavigatorObserver {}
  void main() {
    group('navigation tests', ()
    {
      MockNavigatorObserver mockObserver;
      setUp(() {
        mockObserver = MockNavigatorObserver();
      });

      Future<void> _navigate(WidgetTester tester) async {

        await tester.tap(find.byKey(popResultButtonKey));
        await tester.pumpAndSettle();
      }
      Future<void> _navigatepush(WidgetTester tester)async{
        await tester.tap(find.byKey(pushResultKey));
        await tester.pumpAndSettle();
      }
      testWidgets('city_screen_test',
              (WidgetTester tester) async {
            await tester.pumpWidget(
                MaterialApp(
                    home: CityScreen(),
                  navigatorObservers: [mockObserver],
                ));
            await _navigate(tester);


            final Route pushedRoute =
                verify(mockObserver.didPush(captureAny, any))
                    .captured
                    .single;

            String Result = await pushedRoute.popped;
            expect(Result, 'i am depressed');
          });

          testWidgets('location_screen_test',(WidgetTester tester)async{
            await tester.pumpWidget(
              MaterialApp(
                home:LocationScreen(),
                navigatorObservers: [mockObserver],

              ),);

            await _navigatepush(tester);

            verify(mockObserver.didPush(any, any));
//            String ass="hi";
//            print(ass);
            expect(find.byType(CityScreen), findsOneWidget);
        });
    });
  }













//expect(find.byType(RaisedButton), findsOneWidget);
//await tester.tap(find.byType(RaisedButton));
//await tester.pumpAndSettle();