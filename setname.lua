---------------------------------------------------------------------------------
--
-- setname.lua
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

image = display.newImage( "black.jpg" )
image.x = display.contentCenterX
image.y = display.contentCenterY
	
sceneGroup:insert( image )




-----------------------------------------------------------------------



-- Configure the picker wheel columns
local numericField = native.newTextField(150, 150, 220, 36)
          numericField.inputType = "default"


--------------------------------------------------------------------------------	--------------------------------------------------------------------------------	
local currentname = "default"
print("currentScore valus is =".. currentname)

infoTable.name= currentname                          
print("infoTable.name= "..infoTable.name)   
-------------------------------------------------------------------------------  --------------------------------------------------------------------------------	 
	



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



		return true
	end




-------------------------------------------------
function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "2: show event, phase did" )
--------------------------------------------------------------------------------------------------	
		-- remove previous scene's view
	   composer.removeScene( "mySettings" )
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

