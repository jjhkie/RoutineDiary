
import UIKit
import RxSwift
import RxCocoa

class RoutineViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let RoutineList = UICollectionView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(RoutineViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func bind(_ VM: RoutineViewModel){
        
    }
    
    
    private func attribute(){
        
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        var cellSize = (UIScreen.main.bounds.width / 2) - 20
        
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        
        
        RoutineList.frame = .zero
        RoutineList.collectionViewLayout = CVFlowLayout
        
        //RoutineList.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
        
        //TODO 이 부분이 헤더를 ??
        //RoutineList.supplementaryView(forElementKind: <#T##String#>, at: <#T##IndexPath#>)
    }
    
    private func layout(){
        view.addSubview(RoutineList)
        
        RoutineList.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

///
///TODO 만든 후  얼마나 지났는 지 D- day 설정
///TODO 몇번 했는 지 표시
