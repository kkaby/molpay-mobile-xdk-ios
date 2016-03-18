//
//  ViewController.m
//  MOLPayXDKExample
//
//  Created by Clement on 26/02/2016.
//  Copyright © 2016 MOLPay. All rights reserved.
//

#import "ViewController.h"
#import <MOLPayXDK/MOLPayLib.h>

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
                                          @"mp_amount": @"", // Mandatory
                                          @"mp_username": @"", // Mandatory
                                          @"mp_password": @"", // Mandatory
                                          @"mp_merchant_ID": @"", // Mandatory
                                          @"mp_app_name": @"", // Mandatory
                                          @"mp_order_ID": @"", // Mandatory
                                          @"mp_currency": @"", // Mandatory
                                          @"mp_country": @"", // Mandatory
                                          @"mp_verification_key": @"", // Mandatory
                                          @"mp_channel": @"", // Optional
                                          @"mp_bill_description": @"", // Optional
                                          @"mp_bill_name": @"", // Optional
                                          @"mp_bill_email": @"", // Optional
                                          @"mp_bill_mobile": @"", // Optional
                                          @"mp_channel_editing": [NSNumber numberWithBool:NO], // Optional
                                          @"mp_editing_enabled": [NSNumber numberWithBool:NO], // Optional
                                          @"mp_transaction_id": @"", // Optional for transactionRequest
                                          @"mp_request_type": @"" // Optional for transactionRequest. Use anything other than "Receipt".
                                          };
    
    mp = [[MOLPayLib alloc] initWithDelegate:self andPaymentDetails:paymentRequestDict];
    //[self presentViewController:mp animated:NO completion:nil];
    //[mp transactionRequest];
    
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