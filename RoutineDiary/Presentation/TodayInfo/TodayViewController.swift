
import UIKit
import RxSwift
import RxCocoa
import SnapKit

class TodayViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let addButton = UIBarButtonItem()
    //let TodayList = UICollectionView()
    
    let TodayList: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        var cellWidth: CGFloat = 0.0
        cellWidth = (UIScreen.main.bounds.width / 2) - 20
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(TodayViewCell.self, forCellWithReuseIdentifier: "TodayViewCell")
        
        return cv
    }()

   
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
        view.backgroundColor = .white
    }
    
    func bind(_ VM: TodayViewModel){
        VM.TodayCellData
            .drive(TodayList.rx.items(cellIdentifier: "TodayViewCell", cellType:  TodayViewCell.self)){row, element, cell in
                print("\(element)")
                cell.setData(element)
                //cell.titleLabel.text = "\(element.routineTitle)"
            }
            .disposed(by: disposeBag)
    }
    
    private func attribute(){
        addButton.image = UIImage(systemName: "plus.app")
        addButton.style = .plain
        addButton.target = self
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func layout(){
        view.addSubview(TodayList)
        
        TodayList.snp.makeConstraints{
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
        self.navigationController?.pushViewController(AddViewController(), animated: true)
    }
}


