---------------------------------------------------------------------------------
--
-- setbloodtype.lua
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )
local image, returnPress ,returnOver
--------------------------------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "mySettings", "fade", 400 )
end


function scene:create( event )
local sceneGroup = self.view

image = display.newImage( "bloodPressure-assets/Background01.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY
	
sceneGroup:insert( image )


local labelColor = { 0 }
	if ( themeID == "widget_theme_android_holo_dark" ) then
		labelColor = { 1 }
	end

local statusBox = display.newRect( 40, 60, display.contentWidth-80, 70 )
	statusBox.anchorX = 0
	statusBox:setFillColor( 0, 0, 0, 0.32 )
	sceneGroup:insert( statusBox )
	
	-- Status text
	local statusText = display.newText( "血型 Value:000", 80, 350, 200, 0, native.systemFont, 14 )
	statusText:setFillColor( unpack(labelColor) )
	statusText.anchorX = 0
	statusText.x = 60
	statusText.y = 95
	sceneGroup:insert( statusText )

	statusBox.height = statusText.height+16
	statusBox.y = statusText.y


-----------------------------------------------------------------------



-- Configure the picker wheel columns
local columnData = 
{
   { 
        align = "right",
        width =160 ,
        startIndex = 1,
        labels = { "A", "B", "AB", "O"}
    },
}

-- Image sheet options and declaration
local options = {
    frames = 
    {
        { x=0, y=0, width=320, height=222 },
        { x=320, y=0, width=320, height=222 },
        { x=640, y=0, width=8, height=222 }
    },
    sheetContentWidth = 648,
    sheetContentHeight = 222
}

-- Create the widget
local pickerWheel2 = widget.newPickerWheel
{
    top = display.contentHeight - 300,
    columns = columnData,
    sheet = pickerWheelSheet,
    overlayFrame = 1,
    overlayFrameWidth = 320,
    overlayFrameHeight = 222,
    backgroundFrame = 2,
    backgroundFrameWidth = 320,
    backgroundFrameHeight = 222,
    separatorFrame = 3,
    separatorFrameWidth = 8,
    separatorFrameHeight = 222,
    columnColor = { 0, 0, 0, 0 },
    fontColor = { 0.4, 0.4, 0.4, 0.5 },
 --   fontColorSelected = { 0.2, 0.6, 0.4 }
}

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event

local values = pickerWheel2:getValues()

-- Get the value for each column in the wheel (by column index)
local currentMonth = values[1].value

print( currentMonth )
sceneGroup:insert( pickerWheel2 )


local function showValues( event )
		-- Retrieve the current values from the picker
		
		local values = pickerWheel2:getValues()
		
		-- Update the status box text
statusText.text = "血型  Value: " .. values[1].value 
--------------------------------------------------------------------------------	--------------------------------------------------------------------------------	
local currentsetbloodtype =statusText.text 
print("currentScore valus is =".. currentsetbloodtype)

infoTable.setbloodtype= currentsetbloodtype                           
print("infoTable.setbloodtype= "..infoTable.setbloodtype)   
-------------------------------------------------------------------------------  --------------------------------------------------------------------------------	 
	
		
		return true
	end



local getValuesButton = widget.newButton {
	left = 10,
	top = 135,
	width = 192,
	height = 32,
	id = "getValues",
	label = "update values",
	onRelease = showValues,
}
sceneGroup:insert( getValuesButton )
getValuesButton.x = display.contentCenterX

local returnPress = widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/returnPress.png",
	overFile = "bloodPressure-assets/returnOver.png",
	emboss = true,
	onPress = returnPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(returnPress)
    returnPress.x =display.contentWidth/10
	returnPress.y =display.contentHeight/16

end



-------------------------------------------------
function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "2: show event, phase did" )
--------------------------------------------------------------------------------------------------	
		-- remove previous scene's view
	   composer.removeScene( "bloodSugar" )
--------------------------------------------------------------------------------------------------
		-- remove previous scene's view
	--	composer.removeScene( "scene1" )
	end
end

function scene:hide( event )
	
	local phase = event.phase
	if "will" == phase then
	
		print( "2: hide event, phase will" )
	
		-- remove touch listener for image
	--	image:removeEventListener( "touch", image)
	
		-- cancel timer
		-- timer.cancel( memTimer ); memTimer = nil;

	end
end

function scene:destroy( event )
	
	print( "((destroying scene 2's view))" )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene

---------------------------------------------------------------------------------

