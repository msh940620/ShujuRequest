//
//  ViewController.m
//  demo
//
//  Created by Reminisce on 16/9/1.
//  Copyright © 2016年 小马. All rights reserved.
//

#import "ViewController.h"
#import "OCRPostTools.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (IBAction)postimage:(id)sender {
    
    UIImage *image = [UIImage imageNamed:@"jz"];
    
    [OCRPostTools loadDriverLicenseInfo:image withBlock:^(NSDictionary *respDic, BOOL state) {
        if(state){
            
        }else{
            
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
