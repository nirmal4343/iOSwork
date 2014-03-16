//
//  SplashScreen.m
//  Restaurent
//
//  Created by NIrmal Thakur on 9/16/13.
//  Copyright (c) 2013 NIrmal Thakur. All rights reserved.
//

#import "SplashScreen.h"
#import "EmployeeList.h"

@interface SplashScreen ()

@end

@implementation SplashScreen

@synthesize empMediator, empList,av,ActInd;


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
    
    av=[[UIAlertView alloc] initWithTitle:@"Loading Data" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    
    ActInd=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    [ActInd startAnimating];
    [ActInd setFrame:CGRectMake(125, 60, 37, 37)];
    [av addSubview:ActInd];
    [av show];
    [self showSuccess];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) showSuccess{
    
    /*
    operationQueue = [NSOperationQueue new];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(getEmpList)
                                                                              object:nil];
    // Add the operation to the queue and let it to be executed.
    [operationQueue addOperation:operation];
    
    */

    
    [NSThread detachNewThreadSelector:@selector (getEmpList)
                                       toTarget:self
                                     withObject:nil];
    
    
}

-(void) getEmpList{
    
    EmployeeMediator *mediator = [[EmployeeMediator alloc] init];
    empList = [mediator getEmployeeList];
    
    [self performSegueWithIdentifier:@"toEmployeeList" sender:self];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@" prepareForSegue Numbers of items %d " , [empList count]);
    
    if([[segue identifier] isEqualToString:@"toEmployeeList"]){
        
        EmployeeList *employeeList = [segue destinationViewController];
        
        // Hide back button
        [employeeList.navigationItem setHidesBackButton:YES];
        
        NSArray *myArray = [NSArray arrayWithArray:self.empList];
        employeeList.empList = myArray;
    }
    [av dismissWithClickedButtonIndex:0 animated:YES];
     av=nil;
    
}

@end
