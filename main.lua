-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- created by Momin Ahmed
-- created on April 2018
-- after giving the number of toppings and the size of pizza this code will tell you your 
-- total bill
-- 
-----------------------------------------------------------------------------------------
-- 

local numberOfToppingsTextField = native.newTextField( display.contentCenterX,
display.contentCenterY - 400, 450, 125 )	
numberOfToppingsTextField.id = "numberOfToppings TextField"

local sizeOfPizzaTextField = native.newTextField( display.contentCenterX,
display.contentCenterY - 200, 450, 125 )	
sizeOfPizzaTextField.id = "sizeOfPizza TextField"

local sizeTextField = display.newText( "which size of pizza would you like",
display.contentCenterX, display.contentCenterY - 300, native.systemFont, 75 )
sizeTextField.id = "size TextField"
sizeTextField:setFillColor( 1, 1, 1 )

local toppingsTextField = display.newText( "what kind of toppings would you like",
display.contentCenterX, display.contentCenterY - 500, native.systemFont, 75 )
toppingsTextField.id = "toppings TextField"
toppingsTextField:setFillColor( 1, 1, 1 )

local subtotalTextField = display.newText( "",
display.contentCenterX, display.contentCenterY + 200, native.systemFont, 75 )
subtotalTextField.id = "subtotal TextField"
subtotalTextField:setFillColor( 1, 1, 1 )

local totalTextField = display.newText( "",
display.contentCenterX, display.contentCenterY + 300, native.systemFont, 75 )
totalTextField.id = "total TextField"
totalTextField:setFillColor( 1, 1, 1 )

local taxTextField = display.newText( "",
display.contentCenterX, display.contentCenterY + 400, native.systemFont, 75 )
taxTextField.id = "tax TextField"
taxTextField:setFillColor( 1, 1, 1 )


local calculateButton = display.newImageRect( "./assets/sprites/enterButton.png", 406, 157)
calculateButton.x = display.contentCenterX
calculateButton.y = display.contentCenterY
calculateButton.id = "calculate button"

local tax = 0.13
local oneTopping = 1.00
local twoToppings = 1.75
local threeToppings = 2.50
local fourToppings = 3.35
local large = 6.00
local extralarge = 10.00
local givenToppings
local givenSize
local subtotal
local totalTax

local function calculateButtonTouch( event )

	givenToppings = tonumber(numberOfToppingsTextField.text)
    givenSize = sizeOfPizzaTextField.text

    if givenSize == "large" then
    	subtotal = 6.00
    else
    	subtotal = 10.00
    end

    if (givenToppings == 1) then
    	subtotal = subtotal + oneTopping
    elseif (givenToppings == 2) then
    	subtotal = subtotal + twoToppings
    elseif (givenToppings == 3) then
    	subtotal = subtotal + threeToppings
    elseif (givenToppings == 4) then
    	subtotal = subtotal + fourToppings
    end

    subtotalTextField.text = "The subtotal cost is $" .. string.format("%.2f", subtotal)

    total = subtotal + (subtotal * tax)
	totalTextField.text = "The total cost is $" .. string.format("%.2f", total)
    
    totalTax = subtotal * tax
    taxTextField.text = "The totalTax cost is $" .. string.format("%.2f", totalTax)
    
	return true
end

calculateButton:addEventListener( "touch", calculateButtonTouch)





