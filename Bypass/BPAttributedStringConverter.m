//
//  BPAttributedStringConverter.m
//  Bypass
//
//  Created by Matthias Tretter on 01.08.13.
//  Copyright (c) 2013 Uncodin, Inc. All rights reserved.
//

#import "BPAttributedStringConverter.h"
#import "BPAttributedTextVisitor.h"
#import "BPDisplaySettings.h"
#import "BPDocument.h"
#import "BPElementWalker.h"


@interface BPAttributedStringConverter ()

@property (nonatomic, strong) BPAttributedTextVisitor *visitor;
@property (nonatomic, strong) BPElementWalker *walker;

@end

@implementation BPAttributedStringConverter

- (id)init
{
    self = [super init];
    if (self) {
        _visitor = [BPAttributedTextVisitor new];
        _walker = [BPElementWalker new];
        [_walker addElementVisitor:_visitor];
    }
    return self;
}

- (NSAttributedString *)convertDocument:(BPDocument *)document
{
    [_visitor resetAttributedText];
    [_walker walkDocument:document];

    NSMutableAttributedString *attributedString = _visitor.attributedText;
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[_visitor.displaySettings defaultColor]
                             range:NSMakeRange(0, attributedString.length)];

    return attributedString;
}

- (void)setDisplaySettings:(BPDisplaySettings *)displaySettings {
    _visitor.displaySettings = displaySettings;
}

- (BPDisplaySettings *)displaySettings {
    return _visitor.displaySettings;
}

@end
