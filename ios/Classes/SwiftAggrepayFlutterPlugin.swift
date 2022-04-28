import Flutter
import UIKit
import TraknPayObjC


public class SwiftAggrepayFlutterPlugin: NSObject, FlutterPlugin, TraknPayDelegate {
 var paymentResult: FlutterResult?
    
let errorJSON = """
    {
     "status": "failed"
    }
    """
    
let successJSON = """
        {
         "status": "success",
         "payment_response":%@
        }
    """
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "aggrepay_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftAggrepayFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }




  

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   if ( call.method == "pay") {
    paymentResult = result

    DispatchQueue.main.async {
      
        if let controller = UIApplication.shared.keyWindow?.rootViewController,
        let payload = call.arguments as? NSDictionary,
        let url = payload["url"] as? String,
        let params = payload["params"] as? NSDictionary{
            
            let value = TraknPayParams()
            print(params)
            
            value.apiKey = params["api_key"] as? String
            value.theHash = params["hash"] as? String
            value.orderID = params["order_id"] as? String
            value.mode = params["mode"] as? String
            value.theDescription = params["description"] as? String
            value.currency = params["currency"] as? String
            value.amount = params["amount"] as? String
            value.name = params["name"] as? String
            value.email = params["email"] as? String
            value.phone = params["phone"] as? String
            value.city = params["city"] as? String
            value.state = params["state"] as? String
            value.country = params["country"] as? String
            value.zipCode = params["zip_code"] as? String
            value.addressLine1 = params["address_line_1"] as? String
            value.returnURL = params["return_url"] as? String
            
            TraknPay.presentContorller(controller, delegate: self, with: value)

      }
    }
   }
    
  }

  
    public func didPaymentCompleted(_ controller: UIViewController, withData data: Any)  {
   
        print("didPaymentCompleted", data)
        DispatchQueue.main.async {
        if let paymentResponse = data as? String{
            let successJSON = String(format: self.successJSON, paymentResponse)
            self.paymentResult?(successJSON)
        }else{
            self.paymentResult?(self.errorJSON)
        }
        controller.dismiss(animated: true, completion: nil)
    }
       let successJSON = String(format: self.successJSON, data as! String)
       self.paymentResult?(successJSON)
  }
  
    public func didPaymentCanceled(_ controller: UIViewController) {
        print("errorJSON", self.errorJSON)
    DispatchQueue.main.async{
        self.paymentResult?(self.errorJSON)
        controller.dismiss(animated: true, completion: nil)
    }
    self.paymentResult?(self.errorJSON)
  }
}
