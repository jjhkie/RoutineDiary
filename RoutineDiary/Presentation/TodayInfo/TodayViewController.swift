
import UIKit
import RxSwift
import SnapKit

class TodayViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let addButton = UIBarButtonItem()
    let TestButton = UIButton()
   //let todayList = UICollectionView()
    
   
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
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
      
        Observable
            .merge(addButton.rx.tap.asObservable())
            .bind(to: VM.addButtonTapped)
            .disposed(by: disposeBag)
        
     
        
    }
    
    private func attribute(){
        
    }
    
    private func layout(){
        view.addSubview(TestButton)
        
        TestButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

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
        //present(AddViewController(), animated: true)
    }
}


