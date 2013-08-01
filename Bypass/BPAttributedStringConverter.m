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


@implementation BPAttributedStringConverter

- (NSAttributedString *)convertDocument:(BPDocument *)document {
    BPAttributedTextVisitor *visitor = [BPAttributedTextVisitor new];
    BPElementWalker *walker = [BPElementWalker new];

    [walker addElementVisitor:visitor];
    [walker walkDocument:document];

    NSAttributedString *attributedString = visitor.attributedText;
    return attributedString;
}

@end
