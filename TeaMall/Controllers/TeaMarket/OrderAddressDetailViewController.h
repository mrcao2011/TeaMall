//
//  OrderAddressDetailViewController.h
//  TeaMall
//
//  Created by vedon on 15/1/14.
//  Copyright (c) 2014 helloworld. All rights reserved.
//

#import "CommonViewController.h"
#import "Commodity.h"
@interface OrderAddressDetailViewController : CommonViewController
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *allMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel_1;
@property (weak, nonatomic) Commodity * commodity;
- (IBAction)addAmountAction:(id)sender;
- (IBAction)reduceAmountAction:(id)sender;
@end
