//
//  TraknPayParams.h
//  TraknPayObjC
//
//  Created by ​Senthil Kumar ​Selvaraj on 12/10/20.
//

// TraknPayParams.h

// To parse this JSON:
//
//   NSError *error;
//   TraknPayParams *raknPayParams = [TraknPayParams fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class TraknPayParams;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface TraknPayParams : NSObject

/// Customer address
@property (nonatomic, nullable, copy) NSString *addressLine1;

/// Customer address 2
@property (nonatomic, nullable, copy) NSString *addressLine2;

/// This is the payment amount.
@property (nonatomic, nullable, copy) NSString *amount;

/// TraknPay would assign a unique 40-digit merchant key to you.
/// This key is exclusive to your business/login account. If you have multiple login accounts, there will necessarily be one different api_key per login account that is assigned to you.
@property (nonatomic, nullable, copy) NSString *apiKey;

/// Customer city
@property (nonatomic, nullable, copy) NSString *city;

///Customer country
@property (nonatomic, nullable, copy) NSString *country;

/// This is the 3-digit currency code (INR)
@property (nonatomic, nullable, copy) NSString *currency;

/// Brief description of product or service that the customer is being charged for. Name of customer.
@property (nonatomic, nullable, copy) NSString *theDescription;

/// Customer email address.
@property (nonatomic, nullable, copy) NSString *email;

/// You need to compute a hash of all your parameters and pass that hash to TraknPay, for details about calculating hash refer Appendix 2.
///
/// Note: the SALT will be provided by TraknPay separately.
@property (nonatomic, nullable, copy) NSString *theHash;

/// This is the payment mode (TEST or LIVE are valid values)
@property (nonatomic, nullable, copy) NSString *mode;

/// Name of customer.
@property (nonatomic, nullable, copy) NSString *name;

/// This is your (merchant) reference number. It must be unique for every transaction.
/// We do perform a validation at our end and do not allow duplicate order_ids for the same merchant.
@property (nonatomic, nullable, copy) NSString *orderID;

/// Customer phone number
@property (nonatomic, nullable, copy) NSString *phone;

/// Return URL success - TraknPay will make a POST request to this URL after successful transaction, with a set of parameters, which you can process as you want to.
@property (nonatomic, nullable, copy) NSString *returnURL;

/// Customer State
@property (nonatomic, nullable, copy) NSString *state;

/// User defined field
@property (nonatomic, nonnull, copy) NSString *udf1;

/// User defined field
@property (nonatomic, nullable, copy) NSString *udf2;

/// User defined field
@property (nonatomic, nullable, copy) NSString *udf3;

/// User defined field
@property (nonatomic, nullable, copy) NSString *udf4;

/// User defined field
@property (nonatomic, nullable, copy) NSString *udf5;

/// Customer zip code
@property (nonatomic, nullable, copy) NSString *zipCode;

/// Timeout duration (in seconds)
@property (nonatomic, nullable, copy) NSString *timeout_duration;

/// Return URL failure - TraknPay will make a POST request to this URL after a FAILED transaction, with a set of parameters, which you can process as you want to.
@property (nonatomic, nullable, copy) NSString *return_url_failure;

/// Return URL success - TraknPay will make a POST request to this URL in case of transaction cancellation, with a set of parameters, which you can process as you want to.
@property (nonatomic, nullable, copy) NSString *return_url_cancel;

/// ercent of tdr amount paid by user
@property (nonatomic, nullable, copy) NSString *percent_tdr_by_user;

/// fixed fee paid by user (optional)
@property (nonatomic, nullable, copy) NSString *flatfee_tdr_by_user;

///Controls whether the convenience fee amount (for surcharge merchants) is displayed to the customer (on the payment page) or not
@property (nonatomic, nullable, copy) NSString *show_convenience_fee;

/// Controls whether payment is required to be split before settlement.
///
///  By default, it is set to 'n', If this is set to 'y' then settlement will be on HOLD until splitsettlement api is called to provide split information.
@property (nonatomic, nullable, copy) NSString *split_enforce_strict;

/// Split info is for splitting the payment between vendor and themselves. In this field one must provide vendor code and what percentage of the payment to be split. (Note: Currently this accepts single vendor split amount percentage only) Following is an example how it will look
///
/// {"vendors":[{"vendor_code":"2VEN449"," split_amount_percentage":"20"}]}
///
/// All field in this JSON are mandatory.

@property (nonatomic, nullable, copy) NSString *split_info;
 
/// payment options to be displayed such credit card (cc), net banking (nb), wallet (w), ATM card (atm) and debit card with pin (dp).
///
///  Tabs will be displayed by order in which values are sent.
@property (nonatomic, nullable, copy) NSString *payment_options;

///
/// This text will be displayed below the logo on payment page.
///
@property (nonatomic, nullable, copy) NSString *payment_page_display_text;

/// Bank codes sent in this filed will be allowed in payment page, other bank codes will not be allowed to proceed with payment. Refer appendix 3 for the list of bank codes.
///
/// To send multiple bank codes send a comma separated list. E.g. to allow only credit cards: MACC,VICC,DINC,VISC,RUPC,MASC, AMXC
@property (nonatomic, nullable, copy) NSString *allowed_bank_codes;

///  This will be a comma separated integer list depending upon the tenure (in months) of loan allowed to show in EMI payment method.
///
///   Ex( 3 , 6, 9 etc.)
@property (nonatomic, nullable, copy) NSString *allowed_emi_tenure;

///  BIN is Bank Identification Number, on a card it is first 6 digits.
///  BINs passed here will only be allowed to transact, multiple BINs can be sent as comma separated list.
///  Refer appendix 3 for the list if the payment mode is card
@property (nonatomic, nullable, copy) NSString *allowed_bins;

///  If there is any discount / offer provided by merchant on EMIs, then predefined codes must be mentioned in this field. (This is for specific use case; more information can be provided on demand)
@property (nonatomic, nullable, copy) NSString *offer_code;

/// Contains information regarding the goods/product for which the payment (emi) is being made. Values in this field should be sent in JSON format, for example:
///
/// {"manufacturer": "Samsung","category": "Phone","sub_category_1": "Smart Phone","sub_category_2": "High- end","model_name": "Samsung Galaxy S10 Pro"}
///
/// Felds such as manufacturer, category, model_name are self-explanatory; sub_category_1 and sub_category_2 further describe the variants/types of that product.
///
/// All fields in this JSON are optional.
@property (nonatomic, nullable, copy) NSString *product_details;

/// Payment request is auto refunded in case of delay success depending upon the value present in the field is 'y' or 'n'.
/// If this filed is not sent default set for your account at the time of setup will take effect.
@property (nonatomic, nullable, copy) NSString *enable_auto_refund;

@end

NS_ASSUME_NONNULL_END
