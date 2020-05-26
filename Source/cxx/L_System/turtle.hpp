//
//  turtle.hpp
//  L_System
//
//  Created by Connor yass on 2/23/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#ifndef turtle_hpp
#define turtle_hpp

#include <SFML/Graphics.hpp>	/* S F M L */
#include <stdio.h>
#include <cmath>
#include <iostream>
#include <stack>

#include "Lsystem.hpp"
#include "structs.hpp"

class turtle
{
public:
	turtle(sf::RenderTexture*, Lsystem*);
	void draw(float, float);
	
	sf::Vector2f startPos;
	void home();
	
	sf::Color getColor(double, double);
	
	sf::RenderTexture* RT;
	Lsystem* LS;
	
	std::stack<sf::Vector2f> positionStack;
	std::stack<double> angleStack;

	float angle = 90;

	//diaplay stuff
	sf::RectangleShape line;
};

#endif /* turtle_hpp */
