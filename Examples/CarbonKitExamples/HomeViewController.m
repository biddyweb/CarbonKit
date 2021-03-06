#import "HomeViewController.h"

#import "ViewControllerOne.h"
#import "ViewControllerTwo.h"
#import "ViewControllerThree.h"

#import "CarbonKit.h"

@interface HomeViewController () <CarbonTabSwipeDelegate>
{
	CarbonTabSwipeNavigation *tabSwipe;
}

@end

@implementation HomeViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
	
	self.title = @"CarbonKit";
	self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
	
	NSArray *names = @[@"ONE", @"TWO", @"THREE"];
	UIColor *color = [UIColor colorWithRed:0.753 green:0.224 blue:0.169 alpha:1];
	tabSwipe = [[CarbonTabSwipeNavigation alloc] createWithRootViewController:self tabNames:names tintColor:color delegate:self];
	[tabSwipe setNormalColor:[UIColor colorWithWhite:1 alpha:0.8]];
	[tabSwipe setSelectedColor:[UIColor whiteColor]];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

# pragma mark - Carbon Tab Swipe Delegate

- (UIViewController *)tabSwipeNavigation:(CarbonTabSwipeNavigation *)tabSwipe viewControllerAtIndex:(NSUInteger)index {
	
	if (index == 0) {
		ViewControllerOne *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerOne"];
		return viewController;
	} else if (index == 1) {
		ViewControllerTwo *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerTwo"];
		return viewController;
	} else {
		ViewControllerThree *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerThree"];
		return viewController;
	}
}

@end
