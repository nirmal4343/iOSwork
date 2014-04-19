//
//  EmployeeDetails.m
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 4/19/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import "EmployeeDetails.h"
#import "JSCustomCell.h"


@interface EmployeeDetails ()

@end

@implementation EmployeeDetails

@synthesize empMap,image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 150, 200)];
    imgView.image = image;
   
    imgView.bounds = CGRectInset(imgView.frame, 10.0f, 35.0f);
    
    [self.view addSubview:imgView];
    
    
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 380) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];

}



#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    
    NSLog(@"%d" , indexPath.row);
    
    // Similar to UITableViewCell, but
    JSCustomCell *cell = (JSCustomCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[JSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Just want to test, so I hardcode the data
    if (indexPath.row == 0) {
        cell.descriptionLabel.text = [empMap objectForKey:@"firstName"];
    }
    if (indexPath.row == 1) {
        cell.descriptionLabel.text = [empMap objectForKey:@"email"];
    }
    if (indexPath.row == 2) {
        cell.descriptionLabel.text = [empMap objectForKey:@"officePhone"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
