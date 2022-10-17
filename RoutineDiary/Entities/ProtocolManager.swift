import RxSwift

// ViewModel 구조
protocol VM {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag{ get set }
    
    func transform(input: Input) -> Output
}



//UserDefaults Manager 구조 
protocol UserDefaultsManagerProtocol{
    func getRoutine() -> [MyRoutine]
    func setRoutine(_ newValue: MyRoutine)
}
