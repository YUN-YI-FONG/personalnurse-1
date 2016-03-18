------------------------------------------------------------------------------------------------------
--
-- MenuPage.lua       dispatch buttom  command to  bloodPressure.lua
--                                                                                                      bloodSuger.lua
--                                                                                                               weight.lua
--                                                                                                            mySport.lua                                       
--                                                                                       foodManagement.lua       
--                                                                                            processProgress.lua
----------------------------------------------------------------------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )

---------------------------------------------------------------------------
--宣告所有全域變數數值為基礎０
 infoTable.name = 0
 print("infoTable.name[MenuPage.lua]) = ".. infoTable.name)
 
 infoTable.freQuency = 0
 print("infoTable.freQuency[MenuPage.lua]) = ".. infoTable.freQuency)
 
 infoTable.systolicPressure = 0
 print("infoTable.systolicPressure[MenuPage.lua]) = ".. infoTable.systolicPressure)

 infoTable.diastolicbloodPressure = 0
 print("infoTable.diastolicbloodPressure[MenuPage.lua]) = ".. infoTable.diastolicbloodPressure)
 
 infoTable.bRix = 0
 print("infoTable.bRix[MenuPage.lua]) = ".. infoTable.bRix)
 
  infoTable.session = 0
 print("infoTable.session[MenuPage.lua]) = ".. infoTable.session)
 
 infoTable.myweIght = 0
 print("infoTable.myweIght[MenuPage.lua]) = ".. infoTable.myweIght)
 
 infoTable.setbloodtype = 0
 print("infoTable.setbloodtype[MenuPage.lua]) = ".. infoTable.setbloodtype)
  
 infoTable.setage = 0
 print("infoTable.setage[MenuPage.lua]) = ".. infoTable.setage)
 -----------------------------------------------------------------------------
--主選單各路徑宣告
local bloodPressurePress = function ( self,event ) 
           composer.gotoScene( "bloodPressure", "fade", 400 )
end

local bloodSugarPress = function ( self,event ) 
           composer.gotoScene( "bloodSugar", "fade", 400 )
end

local myWeightPress = function ( self,event ) 
           composer.gotoScene( "weIght", "fade", 400 )
end

local processProgressPress = function ( self,event ) 
           composer.gotoScene( "processProgress", "fade", 400 )
end

local onlineGuidePress = function ( self,event ) 
           composer.gotoScene( "", "fade", 400 )
end

local mySportPress = function ( self,event ) 
           composer.gotoScene( "mySport", "fade", 400 )
end

local foodManagementPress = function ( self,event ) 
           composer.gotoScene( "foodManagement", "fade", 400 )
end
        
local helpingUpPress = function ( self,event ) 
           composer.gotoScene( "", "fade", 400 )                  
end

local mySettingsPress = function ( self,event ) 
           composer.gotoScene( "mySettings", "fade", 400 )                  
end
--local function onSceneTouch( self, event )
--	if event.phase == "began" then
		
--		 composer.gotoScene( "scene3", "fade", 400  )
		
--		return true
--	end
--ßend

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "menu.jpg" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
	
	--每個按鈕位置設定
    local bloodPressure = widget.newButton
 { 
	
	defaultFile = "Assets/bloodPressurepress.png",
	overFile = "Assets/bloodPressureOver.png",
	emboss = true,
	onPress = bloodPressurePress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(bloodPressure)
    bloodPressure.x =display.contentWidth/4
	bloodPressure.y =display.contentHeight/3


    local bloodSugar = widget.newButton
 { 
	
	defaultFile = "Assets/bloodSugarpress.png",
	overFile = "Assets/bloodSugarOver.png",
	emboss = true,
	onPress = bloodSugarPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(bloodSugar)
    bloodSugar.x =display.contentWidth/1.9
	bloodSugar.y =display.contentHeight/3

 local foodManagement = widget.newButton
 { 
	
	defaultFile = "Assets/foodManagementpress.png",
	overFile = "Assets/foodManagementOver.png",
	emboss = true,
	onPress = foodManagementPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(foodManagement)
    foodManagement.x =display.contentWidth/1.9
	foodManagement.y =display.contentHeight/1.85
	
	local helpingUp= widget.newButton
 { 
	
	defaultFile = "Assets/helpingUppress.png",
	overFile = "Assets/helpingUpOver.png",
	emboss = true,
	onPress = helpingUpPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(helpingUp)
    helpingUp.x =display.contentWidth/1.3
	helpingUp.y =display.contentHeight/1.3
	
    local mySettings = widget.newButton
 { 
	
	defaultFile = "Assets/mySettingspress.png",
	overFile = "Assets/mySettingsOver.png",
	emboss = true,
	onPress = mySettingsPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(mySettings)
    mySettings.x =display.contentWidth/1.9
	mySettings.y =display.contentHeight/1.3
	
   local mySport = widget.newButton
 { 
	
	defaultFile = "Assets/mySportpress.png",
	overFile = "Assets/mySportOver.png",
	emboss = true,
	onPress = mySportPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(mySport)
    mySport.x =display.contentWidth/4	
	mySport.y =display.contentHeight/1.85
	
	local myWeight = widget.newButton
 { 
	
	defaultFile = "Assets/myWeightpress.png",
	overFile = "Assets/myWeightOver.png",
	emboss = true,
	onPress = myWeightPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(myWeight)
    myWeight.x =display.contentWidth/1.3
	myWeight.y =display.contentHeight/3
	
	local onlineGuide = widget.newButton
 { 
	
	defaultFile = "Assets/onlineGuidepress.png",
	overFile = "Assets/onlineGuideOver.png",
	emboss = true,
	onPress = onlineGuidePress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(onlineGuide)
    onlineGuide.x =display.contentWidth/4
	onlineGuide.y =display.contentHeight/1.3

local processProgress = widget.newButton
 { 
	
	defaultFile = "Assets/processProgresspress.png",
	overFile = "Assets/processProgressOver.png",
	emboss = true,
	onPress = processProgressPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(processProgress)
    processProgress.x =display.contentWidth/1.3
	processProgress.y =display.contentHeight/1.85

end



function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "2: show event, phase did" )
	
		-- remove previous scene's view
		composer.removeScene( "scene1" )
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

