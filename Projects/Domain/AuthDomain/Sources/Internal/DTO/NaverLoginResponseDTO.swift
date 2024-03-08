import Foundation

struct NaverLoginResponseDTO: Decodable {
    /// API 호출 결과 코드
    let resultcode: String
    /// 호출 결과 메시지
    let message: String
    let response: Response
}

extension NaverLoginResponseDTO {
    struct Response: Decodable {
        /// 동일인 식별 정보 (네이버 아이디마다 고유하게 발급되는 유니크한 일련번호 값)
        /// (API 호출 결과로 네이버 아이디값은 제공하지 않으며, 대신 'id'라는 애플리케이션당 유니크한 일련번호값을 이용해서 자체적으로 회원정보를 구성해야 함.)
        let id: String?
        
        /// 사용자 별명 (별명이 설정되어 있지 않으면 id*** 형태로 리턴)
        let nickname: String?
        
        /// 사용자 이름
        let name: String?
        
        /// 사용자 메일 주소
        /// (기본적으로 네이버 내정보에 등록되어 있는 '기본 이메일' 즉 네이버ID@naver.com 값이나, 사용자가 다른 외부메일로 변경했을 경우는 변경된 이메일 주소로 됨.)
        let email: String?
        
        /// 성별 (F: 여성, M: 남성, U: 확인불가)
        let gender: String?
        
        /// 사용자 연령대
        let age: String?
        
        /// 사용자 생일(MM-DD 형식)
        let birthday: String?
        
        /// 사용자 프로필 사진 URL
        let profileImage: String?
        
        /// 출생연도
        let birthyear: String?
        
        /// 휴대전화번호
        let mobile: String?
    }
}

extension NaverLoginResponseDTO.Response {
    func toDomain(authority: User.Authority) -> User {
        .init(
            userId: id ?? "",
            nickname: nickname ?? "",
            userAuthority: authority
        )
    }
}
