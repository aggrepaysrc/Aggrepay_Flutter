//
//  TraknPayDelegate.h
//  TraknPaySwift
//
//  Created by ​Senthil Kumar ​Selvaraj on 12/10/20.
//

#ifndef TraknPayDelegate_h
#define TraknPayDelegate_h

@protocol TraknPayDelegate <NSObject>

/*!
    This method triggered once the payment completed
        
 @param controller Traknpayacontroller
 @param data Payament success/failure json string  (String)
 */
-(void)didPaymentCompleted:(UIViewController *)controller withData:(id)data;

/*!

 This method triggered once user click the cancel button
        
 @param controller Traknpayacontroller
 */
-(void)didPaymentCanceled:(UIViewController *)controller;
@end

#endif /* TraknPayDelegate_h */
