//
//  ViewController.m
//  CustomSlider
//
//  Created by unbTech on 2017. 4. 19..
//  Copyright © 2017년 unbTech. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionVIew;

@property (strong, nonatomic) NSMutableArray *numberArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.numberArray = [[NSMutableArray alloc] init];
    
    for ( NSInteger i = 0; i < 10; i++ ) {
        
        NSNumber *number = [[NSNumber alloc] initWithInteger:i];
        [self.numberArray addObject:number];
        
    }
    
    NSLog(@"viewDidLoad");
    
    [self.collectionVIew setPagingEnabled:YES];
    [self.collectionVIew reloadData];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 302;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    customCell * cell = [self.collectionVIew dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if ( indexPath.row == 0 ) {
        
        cell.label.text = @"";
        
    } else {
        
        cell.label.text = [[NSString alloc] initWithFormat:@"%ld",indexPath.row - 1];
        
    }
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
