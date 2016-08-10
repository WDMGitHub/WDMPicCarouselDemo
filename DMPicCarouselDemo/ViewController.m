//
//  ViewController.m
//  DMPicCarouselDemo
//
//  Created by demin on 16/8/9.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "ViewController.h"
#import "DMPicCarouselView.h"
#import "DMPicModel.h"

/**
 *  获取物理屏幕尺寸
 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *localPics;
@property (nonatomic, strong) DMPicCarouselView *picCarouselView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self d_createDataArray];
    [self d_createUI];
}

//加载本地图片资源，数据源数组
- (void)d_createDataArray {
    self.localPics = [@[] mutableCopy];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pics.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    for (NSString *str in arr) {
        DMPicModel *picModel = [[DMPicModel alloc] initWithDictionary:@{@"picName":str}];
        [self.localPics addObject:picModel];
    }
}

//UI布局
- (void)d_createUI {
    //自定义轮播图的尺寸
    DMPicCarouselView *picCarouselView = [[DMPicCarouselView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth - 20, 180)];
    picCarouselView.netPic = NO;
    picCarouselView.picModels = [self.localPics mutableCopy];
    picCarouselView.myTapCurrentImgBlock = ^(NSInteger index){
        NSLog(@"点击的图片下标是：%ld",index);
    };
    [self.view addSubview:picCarouselView];
    self.picCarouselView = picCarouselView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.picCarouselView startTimer];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.picCarouselView removeTimer];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
