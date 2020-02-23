import 'package:flutter/material.dart';
import 'story_brain.dart';

//TODO: Step 15 - 앱을 실행하고 첫 번째 스토리에서 화면이 업데이트되는지 확인할 수 있다.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//TODO: Step 9 - StoryBrain 클래스에서 새 storyBrain 객체를 만들고 story_brain.dart 파일 import 해라
StoryBrain storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO: Step 1 - 컨테이너 위젯 안에 백그라운드 이미지를 넣어라
        decoration: BoxDecoration(
          //컨테이너의 배경을 채움
          image: DecorationImage(
            image: AssetImage('images/background.png'), //이미지 불러오기
            fit: BoxFit.cover, //이미지 비율은 유지하면서 디스플레이 커버 전체를 채움
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    //TODO: Step 10 - storyBrain을 사용하여 첫 번째 스토리 제목을 가져와서 이 텍스트 위젯에 표시해라
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    //TODO: Step 18 - storyBrain에서 nextStory () 메소드를 호출하고 사용자가 선택한대로 1을 전달하라
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    //TODO: Step 13 - storyBrain을 사용하여 choice1을 선택하라
                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Flutter Visibility 위젯을 사용하여이 FlatButton을 래핑하라
                //TODO: Step 28 - Visibility Widget의 "visible"특성을 storyBrain의 buttonShouldBeVisible () 메소드 출력과 동일하게 설정하라
                child: Visibility(
                  //Visibility 위젯은 하위 자식 위젯을 보여줄건지 숨길건지 여부를 제어함
                  //이것이 true로 설정되면, 가시성 위젯의 하위가 표시되고, 거짓이면 화면에서 하위 위젯이 제거됨
                  visible: storyBrain
                      .buttonShouldBeVisible(), //이로써 질문의 끝에서 두번째 파랑 버튼이 사라짐
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      //TODO: Step 19 - storyBrain에서 nextStory () 메소드를 호출하고 사용자가 선택한 2를 숫자로 전달하라
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      //TODO: Step 14 - storyBrain을 사용하여 choice2를 선택하라
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - 앱을 실행하고 선택 버튼을 눌렀을 때 스토리를 변경하기 위해 이 파일에 추가해야하는 코드를 찾아보라
//setState(() {}); 메서드 안에 넣어야지!

//TODO: Step 29 - WOW! 앱을 실행하고 스토리 아웃 라인에 대해 테스트하여 모든 단계를 완료했는지 확인하라
