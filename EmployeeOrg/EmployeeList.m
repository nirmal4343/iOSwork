//
//  EmployeeList.m
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 3/9/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import "EmployeeList.h"

@interface EmployeeList ()

@end

@implementation EmployeeList {
    
    NSArray *searchResults;
}

@synthesize empList,_cache;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@" viewDidLoad..");
    
    self.navigationItem.hidesBackButton = YES;
    
    _cache = [[NSCache alloc] init];
    _cache.name = @"Custom Image Cache";
    _cache.countLimit = 50;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
       return [empList count];
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
    }
    
    
    [self loadCell:empList toCell:cell imageIndexPath:indexPath];
    
    return cell;
}


- (void) loadCell:(NSArray *) newEmpList toCell:(UITableViewCell *) cell imageIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    NSDictionary *emp = [newEmpList objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = [emp objectForKey:@"firstName"];
    cell.imageView.image = [UIImage imageNamed:@"contact.jpeg"];
    
    UIImage *image = [_cache objectForKey:[emp objectForKey:@"picture"]];
    
    if (image) {
        NSLog(@" Found Skipping...");
        cell.imageView.image = image;
    } else {
        NSLog(@" NOT Found Downloading...");
        
        NSURL *imageUrl =[NSURL URLWithString:[emp objectForKey:@"imageDownloadPath"]];
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
        dispatch_async(queue, ^{
            NSData *data = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *image = [UIImage imageWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageView.image = image;
            });
            [_cache setObject:image forKey:[emp objectForKey:@"picture"]];
        });
        
        
    }
    
    cell.accessoryType = UITableViewCellSelectionStyleBlue;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
