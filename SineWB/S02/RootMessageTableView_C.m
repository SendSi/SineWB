//
//  RootMessageTableView_C.m
//  SineWB
//
//  Created by scuplt on 16-3-27.
//  Copyright (c) 2016年 Scuplt0413. All rights reserved.
//

#import "RootMessageTableView_C.h"
#import "myNavigation_C.h"
@interface RootMessageTableView_C()<UITableViewDelegate>

@end



@implementation RootMessageTableView_C
-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"写私信" style:UIBarButtonItemStyleDone target:nil action:nil];
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 19;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellstr=@"cell";
    UITableViewCell *cell=[ tableView dequeueReusableCellWithIdentifier:cellstr];
    if(cell==nil) cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellstr];
    cell.textLabel.text=@"haha";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewC=[[UIViewController alloc] init];
    [self.navigationController pushViewController:viewC animated:YES];
    
}



@end





















