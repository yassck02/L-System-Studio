//
//  Manager.cpp
//  L_System
//
//  Created by Connor yass on 2/24/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#include "Manager.hpp"

Manager::Manager(Lsystem* ls, turtle* t) : LS(ls), T(t){
	readCommand();
}

Manager::~Manager(){
	file.close();
}



void Manager::readCommand()
{
	std::string command;
	std::cout << "command: ";
	getline(std::cin, command);
	
	std::vector<std::string> tokens;
	tokenize(command, &tokens);
	
	std::cout << "Name: " << tokens[0] << std::endl;

	LS->sentance = tokens[1];
	std::cout << "Axiom: " << tokens[1] << std::endl;

	T->angle = std::stoi(tokens[2]);
	std::cout << "Angle: " << tokens[2] << std::endl;

	LS->rules.clear();
	
	rule tempRule;
	for(int i = 3; i < tokens.size(); i += 2){
		tempRule.a = tokens[i].at(0);
		tempRule.b = tokens[i+1];
		std::cout << "Rule #" << i << "\t" << tokens[i] << " -> " << tokens[i+1] << std::endl;
		LS->rules.push_back(tempRule);
	}
	
	LS->itterationCount = 0;
	
	T->home();
}


void Manager::tokenize(std::string sentance, std::vector<std::string>* v)
{
	std::cout << "tolkenizing...\n";
	
	std::string temp = "";
	bool is_delimiter = false;
	
	std::vector<char> delimiters = {
		' ', '>', ',', ':', ')', '('
	};
	
	for(int i = 0; i < sentance.length(); i++)
	{
		is_delimiter = false;
		
		char character = sentance.at(i);
		
		for(int n = 0; n < delimiters.size(); n++){	//search to see if we hit a delimiter character
			if(character == delimiters[n]){
				is_delimiter = true;
			}
		}
		
		if(is_delimiter == false){					//if its not a delimiter, append it to the current string
			temp += character;
		} else {										//if it is a delimiter,
			if(temp != ""){
				v->push_back(temp);					//add the current string to the list if its not empty
				std::cout << "\tread string: " << temp <<std::endl;
			}
			temp = "";
		}
	}
	std::cout << "...done!\n";
}



