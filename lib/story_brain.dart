//TODO: Step 6 - story.dart 파일을 import 해라
import 'story.dart';
//TODO: Step 5 - StoryBrain 클래스를 만들어라

class StoryBrain {
  //TODO: Step 7 - StoryBrain에서 storyData를 개인 속성으로 포함하도록 아래 행의 주석을 없애라
  //TODO: Step 7-1 - 이때, storyData는 이름이 정의되어 있으니 story.dart에 있는 Story 클래스의 생성자는 명명 매개변수로 {} 중괄호를 인자값에 씌워줘야한다
  List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  //TODO: Step 8 - _storyData에서 첫 번째 storyTitle을 리턴하는 getStory () 메소드를 작성하라
  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  //TODO: Step 11 - _storyData에서 첫 번째 choice1에 대한 텍스트를 리턴하는 getChoice1 () 메소드를 작성하라
  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  //TODO: Step 12 - _storyData에서 첫 번째 choice2에 대한 텍스트를 리턴하는 getChoice2 () 메소드를 작성하라
  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  //TODO: Step 16 - 값 0으로 시작하는 storyNumber라는 특성을 작성하라. 사용자가 현재보고있는 스토리를 추적하는 데 사용된다
  int _storyNumber = 0;

//TODO: Step 23 - getStory (), getChoice1 () 및 getChoice2 () 내부에서 storyNumber 특성을 사용하여 항상 첫 번째 (0) 항목이 아닌 업데이트 된 스토리 및 선택 사항을 가져와라
//_storyData[storyNumber].storyTitle; 요론식으로 불러주면 됨

//TODO: Step 25 - story_brain.dart 만 액세스 할 수 있도록 storyNumber 특성을 개인 특성으로 변경하라. 이름 (storyNumber)을 마우스 오른쪽 단추로 클릭하고 리 팩터-> 이름 바꾸기를 선택하여 사용 된 모든 위치에서 변경하라

  //TODO: Step 17 - nextStory()라는 메소드를 작성하라. 출력이 없어야하지만 사용자가 선택한 번호가(int) 되는 1개의 입력이 있어야 한다.
  //TODO: Step 20 - 스토리 계획을 여기서 다운로드해라 : https://drive.google.com/uc?export=download&id=1KU6EghkO9Hf2hRM0756xFHgNaZyGCou3
  //TODO: Step 21 - 스토리 계획을 사용하여 nextStory()를 업데이트하여 사용자가 선택한 내용에 따라 storyNumber를 변경하라. 예 : storyNumber가 0 인 경우 사용자가 choiceNumber1을 선택한 경우 storyNumber는 2가 되어야한다
  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    }
    //TODO: Step 22 - nextStory()에서 storyNumber가 3 또는 4 또는 5와 같으면 게임이 끝났음을 의미하며 storyNumber를 0으로 재설정하는 restart() 라는 메서드를 호출해야한다
    else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

//TODO: Step 27 - storyNumber가 0 또는 1 또는 2인지 (두 버튼 모두 선택 사항을 표시해야하는 경우) 확인하는 buttonShouldBeVisible ()이라는 메소드를 작성하고,이 경우 true를 리턴하면 그렇지 않으면 false를 리턴해야한다. 스토리가 끝나면 불필요한 두번째 파란 버튼은 없애야하니까
  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2) {
      return true;
    } else {
      return false;
    }
  }
}
