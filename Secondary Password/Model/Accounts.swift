//
//  Acounts.swift
//  Secondary Password
//
//  Created by 박다현 on 4/27/24.
//

import Foundation

struct Accounts{
    let id:String
    var password:String
    var secondaryPassword:String
}

//회원정보
var accounts:[Accounts] = [Accounts(id: "mimi", password: "1234",secondaryPassword: "1234A"), Accounts(id: "dodo", password: "2345", secondaryPassword: "2345A"), Accounts(id: "haha", password: "1234", secondaryPassword: "1234A")]

//아이디 있는지 확인
func findId(id:String) -> Bool{
    if accounts.contains(where: { $0.id == id }) {
        return true
    }
    return false
}

//아이디와 비번 매칭 확인
func matchingIdPw(id:String, pw:String) -> Bool{
    let check = accounts.contains { account in
        account.id == id && account.password == pw
    }
    return check
}

//아이디와 세컨비번 매칭 확인
func checkSecondPw(id:String, secondPW:String) -> Bool{
    let check = accounts.contains { account in
        account.id == id && account.secondaryPassword == secondPW
    }
    return check
}
