
import UIKit
import RxSwift
import RxCocoa
import SnapKit


class TodayViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let TodayUV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        bind(TodayViewModel())
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
    
    func bind(_ VM: TodayViewModel){
        
        let input = TodayViewModel.Input()
        
        let output = VM.transform(input: input)
        
        output.TodayCellData
            .drive(TodayUV.rx.items(cellIdentifier: "TodayViewCell", cellType:  TodayViewCell.self)){row, element, cell in
                
                cell.setData(element)
                
            }
            .disposed(by: disposeBag)
        

    }
    
    private func attribute(){
        
        let CVFlowLayout = UICollectionViewFlowLayout()
        CVFlowLayout.scrollDirection = .vertical
        
        let cellSize = (UIScreen.main.bounds.width / 2) - 20
        CVFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        CVFlowLayout.minimumLineSpacing = 0
        CVFlowLayout.minimumInteritemSpacing = 0
        CVFlowLayout.itemSize = CGSize(width: cellSize, height: cellSize)

        TodayUV.collectionViewLayout = CVFlowLayout
        TodayUV.register(TodayViewCell.self, forCellWithReuseIdentifier: "TodayViewCell")

    }
    
    private func layout(){
        view.addSubview(TodayUV)
        
        TodayUV.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
//
// NavigationBarItem Action [ 글작성 페이지로 이동 ]
private extension TodayViewController{

    func setupNavigationBar(){
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(didTapAdd))
        
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func didTapAdd(){
        let viewController = UINavigationController(rootViewController: AddDataViewController())
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)

    }
}


