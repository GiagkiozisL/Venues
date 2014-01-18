
#import "TableCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation TableCell

@synthesize priceLabel = _priceLabel;
@synthesize areaLabel = _areaLabel;
@synthesize streetLabel = _streetLabel;
@synthesize houseNameLabel = _houseNameLabel;
@synthesize houseImage = _houseImage;
@synthesize shadowView = _shadowView;
@synthesize shadowImage = _shadowImage;
@synthesize favoriteBtn = _favoriteBtn;

bool isFav ;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)layoutSubviews {
    
    if (!self.laidOut) {
        CAGradientLayer *l = [CAGradientLayer layer];
        l.frame = self.shadowView.bounds;
        UIColor* startColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        UIColor* endColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        l.colors = [NSArray arrayWithObjects:(id)startColor.CGColor, (id)endColor.CGColor, nil];
        [self.shadowView.layer addSublayer:l];
        
        CAGradientLayer *topShadow = [CAGradientLayer layer];
        topShadow.frame = CGRectMake(0, -3, 320, 3);
        UIColor* startColor2 = [UIColor colorWithWhite:0.0 alpha:0.0];
        UIColor* endColor2 = [UIColor colorWithWhite:0.0 alpha:0.1];
        topShadow.colors = [NSArray arrayWithObjects:(id)startColor2.CGColor, (id)endColor2.CGColor, nil];
        [self.layer addSublayer:topShadow];
        
        self.laidOut = YES;

    }
}

- (void)highlightButton:(UIButton *)favoriteBtn {
    
    
    if(isFav == false){
        [favoriteBtn setImage:[UIImage imageNamed:@"star-y.png"] forState:UIControlStateNormal];
       isFav = true;
        [favoriteBtn setHighlighted:YES];
    }
    else
    {
        isFav = true;
        [favoriteBtn setImage:[UIImage imageNamed:@"star-g.png"] forState:UIControlStateNormal];
        [favoriteBtn setHighlighted:NO];
       
    }
    
   
}

- (IBAction)onTouchup:(UIButton *)sender {
  [self performSelector:@selector(highlightButton:) withObject:sender afterDelay:0.0];
}


@end
