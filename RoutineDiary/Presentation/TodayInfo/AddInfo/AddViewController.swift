
import UIKit
import RxSwift
import RxCocoa
import SnapKit


class AddViewController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    let tableView = UITableView()
    let uploadButton = UIBarButtonItem()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind(AddViewModel())
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    func bind(_ VM: AddViewModel){
        VM.cellData
            .drive(tableView.rx.items){ tv, row, data in
                switch row{
                case 0:
                    let cell = tv.dequeueReusableCell(withIdentifier: "TitleTextFieldCell", for: IndexPath(row: row, section: 0)) as! TitleTextFieldCell
                    
                    cell.selectionStyle = .none
                    cell.titleInputField.placeholder = data
                    
                    return cell
                case 1:
                    let cell = tv.dequeueReusableCell(withIdentifier: "CategorySelectCell", for: IndexPath(row: row, section: 0))
                    
                    cell.selectionStyle = .none
                    cell.textLabel?.text = data
                    cell.accessoryType = .disclosureIndicator
                    return cell
                    
                case 2:
                    let cell = tv.dequeueReusableCell(withIdentifier: "ContentTextFieldCell", for: IndexPath(row: row, section: 0)) as! ContentTextFieldCell
                    
                    cell.selectionStyle = .none
                    cell.contentInputView.text = data
                    cell.bind(VM.contentTextFieldVM)
                    return cell
                default:
                    fatalError()
                }
            }
            .disposed(by: disposeBag)
        
        
        //추가 버튼을 클릭했을 떄
        uploadButton.rx.tap
            .bind(to: VM.addButtonTapped)
            .disposed(by: disposeBag)
        
        VM.push
            .drive(onNext: {viewModel in
                let viewController = CategoryListViewController()
                viewController.bind(viewModel)
                self.show(viewController, sender: nil)
            })
            .disposed(by: disposeBag)
        
        VM.addPop
            .emit(onNext: {[weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map{ $0.row}
            .bind(to: VM.itemSelected)
            .disposed(by: disposeBag)
        
        
    }
    
    private func attribute(){
        title = " 루틴 추가 "
        view.backgroundColor = .black
        
        
        uploadButton.title = "추가"
        uploadButton.style = .done
        
        navigationItem.setRightBarButton(uploadButton, animated: true)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        
        tableView.register(TitleTextFieldCell.self, forCellReuseIdentifier: "TitleTextFieldCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategorySelectCell")
        tableView.register(ContentTextFieldCell.self, forCellReuseIdentifier: "ContentTextFieldCell")
    }
    
    private func layout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
}

