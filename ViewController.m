//
//  ViewController.m
//  MessageSend
//
//  Created by Apple on 2019/1/17.
//  Copyright © 2019 Chen. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@property (nonatomic,strong) People *person;
@property (nonatomic,strong) Student *student;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.student = [[Student alloc] init];
    [self.student study];
    
    self.person = [[People alloc] init];
    [self.person performSelector:@selector(study) withObject:nil];
}

@end
