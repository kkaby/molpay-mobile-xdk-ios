//
//  ViewController.m
//  MOLPayXDKExample
//
//  Created by Clement on 26/02/2016.
//  Copyright © 2016 MOLPay. All rights reserved.
//

#import "ViewController.h"
#import <MOLPayXDK/MOLPayLib.h>

@implementation NSURLRequest (NSURLRequestWithIgnoreSSL)

+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
    return YES;
}

@end

@interface ViewController () <MOLPayLibDelegate>
{
    MOLPayLib *mp;
}
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSDictionary * paymentRequestDict = @{
                                          @"mp_amount": @"1.10",                // Mandatory
                                          @"mp_username": @"api_MOLWallet_Dev3",         // Mandatory
                                          @"mp_password": @"api_walletdev3",      // Mandatory
                                          @"mp_merchant_ID": @"MOLWallet_Dev3", // Mandatory
                                          @"mp_app_name": @"ahkl03",      // Mandatory
                                          @"mp_order_ID": @"MOLPAYTEST",             // Mandatory
                                          @"mp_currency": @"MYR",               // Mandatory
                                          @"mp_country": @"MY",                 // Mandatory
                                          @"mp_verification_key": @"526cf83bd534609be4ba7df469f43aa1",  // Mandatory
                                          @"mp_channel": @"",              // Mandatory    //maybank2u //credit //fpx //bankislam
                                          @"mp_bill_description": @"Demo payment",  // Mandatory
                                          @"mp_bill_name": @"Developer",                // Mandatory
                                          @"mp_bill_email": @"mobile@molpay.com",        // Mandatory
                                          @"mp_bill_mobile": @"+0123456789",                // Mandatory
                                          @"mp_channel_editing": [NSNumber numberWithBool:NO],  // Optional
                                          @"mp_editing_enabled": [NSNumber numberWithBool:NO],  // Optional
                                          @"mp_transaction_id": @"", // Optional for transactionRequest
                                          @"mp_request_type": @"",
                                          @"domain_mode": @"1"
                                          };
    
    mp = [[MOLPayLib alloc] initWithDelegate:self andPaymentDetails:paymentRequestDict];
    //[self presentViewController:mp animated:NO completion:nil];
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mp];
    mp.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(closemolpay:)];
    [self presentViewController:nc animated:NO completion:nil];
    
}

- (IBAction)closemolpay:(id)sender
{
    // Closes MOLPay
    [mp closemolpay];
}

// MOLPayLibDelegates
- (void)transactionResult: (NSDictionary *)result
{
    NSLog(@"transactionResult result = %@", result);
}

@end
