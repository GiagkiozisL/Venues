
#import "DTMapViewController.h"

@interface DTMapViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) CLLocation *location;
@end

MKMapView *mapView;
@implementation DTMapViewController 

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mapView setShowsUserLocation:YES];
    self.title = @"Map View";
}

-(void)viewWillAppear:(BOOL)animated
{
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.mapView];
}

@end
