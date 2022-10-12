
import Foundation
import UIKit
import RxSwift


class RoutineMyPageController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let myRoutineCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(RoutineMyPageViewModel())
        attribute()
        layout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = UserDefaultsManager()
        manager.setRoutine(MyRoutine(title: "제목 입력헀습니다.", content: "내용을 입력했습니다."))
        
        print(manager.getRoutine())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ VM: RoutineMyPageViewModel){
        VM.myRoutine
            .drive(myRoutineCV.rx.items(cellIdentifier: "RoutineMyPageCell", cellType: RoutineMyPageCell.self)){ row, data, cell in
                    
                cell.setData(data)
            }
            .disposed(by: disposeBag)
    }
    
   
    
    private func attribute(){
        title = "나의 루틴"
        
        myRoutineCV.backgroundColor = .white
        
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        let cellSize = UIScreen.main.bounds.width - 20
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: 100)
        myRoutineCV.collectionViewLayout = CVFlowLayout
        
        myRoutineCV.register(RoutineMyPageCell.self, forCellWithReuseIdentifier: "RoutineMyPageCell")
    }
    
    
    private func layout(){
        view.addSubview(myRoutineCV)
        
        myRoutineCV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
}
