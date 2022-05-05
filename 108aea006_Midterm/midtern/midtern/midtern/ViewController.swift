import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var results: UILabel!
    @IBOutlet weak var calcuing: UILabel!
    
    var isTyping = false
    var isEqual = false
    var DotCount = 0
    var judge = 0
    var calcu = Calculate()
    
    var displayValue: Float{
        get{
            return Float(results.text!)!
        }
        set {
            if String(newValue) == "inf" {
                results.text! = "0"
            }
            else {
                results.text! = String(newValue)
            }
            isEqual = true
        }
    }
    
    @IBAction func digitTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if(isEqual){
            calcuing.text = " "
        }
        isEqual = false
        
        if digit == "." {
            DotCount += 1
        }

        if (digit == "." && DotCount>1){
        }else if isTyping{
            results.text! = results.text! + digit
        }else{
            results.text = digit
            isTyping = true
        }
    }
    
    @IBAction func acTapped(_ sender: UIButton) {
        results.text = "0"
        calcuing.text = " "
        isTyping = false
        isEqual = false
        DotCount = 0
    }
    
    @IBAction func operationTapped(_ sender: UIButton) {
        isEqual = false
        if isTyping{
            calcu.setOperand(Float(displayValue))
            isTyping = false
            DotCount = 0
        }
        calcu.performOperation(sender.currentTitle!)
        if let result = calcu.result{
            displayValue = Float(result)
        }
    }
    
    @IBAction func percent(_ sender: Any) {
        isEqual = false
        let count = Float(results.text!)!
        let count2 = count * 0.01
        results.text! = String(count2)
    }
    
    @IBAction func display(_ sender: UIButton) {
        let digit1 = sender.currentTitle!
        
        if (digit1 == "." && DotCount>1){
        }
        if (digit1 == "+/-" ){
            calcuing.text! = " "
        }else if (digit1 == "+" || digit1 == "-" || digit1 == "×" || digit1 == "÷" || digit1 == "=") && isTyping{
                if judge == 0{
                    let a = Float(results.text!)!
                    calcuing.text! = String(a) + digit1
                    judge = 1
                }
                else {
                    let a = Float(results.text!)!
                    calcuing.text! =  calcuing.text! + String(a) + digit1
                }
        }
        if isEqual {
            let a = Float(results.text!)!
            calcuing.text! =   String(a) + digit1
        }
    }

}
