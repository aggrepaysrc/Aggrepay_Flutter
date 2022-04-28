//
//  TraknPayViewController.h
//  TraknPayObjC
//
//  Created by ​Senthil Kumar ​Selvaraj on 12/8/20.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "TraknPayViewController.h"
#import <TraknPayObjC/TraknPayDelegate.h>
#import <TraknPayObjC/TraknPayParams.h>

NS_ASSUME_NONNULL_BEGIN

@interface TraknPayViewController : UIViewController<WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler>
/** @brief TraknPay Post request Codabale Model. That used for loading the payamnet request*/
@property(nonatomic, strong) TraknPayParams *traknPayParams;

@property(nonatomic, strong) NSString *url;

/** @brief Webview that loads the payment request page*/
@property (strong, nonatomic)  WKWebView *traknPayWebView;

/** @brief  Loader will be indicating weather the page has been loading or not*/
@property (strong, nonatomic)  UIActivityIndicatorView *activityIndicator;

/** @brief Payament delegates*/
@property(nullable, nonatomic, weak) id<TraknPayDelegate> paymentDelegate;

/** @brief  Loading request using trakpay payamnet system*/
-(void)startPayment:(TraknPayParams*)params url: (NSString*)url;

@end





NS_ASSUME_NONNULL_END
