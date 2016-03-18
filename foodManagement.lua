
---------------------------------------------------------------------------------
-- 
-- foodManagement.lua
--
---------------------------------------------------------------------------------
local image
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )

local returnPress,returnOver,nextPress,nextOver

local returnPress = function ( self,event ) 
           composer.gotoScene( "menuPage", "fade", 400 )
end

local nextPress = function ( self,event ) 
           composer.gotoScene( "calorificCapacitynumber", "fade", 400 )
end

---------------------------------------------------------------------------------

	
	-- Store tabBar height in Composer variable
	--composer.setVariable( "tabBarHeight", tabBar.height )

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "foodManagement-assets/Background.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
	
 local nextPress = widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/nextPress.png",
	overFile = "bloodPressure-assets/nextOver.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.4
	nextPress.y =display.contentHeight/1.35

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
-----------------------------------------------------------------------------------------------------

-- scene:addEventListener( "create" )

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "2: show event, phase did" )
	
		-- remove previous scene's view
		--composer.removeScene( "scene1" )
	end
end

function scene:hide( event )
	
	local phase = event.phase
	if "will" == phase then
	
		print( "2: hide event, phase will" )
	
		-- remove touch listener for image
		image:removeEventListener( "touch", image )
	
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
