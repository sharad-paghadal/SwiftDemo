//
//  obj-VC.h
//  DatePicker
//
//  Created by Sharad Paghadal on 30/11/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface obj_VC : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

- (IBAction)datechanged:(id)sender;
@end
