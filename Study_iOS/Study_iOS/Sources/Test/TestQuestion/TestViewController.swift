//
//  TestViewController.swift
//  Study_iOS
//
//  Created by 민 on 2021/09/24.
//

import UIKit

class TestViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var answerTableView: UITableView!
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionTitleLabel: UILabel!
    
    var answerList: [AnswerListDataModel] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setAnswerList()
        
        self.answerTableView.delegate = self
        self.answerTableView.dataSource = self
        
    }
    
    // MARK: - functions
    func setAnswerList() {
        answerList.append(contentsOf: [
            AnswerListDataModel(title: "운동복이 다 똑같은 운동복이지."),
            AnswerListDataModel(title: "이곳이 나의 패션쇼!"),
            AnswerListDataModel(title: "운동복이 다 똑같은 운동복이지."),
            AnswerListDataModel(title: "이곳이 나의 패션쇼!")
        ])
    }
    
    // MARK: - IBActions
    // 이전 버튼 클릭 시
    @IBAction func previousButtonClicked(_ sender: Any) {
    }
    
    // 다음 버튼 클릭 시
    @IBAction func nextButtonClicked(_ sender: Any) {
    }
    
}

// MARK: - Extensions
extension TestViewController: UITableViewDelegate
{
    // 한 행의 높이는 얼마?
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}

extension TestViewController: UITableViewDataSource
{
    // 목록은 몇 개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerList.count
    }
    
    // cell에는 어떤 내용을 집어넣을까?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let answerCell = tableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.identifier, for: indexPath) as? AnswerTableViewCell else {return UITableViewCell()}
        
        answerCell.setData(title: answerList[indexPath.row].title)
        answerCell.selectionStyle = .none
        
        return answerCell
    }
    
    
}
