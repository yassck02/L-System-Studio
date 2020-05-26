//
//  turtle.cpp
//  L_System
//
//  Created by Connor yass on 2/23/17.
//  Copyright © 2017 Connor_yass. All rights reserved.
//

#include "turtle.hpp"

turtle::turtle(sf::RenderTexture* rt, Lsystem* ls) : RT(rt), LS(ls)
{
	home();
}

void turtle::draw(float lineLength, float lineThicknes)
{
	RT->clear(sf::Color(10,10,10));
	line.setSize(sf::Vector2f(lineLength, lineThicknes));
	
	std::string temp = LS->sentance;
	sf::Vector2f currentPos = startPos;
	double currentAngle = 0;
	int stringLength = temp.size();
	
	for(int i = 0; i < stringLength; i++){
		char character = temp.at(i);
		switch(character){
			case 'F':	//move forward and draw a line
				line.setRotation(currentAngle);
				line.setPosition(currentPos);
				currentPos = sf::Vector2f(currentPos.x += cos(currentAngle*M_PI/180.0) * lineLength,
										  currentPos.y += sin(currentAngle*M_PI/180.0) * lineLength);
				line.setFillColor(getColor(i, stringLength));
				RT->draw(line);
				break;
			case 'f':	//move forward without drawing
				currentPos = sf::Vector2f(currentPos.x += cos(currentAngle*M_PI/180.0) * lineLength,
										  currentPos.y += sin(currentAngle*M_PI/180.0) * lineLength);
				break;
			case '+':	//rotate left
				currentAngle -= angle;
				break;
			case '-':	//rotate right
				currentAngle += angle;
				break;
			case '[':
				positionStack.push(currentPos);
				angleStack.push(currentAngle);
				break;
			case ']':
				currentPos = positionStack.top();
				positionStack.pop();
				currentAngle = angleStack.top();
				angleStack.pop();
				break;
			default:
				break;
		}

	}
	RT->display();
}


void turtle::home()
{
	startPos = sf::Vector2f(RT->getSize().x / 2, RT->getSize().y / 2);

}



/*
 this function can be used to generate a rainbow
 by itterating the i value from 0 to max
 */
sf::Color turtle::getColor(double i, double max)
{
	float red   = (sin(i/max * 2 * M_PI - 3*M_PI/2 )	+1)	* 127.0;
	float green = (sin(i/max * 2 * M_PI + M_PI	 )	+1)	* 127.0;
	float blue  = (sin(i/max * 2 * M_PI			 )	+1)	* 127.0;
	return sf::Color(red, green, blue);
}
