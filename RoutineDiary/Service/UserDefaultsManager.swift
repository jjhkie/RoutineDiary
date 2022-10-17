

import Foundation




struct UserDefaultsManager: UserDefaultsManagerProtocol{
    enum Key: String{
        case routine
        
        var value: String{
            self.rawValue
        }
    }
    
    //데이터 가져오기
    func getRoutine() -> [MyRoutine]{
        guard let data = UserDefaults.standard.data(forKey: Key.routine.rawValue) else { return []}
        
        return (try? PropertyListDecoder().decode([MyRoutine].self, from: data)) ?? []
    }
    
    //데이터 저장하기
    func setRoutine(_ newValue: MyRoutine){
        var currentRoutine: [MyRoutine] = getRoutine()
        currentRoutine.insert(newValue, at: 0)
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(currentRoutine),
                                       forKey: Key.routine.value)
    }
}
