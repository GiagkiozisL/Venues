
#import "DTMainViewController.h"
#import "DTSideMenuViewController.h"
#import "DTMapViewController.h"
#import "ControlVariables.h"
#import "TableCell.h"

@interface DTMainViewController ()
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation DTMainViewController


#pragma - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.title = @"Main View";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *menuItem = [[UIBarButtonItem alloc] initWithTitle:@"Hamburger" style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(openMap)];
    self.navigationItem.leftBarButtonItem = menuItem;
    self.navigationItem.rightBarButtonItem = mapItem;
}

-(void)openMap {
    DTMapViewController *mapController = [[DTMapViewController alloc]init];
    [self.navigationController pushViewController:mapController animated:YES];
}

- (void)openButtonPressed {
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (PFQuery *)queryForTable {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Venues"];
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    [query whereKey:@"name" notEqualTo:@"Something"];
    return query;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.objects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
            object:(PFObject *)object{
    static NSString *simpleTableIdentifier = @"TableCell";
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
   
   cell.houseNameLabel.text = object [@"name"];
    cell.areaLabel.text = object [@"area"];
//    cell.priceLabel.text = object [@"price"];
    cell.streetLabel.text = object [@"municipality"];
    cell.houseImage.image = [UIImage imageNamed:@"karageorgou1"];
    cell.shadowImage.image = [UIImage imageNamed:@"profile-stats-bg"];
    //   cell.houseNameLabel.text = [tableData objectAtIndex:indexPath.row];
    //    cell.houseImage.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
 //   cell.priceLabel.text = [prepTime objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

@end
