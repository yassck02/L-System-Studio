//
//  Lsystem.hpp
//  L_System
//
//  Created by Connor yass on 2/23/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#ifndef Lsystem_hpp
#define Lsystem_hpp

#include <iostream>
#include <stdio.h>
#include <vector>
#include <string>

#include "structs.hpp"

class Lsystem{
	
public:
	Lsystem();
	std::string sentance;
	void Itterate();
	
	std::vector<rule> rules;
	int itterationCount;
	void printSentance();
};

#endif /* "system_hpp */
