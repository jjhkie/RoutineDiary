
import UIKit
import RxSwift
import RxCocoa

class RoutineViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let myRoutineButton = UIBarButtonItem()
    let routineAddButton = UIBarButtonItem()
    
    let RoutineCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(RoutineViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func bind(_ VM: RoutineViewModel){

        VM.RoutineCellData
            .drive(RoutineCV.rx.items(cellIdentifier: "RoutineViewCell",cellType: RoutineViewCell.self)){ row, element, cell in
                
                cell.setData(element)
            }
            .disposed(by: disposeBag)
        
        
        RoutineCV.rx.itemSelected
            .subscribe(onNext: {[weak self] indexPath in
                print("\(indexPath)")
                self?.navigationController?.pushViewController(RoutineCategoryController(), animated: true)
            })
            .disposed(by: disposeBag)

    }
    
    
    private func attribute(){
        
        //collectionView Setting
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellSize = (UIScreen.main.bounds.width / 2) - 20
        let cellheight = (UIScreen.main.bounds.height / 4) - 20
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: cellheight)
        
        RoutineCV.collectionViewLayout = CVFlowLayout
//        CVFlowLayout.headerReferenceSize = .init(width: UIScreen.main.bounds.width, height: 500)

//
//        RoutineCV.register(TitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TitleHeaderView")

        RoutineCV
            .supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(row: 0, section: 0))
        
        
        
        
        RoutineCV.register(RoutineViewCell.self, forCellWithReuseIdentifier: "RoutineViewCell")
        

        
        //collectionView Header
        //TODO 이 부분이 헤더를 ??
        //RoutineList.supplementaryView(forElementKind: <#T##String#>, at: <#T##IndexPath#>)
    }
    
    private func layout(){
        view.addSubview(RoutineCV)
        
        RoutineCV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
}

//NavigationBarItem Action
private extension RoutineViewController{
    
    func setupNavigationBar(){
        let myRoutinePagePush = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPush))
        
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(didTapAdd))
      
        navigationItem.rightBarButtonItems = [myRoutinePagePush,addButton]
    }
    
    
    @objc func didTapPush(){
        self.navigationController?.pushViewController(RoutineMyPageController(), animated: true)
    }
    @objc func didTapAdd(){
        self.navigationController?.pushViewController(AddViewController(), animated: true)
    }
}


///
///TODO 만든 후  얼마나 지났는 지 D- day 설정
///TODO 몇번 했는 지 표시
