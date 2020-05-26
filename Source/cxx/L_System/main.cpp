#include <SFML/Graphics.hpp>	/* S F M L				*/
#include <iostream>			/* cout, cin				*/
#include <stdlib.h>			/* srand, rand, abs		*/

#include "Lsystem.hpp"
#include "turtle.hpp"
#include "Manager.hpp"

int windowSizeX = 2000;
int windowSizeY = 1500;
int windowPosX = 100;
int windowPosY = 100;

const sf::Color backgroundColor = sf::Color(220,220,220);

sf::Vector2i currentMousePos;
sf::Vector2i lastClickMousePos;
sf::Vector2i startMouseClickPos;
sf::Vector2i endMouseClickPos;
sf::Vector2f mouse_gridOffset;
bool mousePressed_right = false;
bool mousePressed_left = false;

/*
 Main functions
 */
int main()
{
	sf::RenderWindow window(sf::VideoMode(windowSizeX, windowSizeY), "Floor Plan Generator [FPG]");										//main window creation
	window.setPosition(sf::Vector2i(windowPosX,windowPosY));
	window.setFramerateLimit(15);		//limit the frame rate
	
	sf::RenderTexture texture;
	texture.create(windowSizeX, windowSizeY);
	sf::Sprite sprite;
	
	Lsystem LS;
	turtle T(&texture, &LS);
	Manager P(&LS, &T);

	float lineThickness = 3;
	float lineLength = 15;
	
	bool stateChanged = true;
	
	while (window.isOpen())
	{
		currentMousePos = sf::Mouse::getPosition(window);

		sf::Event event;
		while (window.pollEvent(event)){
			switch (event.type){
				case sf::Event::Closed:
					window.close();
					break;
				case sf::Event::KeyPressed:
					switch(event.key.code){
						case sf::Keyboard::Space:
							LS.Itterate();
							stateChanged = true;
							break;
						case sf::Keyboard::R:
							P.readCommand();
							stateChanged = true;
							break;
						case sf::Keyboard::H:
							T.home();
							stateChanged = true;
							break;
						default:
							break;
					}
				case sf::Event::MouseButtonPressed:
					switch (event.mouseButton.button){
						case sf::Mouse::Button::Left:
							mousePressed_left = true;
							lastClickMousePos = sf::Mouse::getPosition(window);
							mouse_gridOffset = (sf::Vector2f(lastClickMousePos) - T.startPos);
							break;
						case sf::Mouse::Button::Right:
							mousePressed_right = true;
							break;
						default:
							break;
					}
					break;
				case sf::Event::MouseButtonReleased:
					switch (event.mouseButton.button){
						case sf::Mouse::Button::Left:
							mousePressed_left = false;
							endMouseClickPos = sf::Mouse::getPosition(window);
							break;
						case sf::Mouse::Button::Right:
							mousePressed_right = false;
							break;
						default:
							break;
					}
					break;
				case sf::Event::MouseWheelMoved:
					lineLength += event.mouseWheel.delta;
					if(lineLength > 200){
						lineLength = 200;
					} else if(lineLength < 10){
						lineLength = 10;
					}
					stateChanged = true;
					break;
				case sf::Event::Resized:
					windowSizeX = event.size.width;
					windowSizeY = event.size.height;
					window.setView(sf::View(sf::FloatRect(0, 0, event.size.width, event.size.height)));
					texture.create(windowSizeX, windowSizeY);
					break;
				default:
					break;
			}
		} //while (window.pollEvent(event)){
		
		window.clear(backgroundColor);	//clear the window with the background color
		
		
		if(mousePressed_left){
			T.startPos = sf::Vector2f(currentMousePos) - mouse_gridOffset;
			stateChanged = true;
		}
		
		if (stateChanged) {
			std::cout << "state chenged, updating...\n";
			T.draw(lineLength, lineThickness);
			sprite.setTexture(texture.getTexture());
			stateChanged = false;
		}
		window.draw(sprite);
		
		
		
		window.display();				//show the window
		
	} //while (window.isOpen()){
	
	std::cout << "Program is terminating..." << std::endl;		//log
	
	return EXIT_SUCCESS;
}





