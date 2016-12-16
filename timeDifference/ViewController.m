//
//  ViewController.m
//  timeDifference
//
//  Created by lvtao on 16/12/16.
//  Copyright © 2016年 lvtao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSDate *nowDate;
    NSDateFormatter *dateFomatter;
    NSString *nowDateStr;
}
@property (weak, nonatomic) IBOutlet UITextField *nowData;
@property (weak, nonatomic) IBOutlet UITextField *oldDate;
@property (weak, nonatomic) IBOutlet UILabel *year;
@property (weak, nonatomic) IBOutlet UILabel *month;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *hour;
@property (weak, nonatomic) IBOutlet UILabel *minute;
@property (weak, nonatomic) IBOutlet UILabel *second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取当前系统时间
    nowDate = [NSDate date];
    dateFomatter = [[NSDateFormatter alloc] init];
    dateFomatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    nowDateStr = [dateFomatter stringFromDate:nowDate];
    self.nowData.text =nowDateStr;
    self.oldDate.placeholder = @"yyyy-MM-dd HH:mm:ss";
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)calculate:(UIButton *)sender {
    NSDate *expireDate = [dateFomatter dateFromString:self.oldDate.text];
    // 当前日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 需要对比的时间数据
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 对比时间差
    NSDateComponents *dateCom = [calendar components:unit fromDate:expireDate toDate:nowDate options:0];
    self.year.text =[NSString stringWithFormat:@"%ld年",(long)dateCom.year];
    self.month.text =[NSString stringWithFormat:@"%ld月",(long)dateCom.month];
    self.day.text =[NSString stringWithFormat:@"%ld日",(long)dateCom.day];
    self.hour.text =[NSString stringWithFormat:@"%ld时",(long)dateCom.hour];
    self.minute.text =[NSString stringWithFormat:@"%ld分",(long)dateCom.minute];
    self.second.text =[NSString stringWithFormat:@"%ld秒",(long)dateCom.second];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
