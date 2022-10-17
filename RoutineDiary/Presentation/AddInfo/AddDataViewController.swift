import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class AddDataViewController: UIViewController{

    let disposeBag = DisposeBag()

    let uploadButton = UIBarButtonItem()// 등록 버튼
    let closeButton = UIBarButtonItem()// 뒤로가기 버튼
    
    let titleInputText = UITextField()
    // TODO Category
    let contentInputText = UITextView()
    let goalContentInputText = UITextView()
    let stackView = UIStackView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        bind(AddDataViewModel())
        attribute()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(_ VM: AddDataViewModel){
        let input = AddDataViewModel.Input(
            titleTextValue: titleInputText.rx.text.orEmpty.asObservable(),
            contentTextValue: contentInputText.rx.text.orEmpty.asObservable(),
            goalContentTextValue: goalContentInputText.rx.text.orEmpty.asObservable(),
            uploadTapped: uploadButton.rx.tap.asObservable(),
            closeTapped: closeButton.rx.tap.asObservable()
        )
        
        let output = VM.transform(input: input)
        
 
        //값 넣기
        output.uploadDismiss
            .emit(onNext: {
                self.presentingViewController?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        //뒤로가기
        output.closeDismiss
            .emit(onNext: {
                self.presentingViewController?.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        //upload 버튼 유효성 체크
        VM._isValid
            .bind(to:uploadButton.rx.isEnabled)
            .disposed(by: disposeBag)

    }

    private func attribute(){

        view.backgroundColor = .white
        
        // 뒤로가기 버튼
        closeButton.title = "닫기"
        closeButton.style = .done
        
        //등록 버튼
        uploadButton.title = "추가"
        uploadButton.style = .done
        uploadButton.isEnabled = false
            
        //navigationButton 등록
        navigationItem.setLeftBarButton(closeButton, animated: true)
        navigationItem.setRightBarButton(uploadButton, animated: true)
        

        //StackView
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        //title
        titleInputText.placeholder = "글 입력"

        //content
        contentInputText.text = "내용"
        contentInputText.textColor = .lightGray

        //goal
        goalContentInputText.text = "goal"

    }

    private func layout(){

        [titleInputText,contentInputText,goalContentInputText].forEach{
            stackView.addArrangedSubview($0)
        }

        contentInputText.snp.makeConstraints{
            $0.height.equalTo(300)
        }

        view.addSubview(stackView)

        stackView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }

    }

}
