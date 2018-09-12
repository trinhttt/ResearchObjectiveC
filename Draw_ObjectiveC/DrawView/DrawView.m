//
//  DrawView.m
//  Draw_ObjectiveC
//
//  Created by Thai Thi Tu Trinh on 9/11/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"


@interface DrawView ()

@property (nonatomic, strong) NSMutableDictionary *linesInProgress;// lop kieu dictionary co th thay doi
@property (nonatomic,strong) NSMutableArray* finishedLines;// lớp mảng của các đối tượng có thể thay đổi

@end

@implementation DrawView

// - (instancetype): ham khoi tao

- (void)awakeFromNib {
    [super awakeFromNib];
    self.finishedLines = [[NSMutableArray alloc] init];
    self.linesInProgress = [[NSMutableDictionary alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.finishedLines = [[NSMutableArray alloc] init];
        self.linesInProgress = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) initObject {
    
}

//- (instancetype) init
//{
//    self = [super init];
//    self.finishedLines = [[NSMutableArray alloc] init];
//    self.linesInProgress = [[NSMutableDictionary alloc] init];
//    return self;
//}

- (void)strokeLine:(Line*)line
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint: line.begin];
    [path addLineToPoint: line.end];
    path.lineWidth = 2;
    path.lineCapStyle = kCGLineCapRound;
    [path stroke];
}
- (void)drawRect:(CGRect)rect
{
    for (Line *line in self.finishedLines) {
        [self strokeLine: line];
    }
    for (Line *line in [self.linesInProgress allValues]) {
        [[UIColor redColor] set];
        [self strokeLine:line];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        Line *line = [[Line alloc] init];
        line.begin = location;
        line.end = location;
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        self.linesInProgress[key] = line;
    }
     [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        CGPoint location = [t locationInView:self];
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.linesInProgress[key];
        line.end = location;
    }
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    for (UITouch *t in touches)
    {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        Line *line = self.linesInProgress[key];
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}
@end
