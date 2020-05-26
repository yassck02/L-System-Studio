//
//  structs.h
//  L_System
//
//  Created by Connor yass on 2/24/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#ifndef structs_hpp
#define structs_hpp

#include <string>

struct rule{
	char a;
	std::string b;
};

struct preset{
	std::string name;
	rule rule1;
	rule rule2;
	std::string startingString;
	float angle;
};

#endif /* structs_h */
