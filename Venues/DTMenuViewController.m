
#import "DTMenuViewController.h"
#import "DTMainViewController.h"
#import "DTSideMenuViewController.h"

@interface DTMenuViewController ()
@property (nonatomic,strong) UIImageView *backgroundImageView;
@end

@implementation DTMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"galaxy"]];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGRect imageViewRect = [[UIScreen mainScreen] bounds];
    imageViewRect.size.width += 589;
    self.backgroundImageView.frame = imageViewRect;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.backgroundImageView];
    
    NSDictionary *viewDictionary = @{ @"imageView" : self.backgroundImageView };
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]" options:0 metrics:nil views:viewDictionary]];
    
    //draw menu item #1
    UIButton *menuItem1 = [UIButton buttonWithType:UIButtonTypeSystem];
    menuItem1.frame = CGRectMake(10.0f, 100.0f, 200.0f, 44.0f);
    [menuItem1 setBackgroundColor:[UIColor whiteColor]];
    [menuItem1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuItem1 setTitle:@"Menu Item #1" forState:UIControlStateNormal];
    [menuItem1 addTarget:self action:@selector(menuItem1Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuItem1];
    
    //draw menu item #2
    UIButton *menuItem2 = [UIButton buttonWithType:UIButtonTypeSystem];
    menuItem2.frame = CGRectMake(10.0f, 200.0f, 200.0f, 44.0f);
    [menuItem2 setTitle:@"Menu Item #2" forState:UIControlStateNormal];
    [menuItem2 setBackgroundColor:[UIColor whiteColor]];
    [menuItem2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuItem2 addTarget:self action:@selector(menuItem2Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuItem2];
    
    //draw menu item #3
    UIButton *menuItem3 = [UIButton buttonWithType:UIButtonTypeSystem];
    menuItem3.frame = CGRectMake(10.0f, 300.0f, 200.0f, 44.0f);
    [menuItem3 setTitle:@"Menu Item #3" forState:UIControlStateNormal];
    [menuItem3 setBackgroundColor:[UIColor whiteColor]];
    [menuItem3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [menuItem3 addTarget:self action:@selector(menuItem3Pressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuItem3];
    
}
-(void)menuItem3Pressed {
    [self.sideMenuViewController closeMenuAnimated:YES completion:nil];
}

- (void)menuItem2Pressed {
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:[DTMainViewController new]];
    [self.sideMenuViewController setMainViewController:controller animated:YES closeMenu:YES];
}

- (void)menuItem1Pressed {
    [self.sideMenuViewController closeMenuAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
