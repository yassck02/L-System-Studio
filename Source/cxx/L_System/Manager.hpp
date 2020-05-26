//
//  Manager.hpp
//  L_System
//
//  Created by Connor yass on 2/24/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#ifndef Manager_hpp
#define Manager_hpp

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <cstring>

#include "Lsystem.hpp"
#include "turtle.hpp"
#include "structs.hpp"

class Manager{

public:
	Manager(Lsystem*, turtle*);
	~Manager();
	
	Lsystem* LS;
	turtle* T;
	
	void readPreset();
	void readCommand();
	void tokenize(std::string,
				  std::vector<std::string>*);
	
	std::fstream file;
};

#endif /* Manager_hpp */
