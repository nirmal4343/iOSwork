//
//  EmployeeList.m
//  EmployeeOrg
//
//  Created by Nirmal Thakur on 3/9/14.
//  Copyright (c) 2014 NIrmal Thakur. All rights reserved.
//

#import "EmployeeList.h"
#import "EmployeeDetails.h"


@interface EmployeeList ()

@end

@implementation EmployeeList {
    
    NSMutableArray *searchResults;
}

@synthesize empList,_cache,image;




- (void)viewDidLoad
{
    [super viewDidLoad];
    


    
    _cache = [[NSCache alloc] init];
    _cache.name = @"Custom Image Cache";
    _cache.countLimit = 50;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if(tableView == self.tableView){
          return [empList count];
    }else{
        return [searchResults count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:CellIdentifier];
    }
    
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [self loadCell:searchResults toCell:cell imageIndexPath:indexPath];
    } else {
        [self loadCell:empList toCell:cell imageIndexPath:indexPath];
    }
    
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


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{

    int i = 0;
    while (i < [empList count]) {
        
        NSDictionary *emp = [empList objectAtIndex:i];
        
        NSString * name =  [emp objectForKey:@"firstName"];
        
        if ([name rangeOfString:searchText].location == NSNotFound) {
            NSLog(@"Name Not Found");
        } else {
            NSLog(@"Found %@ " ,name );
            [searchResults addObject:emp];
        }
        i++;
    }
    
}




-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    searchResults = [[NSMutableArray alloc] init];
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"Selected row of section >> %d",indexPath.row);
    
    
    empNewMap = [empList objectAtIndex:indexPath.row];
    image = [_cache objectForKey:[empNewMap objectForKey:@"picture"]];
    
    [self performSegueWithIdentifier:@"toEmpDtl" sender:self];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   
    if([[segue identifier] isEqualToString:@"toEmpDtl"]){
        
        employeeDtl = [segue destinationViewController];
        employeeDtl.empMap =  empNewMap;
        employeeDtl.image = self.image;
        // Hide back button
        //[employeeDtl.navigationItem setHidesBackButton:YES];
        
    }
    
}



@end
