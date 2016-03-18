---------------------------------------------------------------------------------
--
-- heartBeat.lua         脈博 輸入畫面
--
---------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )
local image, returnPress ,returnOver
--------------------------------------------------------------------------------
local returnPress = function ( self,event ) 
           composer.gotoScene( "bloodPressure", "fade", 400 )
end



function scene:create( event )
local sceneGroup = self.view

image = display.newImage( "bloodPressure-assets/Background01.png" )
image.x = display.contentCenterX
image.y = display.contentCenterY
	
sceneGroup:insert( image )
-----------------------------------------------------------------
---infoTable.freQuency =
-----------------------------------------------------------------
local labelColor = { 0 } 
	if ( themeID == "widget_theme_android_holo_dark" ) then
		labelColor = { 1 }
	end

local statusBox = display.newRect( 40, 60, display.contentWidth-80, 70 )
	statusBox.anchorX = 0
	statusBox:setFillColor( 0, 0, 0, 0.32 )
	sceneGroup:insert( statusBox )
	
	-- Status text
	local statusText = display.newText( "脈搏  Value:000", 80, 350, 200, 0, native.systemFont, 14 )
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
    -- Months
    { 
        align = "right",
        width =80 ,
        startIndex = 6,
        labels = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
    },
     { 
        align = "center",
        width = 120,
        startIndex = 6,
        labels = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
    },
     { 
        align = "center",
        width = 30,
        startIndex = 6,
        labels = {  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}
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
local currentMonth = "Column 1 Value: ".. values[1].value .. "\nColumn 2 Value: " .. values[2].value .. "\nColumn 3 Value: " .. values[3].value

print( currentMonth )
sceneGroup:insert( pickerWheel2 )


local function showValues( event )
		-- Retrieve the current values from the picker
		
		local values = pickerWheel2:getValues()
	
		-- Update the status box text
statusText.text = "脈搏  Value: " .. values[1].value ..values[2].value ..values[3].value 
--------------------------------------------------------------------------------	
local currentfreQuency = tonumber(values[1].value) *100 + tonumber(values[2].value)*10 + tonumber(values[3].value)
print("currentScore valus is =".. currentfreQuency)

infoTable.freQuency= currentfreQuency                                   
print("infoTable.freQuency= "..infoTable.freQuency)   
-------------------------------------------------------------------------------   
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
	   composer.removeScene( "bloodPressure" )
--------------------------------------------------------------------------------------------------
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
	
	print( "((destroying heatBeat's view))" )
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

