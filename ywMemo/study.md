# [KxCoding] Step by Step iOS_Memo
## 1. 프로젝트 생성

프로젝트 네임을 입력할 때의 주의사항 

- 단순한 명사를 사용하지 않아야 함 (앱스토어에 등록할 때 문제 발생 가능)
- 한글 불가능
- 공백, 특수문자 사용 X
- 팀 : 개발자 계정 입력
- Organization Name : 이름/ 혹은 회사
- xcode 11부터 ui구현 방식을 Swift UI / **Storyboard** 중 선택해서 사용 가능
- Use Core Data 만 체크
- 소스 컨트롤 버튼 클릭

시뮬레이터 실행 버튼 단축키 : **cmd + R**

---

## 2. 프로젝트 설정

Identity - **display name** 

⇒  홈 화면에 표시되는 앱의 이름 (여기에는 한글 입력해도 문제 없음)

Deployment Info - **Target** (버전에 따라 이름 다름)

 ⇒ 앱을 설치할 수 있는 최소 iOS버전 (보통 최신버전에서 -2, -3 다운그레이드하여 설정.)

빌드 단축키 : **cmd + B**

- 코드에서 발생하는 에러를 표시하는 기능 : live-issue
- 자동 수정 : fix-it

**Signing?**

- 우리가 만든 앱을 기기에서 실행하거나 앱스토어에 등록하고 싶다면 signing이라는 과정 필요함.
    
    등록되지 않은 앱이 앱을 설치하거나 해킹된 앱이 설치되지 않도록 일차적으로 막아주는 일종의 안전 장치 (xcode가 자동으로 해줌)
    

**ERROR**

- Command MergeSwiftModule failed with a nonzero exit code
    - Solution : Clean Build
        
        cmd + shift + K → cmd + B
        

---

## 3. 앱 아이콘

이미지 크기가 px이 아니라 **pt**?

- pt는 해상도 독립적인 단위임.
- 2x, 3x : 상대적인 해상도
- 일반적인 retina : 2x, 나머지 : 3x
- 아이폰에서 사용하는 앱 아이콘 : iphone App 60pt (1x에서는 60px 그러면 2x에선 120px)
- 아이콘은 영역 전체를 체우고 실제 내용 부분은 약간의 여백을 갖고 있는 것이 좋음.

사이즈 맞추기 위해 [https://appiconmaker.co](https://appiconmaker.co) 라는 곳 이용

해상도 맞는 이미지 찾아 걍 다 넣기.

---

## 4. Launch Screen

**launch screen?** 첫번째 화면이 표시되기 전에 아주 잠깐 표시되는 화면.

파일을 Document outline 부분으로 드래그 앤 드롭.

이미지뷰와 레이블로 구성된 간단한 launch screen구성

image view → 화면 추가 → label도 추가

stack view : 수직이나 수평으로 control을 배치할 때 자주 사용

---

## 5. Main Layout

main.storyboard ⇒ 하나의 씬이 기본적으로 추가되어 있음. 기본적으로 viewcontroller파일에 있는 클래스와 연결되어 있음

- 이벤트를 처리하거나 컨트롤을 업데이트 하고 싶다면 항상 씬과 클래스를 연결해야 함
- move to trash : 완전히 삭제함
- 메모앱 : navigaton UI로 구성 예정
- navigation controller sceen ; 화면을 관리해주는 객체 (실제 화면은 아님)
- 실제로 표시되는 sceen은 Table View임
- 버튼이나 이미지뷰같은 컨트롤을 뷰라고 부름
- 하나 이상의 뷰가 모여 하나의 화면을 구성한다.
- 화면에서 발생하는 이벤트 처리와 뷰를 관리하는 객체 → view controller라고 함
- 검은 화면이 지속되면 시작 화면이 지정되지 않은 것이 원인임
- Sceen Dock의 첫번째 : Navigation Controller\
- view controller의 is initial view controller을 체크하
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4f907def-7fca-4273-8546-158246efeea9/Untitled.png)
    

- 면 화살표가 생성이 된다 (화면의 흐름)
- navigation bar에 버튼을 생설할 때에는 주로 bar button을 선택한다 (물론 그냥 button도 가능) - custom 가능함

---

## 6. Memo Class

- 이 강의는 swift 문법을 안 알려주니 swift문법은 다른 강의를 잘 듣자.!
- new group (name : Model) → new file (Model.swift)
- Memo 클래스 : 내용과 날짜 저장

```swift
import foundation

class Memo [
    var content : String
    var insertDate : Date

    init(content ; String) {
        self.content = content
        insertDate = Date()
//insertDate에는 현재 날짜를 바로 저장하면 되기 때문에 별도의 파라미터 없어도 ㄱㅊ    }
        static var dummyMemoList = [
Memo(content: "Lorem Ipsum"),
Memo(content: "Subscribe + 👍 = 🥰")
}
```

---

## 7. 메모 목록 구현

- 우선 배열에 임시로 저장
- main.storyboard
- 테이블 뷰는 하나의 데이터를 셀로 표시함
- table view의 prototype cells에서 셀을 디자인한다.
- custom → 셀 디자인을 직접 할 때 사용함.
    - 여기서는 제공된 디자인을 사용
    - subtitle을 선택한 다음, 위에는 메모 출력, 아래에는 date를 출력할 예정임
- identifier 입력 셀 : table view에 셀을 표시하려면 여기에 적절한 값을 입력해야 함. 그렇지 않으면 crash 발생
- cell을 컨트롤하는 class : view controller class라고 함.
- cocoa Touch Class 를 선택
    - cocoa touch?
    - view controller class는 반드시 UI view   controller class를 상속해야 한다.
    - 테이블 뷰 구현에 필요한 기본 코드가 들어 있음

---

## 8. 테이블 뷰 구현 이론

- ios에서 가장 많이 사용하는 패턴 중 하나 : 델리게이트 (delicate) 패턴
- 테이블 뷰 구현 단계
    1. 테이블 뷰 배치
    2. 프로토 타입 셀 디자인, 셀 아이덴티파이어 지정
    3. 데이터 소스, 델리게이트 연결 (table view controller가 자동으로 연결해줌)
    4. 데이터 소스 구현
    5. 델리게이트 구현

---

## 9. 원하는 포맷으로 날짜 출력하기

- 날짜 형식을 조금 더 사용자 친화적으로 변경해보자
- DateFormatter 사용

```swift
let formatter: DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .long
    f.timeStyle = .short

    return f
}
```

- xcode가 생성한 프로젝트는 기본적으로 다국어를 지원하지 않기 때문에 기본어로 영어 사용
- 한국어로 생성하기 위해 포매터에서 locale설정 변경 ⇒ ```f.locale = Locale(identifier: "Ko_kr")```

---

## 10. 새 메모쓰기 화면

---

## 11. 취소 기능 구현

---

## 12. 메모 저장 구현

---

## 13. 목록 업데이트

---

## 14. 메모 보기 화면 1

---

## 15. 메모 보기 화면 2

---

## 16. 데이터 전달

---

## 17. 선택 기능과 줄바꿈 구현

---

## 18. DB 구현 1

---

## 19. DB 구현 2

---

## 20. 메모 편집

---

## 21. 편집 취소 확인

---

## 22. 메모 삭제 구현

---

## 23. 메모 공유

---

## 24. 키보드 노티피케이션

---

## 25. Dark Mode

---

## 26. iPad 지원

---

## 27. Mac Catalyst
