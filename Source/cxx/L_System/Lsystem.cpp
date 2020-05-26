//
//  Lsystem.cpp
//  L_System
//
//  Created by Connor yass on 2/23/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#include "Lsystem.hpp"

Lsystem::Lsystem(){
}

void Lsystem::Itterate(){
	std::string temp;
	for(int i = 0; i < sentance.size(); i++){
		bool found = false;
		for(int n = 0; n < rules.size(); n++){
			if(sentance.at(i) == rules[n].a){
				temp.append(rules[n].b);
				found = true;
				break;
			}
		}
		if(!found){
			temp += sentance.at(i);
		}
	}
	itterationCount++;
	sentance = temp;
	printSentance();
}

void Lsystem::printSentance(){
	std::cout << "#" << itterationCount << "\t" << sentance << std::endl;
}
