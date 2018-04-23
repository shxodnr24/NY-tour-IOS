//
//  LowermanhattanTadata.swift
//  NewYorkTour
//
//  Created by Taewook Noh on 2018. 1. 3..
//  Copyright © 2018년 taewook. All rights reserved.
//

import Foundation

let lowermanhattantadata : LowerManhattanTadata = LowerManhattanTadata()
let owt1 : Owtc = Owtc()
class LowerManhattanTadata {
    var noomemorial = ["내셔널 셉텝버 11 메모리얼 & 뮤지엄은 9·11 테러를 추모하기 위해 건설된 뉴욕의 기념관 및 박물관이다.", "180 Greenwich St, New York, NY 10007 미국"]
    
}

class Owtc {
    let explain : String
    let address : String
  
    init() {
      self.explain = "원 월드 트레이드 센터 혹은 제1 세계 무역 센터는 미국 뉴욕 주 뉴욕 시 맨해튼의 구 세계무역센터가 위치해 있었던 자리에 재건한 타워 건물이다. 설계자는 2002년 8월 컴페티션에 제출된 7개의 후보안 중 당선된 다니엘 리베스킨트이나, 토지소유자인 뉴욕 뉴저지 항만공사와, 구 세계무역센터를 항만공사로부터 장기 리스한 부동산 개발업자 래리 실버슈타인, 치안담당기관 등의 요청에 의해 2004년 7월 최초의 설계안으로부터 대폭 변경되었다"
      self.address = "285 Fulton St, New York, NY 10007 미국"
    }
}
