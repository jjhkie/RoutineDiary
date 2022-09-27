
import UIKit
import RxSwift
import RxCocoa

class RoutineViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let RoutineList = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
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
        
        
        VM.RoutineCellData
            .drive(RoutineList.rx.items(cellIdentifier: "RoutineViewCell",cellType: RoutineViewCell.self)){ row, element, cell in
                cell.setData(element)
            }
            .disposed(by: disposeBag)
        
        RoutineList.rx.itemSelected
            .subscribe(onNext: {[weak self] indexPath in
                print("\(indexPath)")
                self?.navigationController?.pushViewController(RoutineCategoryController(), animated: true)
            })
            .disposed(by: disposeBag)
//        RoutineList.rx.modelSelected(Category.self)
//            .subscribe(onNext: { Category in
//                print(Category.name)
//            })
//            .disposed(by: disposeBag)
//
    }
    
    
    private func attribute(){
        
        //collectionView Setting
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellSize = (UIScreen.main.bounds.width / 2) - 20
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        CVFlowLayout.headerReferenceSize = .init(width: UIScreen.main.bounds.width, height: 100)
        RoutineList.collectionViewLayout = CVFlowLayout
        
        RoutineList.register(TitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleHeaderView")

        RoutineList
            .supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(row: 0, section: 0))
        
        
        
        RoutineList.register(RoutineViewCell.self, forCellWithReuseIdentifier: "RoutineViewCell")
        

        
        //collectionView Header
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
