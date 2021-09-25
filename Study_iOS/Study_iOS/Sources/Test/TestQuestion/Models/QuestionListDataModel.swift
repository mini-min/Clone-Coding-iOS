//
//  QuestionListDataModel.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/25.
//

import Foundation
import UIKit

struct QuestionListDataModel
{
    var questionNumber: String
    var questionTitle: String
    var data: [StyleQuestionData]?
}

struct StyleQuestionData
{
    var answerTitle: String
}
