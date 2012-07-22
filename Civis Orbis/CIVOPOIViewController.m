//
//  CIVOPOIViewController.m
//  Civis Orbis
//
//  Created by Kris Markel on 7/21/12.
//  Copyright (c) 2012 Civis Orbis. All rights reserved.
//

#import "CIVOPOIViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "POI.h"

@interface CIVOPOIViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *checkInButton;
@property (weak, nonatomic) IBOutlet UILabel *atSiteLabel;

- (void) configureView;

@end

@implementation CIVOPOIViewController
@synthesize textView;
@synthesize checkInButton;
@synthesize atSiteLabel;

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
	// Do any additional setup after loading the view from its nib.
	
	[self configureView];
	
	// Fancy up the button.
	self.checkInButton.titleLabel.font = [UIFont fontWithName:@"IM FELL English" size:20];
	
	// Fancy up the text.
	self.textView.font = [UIFont fontWithName:@"Fondamento" size:18];
	self.atSiteLabel.font = [UIFont fontWithName:@"Fondamento" size:14];

}

- (void) viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidUnload
{
	[self setTextView:nil];
	[self setCheckInButton:nil];
	[self setAtSiteLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Properties

- (void) setPOI:(POI *)newPOI
{
	if (_POI != newPOI) {
		_POI = newPOI;
		
		// Update the view.
		[self configureView];
	}
}

#pragma mark - Private

- (void) configureView
{
	self.title = self.POI.name;
	self.textView.text = self.POI.text;
}

@end
