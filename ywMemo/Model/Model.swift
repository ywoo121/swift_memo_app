//
//  Model.swift
//  ywMemo
//
//  Created by 지연우 on 2021/10/07.
//

import Foundation

class Memo {
    var content : String
    var insertDate : Date
    
    init(content : String) {
        self.content = content
        insertDate = Date()
    }
    
    static var DummyMemoList = [
    Memo(content: "Lorem Ipsum"),
    Memo(content: "Subscribe + 👍 = ❤️")
    ]
}
