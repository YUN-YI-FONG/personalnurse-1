
---------------------------------------------------------------------------------
-- 
-- mySettings.lua
--
---------------------------------------------------------------------------------
local image
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )

local returnPress = function ( self,event ) 
           composer.gotoScene( "menuPage", "fade", 400 )
end
local nextPress = function ( self,event ) 
           composer.gotoScene( "setname", "fade", 400 )
end
local nextPress1 = function ( self,event ) 
           composer.gotoScene( "setbloodtype", "fade", 400 )
end

local nextPress2 = function ( self,event ) 
           composer.gotoScene( "setage", "fade", 400 )
end
------------------------------------------------------------------------


	
	-- Store tabBar height in Composer variable
	--composer.setVariable( "tabBarHeight", tabBar.height )

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "bloodPressure-assets/backGround.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	image.touch = onSceneTouch
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
print("infoTable.name[mySettings.lua]) = ".. infoTable.name)	

if infoTable.name == 0 then
	
	local myText = display.newText("no name", display.contentWidth/2.2,display.contentHeight/2.65, native.systemFontBold,50)
    myText:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText)
  
else	
   
   local myText = display.newText(infoTable.name, display.contentWidth/2.2,display.contentHeight/2.65, native.systemFontBold,50)
    myText:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText)
 end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 	

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
 print("infoTable.setbloodtype[mySettings.lua]) = ".. infoTable.setbloodtype)	

if infoTable.setbloodtype == 0 then
	
	local myText1 = display.newText("A", display.contentWidth/2.2,display.contentHeight/1.7, native.systemFontBold,50)
    myText1:setTextColor(1, 0.2, 0.11) 
    sceneGroup:insert(myText1)
    
else	
   
   local myText1 = display.newText(infoTable.setbloodtype, display.contentWidth/2.2,display.contentHeight/1.7, native.systemFontBold,50)
    myText1:setTextColor(1, 0.2, 0.11) 

 sceneGroup:insert(myText1)
 
 end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 print("infoTable.setage[mySettings.lua]) = ".. infoTable.setage)	

if infoTable.setage == 0 then
	
	local myText2 = display.newText("000", display.contentWidth/2.2,display.contentHeight/1.25, native.systemFontBold,50)
    myText2:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText2)
    
else	
   
   local myText2 = display.newText(infoTable.setage, display.contentWidth/2.2,display.contentHeight/1.25, native.systemFontBold,50)
    myText2:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText2)
 end
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
sceneGroup:insert( image )
local nextPress = widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/nextPress.png",
	overFile = "bloodPressure-assets/nextOver.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.5
	nextPress.y =display.contentHeight/3.7
	
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

local nextPress1= widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/nextPress.png",
	overFile = "bloodPressure-assets/nextOver.png",
	emboss = true,
	onPress = nextPress1,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress1)
    nextPress1.x =display.contentWidth/1.5
	nextPress1.y =display.contentHeight/2.1
	
local nextPress2= widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/nextPress.png",
	overFile = "bloodPressure-assets/nextOver.png",
	emboss = true,
	onPress = nextPress2,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress2)
    nextPress2.x =display.contentWidth/1.5
	nextPress2.y =display.contentHeight/1.5

end



function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		
	
		-- remove previous scene's view
	--	composer.removeScene( "setname" )
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
