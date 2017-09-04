//
//  obj-VC.m
//  DatePicker
//
//  Created by Sharad Paghadal on 30/11/16.
//  Copyright © 2016 Sharad Paghadal. All rights reserved.
//

#import "obj-VC.h"

@interface obj_VC ()

@end

@implementation obj_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)datechanged:(id)sender {
    self.lbl.text = @"hello";
}
@end


//class ViewController: UIViewController {
//    
//    @IBOutlet weak var datePicker: UIDatePicker!
//    @IBOutlet weak var timePicker: UIDatePicker!
//    @IBOutlet weak var dateTimeDisplay: UILabel!
//    let dateFormatter = DateFormatter()
//    let timeFormatter = DateFormatter()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func setDateAndTime() {
//        dateFormatter.dateStyle = DateFormatter.Style.full
//        timeFormatter.timeStyle = DateFormatter.Style.full
//        dateTimeDisplay.text = dateFormatter.string(from: datePicker.date) + " " + timeFormatter.string(from: timePicker.date)
//    }
//    
//    @IBAction func datePickerChanged(_ sender: AnyObject) {
//        setDateAndTime()
//    }
//    @IBAction func timePickerChanged(_ sender: AnyObject) {
//        setDateAndTime()
//    }
//    
//    }
