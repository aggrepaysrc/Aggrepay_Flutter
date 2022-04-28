//
//  TraknPay.h
//  TraknPayObjC
//
//  Created by ​Senthil Kumar ​Selvaraj on 12/8/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TraknPayObjC/TraknPayViewController.h>
#import <TraknPayObjC/TraknPayParams.h>
#import <TraknPayObjC/TraknPayDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface TraknPay : NSObject
/**
   @brief This is method present the payment screen
    @param from  from where it does present
    @param params  payment paremters
    @param delegate  TraknPayadelegate - that is passed from partent controller
 */
+(void)presentTraknPayContorller:(nonnull UIViewController *) from delegate:(id<TraknPayDelegate>)delegate withParams:(nonnull TraknPayParams *)params;

+(void)presentTraknPayContorller:(nonnull UIViewController *) from url:(NSString*)url delegate:(id<TraknPayDelegate>)delegate withParams:(nonnull TraknPayParams *)params;

@end



NS_ASSUME_NONNULL_END
