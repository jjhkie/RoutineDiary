
import UIKit
import RxSwift
import SnapKit
import Floaty

final class RoutineMyPageController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let myRoutineCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let addButton = Floaty()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(RoutineMyPageViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ VM: RoutineMyPageViewModel){
        
        let input = RoutineMyPageViewModel.Input(modelSelected:  myRoutineCV.rx.modelSelected(MyRoutine.self).asObservable())
        let output = VM.transform(input: input)
        
        addButton.addItem(title: ""){_ in
            let viewController = UINavigationController(rootViewController: AddDataViewController())
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true)
        }
        
        output.myRoutineCellData
            .drive(myRoutineCV.rx.items(cellIdentifier: "RoutineMyPageCell", cellType: RoutineMyPageCell.self)){ row, data, cell in
                    
                cell.setData(data)
            }
            .disposed(by: disposeBag)

        output.detailPush
            .drive(onNext: {VM in
                
                let viewController = RoutineMyDetailController()
                viewController.bind(VM)
                self.navigationController?.pushViewController(viewController, animated: true)
                //self.show(viewController, sender: nil)
            })
            .disposed(by: disposeBag)
            
    }
    private func attribute(){
        navigationItem.title = "나의 루틴"
        
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        let cellSize = UIScreen.main.bounds.width - 20
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: 100)
        myRoutineCV.collectionViewLayout = CVFlowLayout
        
        myRoutineCV.register(RoutineMyPageCell.self, forCellWithReuseIdentifier: "RoutineMyPageCell")
        
        addButton.size = 50.0
        addButton.sticky = true
        addButton.handleFirstItemDirectly = true

        addButton.buttonImage = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
    }
    
    
    private func layout(){
        
        [myRoutineCV,addButton]
            .forEach{
                view.addSubview($0)
            }
        
        myRoutineCV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        addButton.paddingY = 100.0
        
    }
}
