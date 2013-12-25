
#import "DTMainViewController.h"
#import "DTSideMenuViewController.h"
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
    self.navigationItem.leftBarButtonItem = menuItem;

}

- (void)openButtonPressed {
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"TableCell";
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
   
    cell.houseNameLabel.text = @"Pansion Something";
    cell.areaLabel.text = @"village x";
    cell.priceLabel.text = @"2436 $";
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
