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

## 2. 프로젝트 설정

Identity - display name = 홈 화면에 표시되는 앱의 이름 (여기에는 한글 입력해도 문제 없음)

Deployment Info - Target 앱을 설치할 수 있는 최소 iOS버전 (보통 최신버전에서 -2, -3)

빌드 단축키 : cmd + B

- 코드에서 발생하는 에럴ㄹ 표시하는 기능 : live-issue
- 자동 수정 : fix-it

에러 

- Command MergeSwiftModule failed with a nonzero exit code
    - Solution : Clean Build (cmd + shift + K → cmd + B 해보기)
        
Signing?
- 우리가 만든 앱을 기기에서 실행하거나 앱스토어에 등록하고 싶다면 signing이라는 과정 필요함. 
- 등록되지 않은 앱이 앱을 설치하거나 해킹된 앱이 설치되지 않도록 일차적으로 막아주는 일종의 안전 장치 (xcode가 자동으로 해줌)
