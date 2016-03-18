
---------------------------------------------------------------------------------
-- 
-- bloodPressure.lua   -------->   heatBeat.lua       脈博 輸入畫面
--                                 systolicPressure.lua  收縮壓 輸入畫面
--                                 diastolicbloodPressure.lua  舒張壓 輸入畫面
---------------------------------------------------------------------------------
local image
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )

local returnPress,returnOver,nextPress,nextOver,nextPress1,nextOver1,nextPress2,nextOver2

local returnPress = function ( self,event ) 
           composer.gotoScene( "menuPage", "fade", 400 )
--------------------------------------------------------------------------------------------------------------------------------------------------------------------         
--返回主選單時，直接打開DB儲存DB各項數值     
require "sqlite3"
	local function setUpDatabase(dbName)
	
	local path = system.pathForFile( dbName, system.DocumentsDirectory )
	local file =io.open( path, "r" )
	print("good")
	if( file == nil ) then
		
		local pathSource         =  system.pathForFile(  dbName,  system.ResourceDirectory )
		local fileSource             =  io.open(  pathSource, "r"  )
		local contentsSource  = fileSource : read( "*a" )
		
		local pathDest  =  system.pathForFile(   dbName,  system.DocumentsDirectory )
		local fileDest      =  io.open( pathDest,"w" )
		fileDest:write(  contentsSource )
		
		io.close( fileSource )
		io.close( fileDest )
	end
	 
	local gameDB  = system.pathForFile( dbName,  system.DocumentsDirectory )
	local dbNew     = sqlite3.open( gameDB )
	
	return dbNew
	
end

--DB數據下載顯示
function loadData( )
	local  sql  =  "select  ID, time , heatbeat,  systoicPressure,  diostoicBloodPressure from PN_BloodPressure"
	local projects  = { }
	print(#projects)
	
	for a  in  db:nrows(sql ) do
		projects[#projects+1]=
		{
			ID  = a.ID,
			time  = a.time,
			heatbeat  =  a.heatbeat,
			systoicPressure  =  a.systoicPressure,
			diostoicBloodPressure  =  a.diostoicBloodPressure
			}
	end
     
     return projects

end

--ＤＢ插入數據位置
function insertData(t,h,s,d)
local sql = " insert into  PN_BloodPressure('time','heatbeat','systoicPressure','diostoicBloodPressure') values (' ".. t .." ',' ".. h .." ',' ".. s .." ' ,  ".. d .." )"

 db:exec( sql )
 print( sql )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--插入ＤＢ各項全域數值宣告
db = setUpDatabase("personalNurse.sqlite")

insertData (os.date(),   infoTable.freQuency, infoTable.systolicPressure, infoTable.diastolicbloodPressure)

local data = loadData( )

for  x  =  1,  #data do
	print (data[x].ID,data[x].time,data[x].heatbeat, data[x].systoicPressure, data[x].diostoicBloodPressure)

end
 
local function onSystemEvent( event )
    if ( event.type == "applicationExit" ) then
        if ( db and db:isopen() ) then
            db:close()
        end
    end
end
Runtime:addEventListener( "system", onSystemEvent )

end


----------------------------------------------------------------------------------------------------------------------------------------------------------
local nextPress = function ( self,event ) 
           composer.gotoScene( "heartBeat", "fade", 400 )
end

local nextPress1= function ( self,event ) 
           composer.gotoScene( "systolicPressure ", "fade", 400 )
end

local nextPress2= function ( self,event ) 
           composer.gotoScene( "diastolicbloodPressure", "fade", 400 )
end



   
------------------------------------------------------------------------------------------------------------------- clock
--同步並顯示手機時間

display.setStatusBar( display.HiddenStatusBar )

local clock = display.newGroup()



-- Create dynamic textfields
-- Note: these are iOS/MacOS fonts. If building for Android, choose available system fonts, 
-- or use native.systemFont / native.systemFontBold

local myText = display.newText(":", display.contentWidth/1.4,display.contentHeight/4.9, native.systemFontBold,22)
  myText:setTextColor(0, 0, 0) 

local hourField = display.newText( "", 0, 0, "Arial-BoldMT", 20)
hourField:setFillColor(0,0,0)
hourField.x = 215; hourField.y = 100

local minuteField = display.newText( "", 0, 0, "Arial-BoldMT", 20 )
minuteField:setFillColor(0,0,0)
minuteField.x = 245; minuteField.y = 100

local secondField = display.newText( "", 0, 0, "Arial-BoldMT", 10)
secondField:setFillColor(0,0,0)
secondField.x = 270; secondField.y = 100

-- Set the rotation point to the center of the screen
clock.anchorChildren = true 
clock.x, clock.y = display.contentCenterX, display.contentCenterY
 
local function updateTime()
	local time = os.date("*t")
	
	local hourText = time.hour
	if (hourText < 10) then hourText = "0" .. hourText end
	hourField.text = hourText
	
	local minuteText = time.min
	if (minuteText < 10) then minuteText = "0" .. minuteText end
	minuteField.text = minuteText
	
	local secondText = time.sec
	if (secondText < 10) then secondText = "0" .. secondText end
	secondField.text = secondText
end

updateTime() -- run once on startup, so correct time displays immediately


-- Update the clock once per second
local clockTimer = timer.performWithDelay( 1000, updateTime, -1 )


-- Use accelerometer to rotate display automatically
local function onOrientationChange( event )

print( clock.anchorX, clock.anchorY, clock.x, clock.y )
	-- Adapt text layout to current orientation	
	local direction = event.type

	if ( direction == "landscapeLeft" or direction == "landscapeRight" ) then
		hourField.y = 120
		secondField.y = 360
		hourLabel.y = 130
		secondLabel.y = 370
	elseif ( direction == "portrait" or direction == "portraitUpsideDown" ) then
		hourField.y = 90
		secondField.y = 390
		hourLabel.y = 100
		secondLabel.y = 400
	end

	-- Rotate clock so it remains upright

	local newAngle = clock.rotation - event.delta
	transition.to( clock, { time=150, rotation=newAngle } )	

end

Runtime:addEventListener( "orientation", onOrientationChange )
-------------------------------------------------------------------------------------------------------------------	clock

	-- Store tabBar height in Composer variable
	--composer.setVariable( "tabBarHeight", tabBar.height )

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "bloodPressure-assets/backGround.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--各項全域數值偵測並轉成字串顯示螢幕
print("infoTable.freQuency[bloodpressure.lua]) = ".. infoTable.freQuency)	

if infoTable.freQuency == 0 then
	
	local myText = display.newText("000", display.contentWidth/2.2,display.contentHeight/2.65, native.systemFontBold,50)
    myText:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText)
    
else	
   
   local myText = display.newText(infoTable.freQuency, display.contentWidth/2.2,display.contentHeight/2.65, native.systemFontBold,50)
    myText:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText)
 end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
print("infoTable.systolicPressure[bloodpressure.lua]) = ".. infoTable.systolicPressure)	

if infoTable.systolicPressure== 0 then
	
	local myText1 = display.newText("000", display.contentWidth/2.2,display.contentHeight/1.7, native.systemFontBold,50)
    myText1:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText1)
    
else	
   
   local myText1 = display.newText(infoTable.systolicPressure, display.contentWidth/2.2,display.contentHeight/1.7, native.systemFontBold,50)
    myText1:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText1)
 end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 print("infoTable.diastolicbloodPressure[bloodpressure.lua]) = ".. infoTable.diastolicbloodPressure)	

if infoTable.diastolicbloodPressure == 0 then
	
	local myText2 = display.newText("000", display.contentWidth/2.2,display.contentHeight/1.25, native.systemFontBold,50)
    myText2:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText2)
    
else	
   
   local myText2 = display.newText(infoTable.diastolicbloodPressure, display.contentWidth/2.2,display.contentHeight/1.25, native.systemFontBold,50)
    myText2:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText2)
 end
  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
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
-----------------------------------------------------------------------------------------------------

-- scene:addEventListener( "create" )

function scene:show( event )
	
	local phase = event.phase
	

-----------------------------------------------------------------------------------------------------
	if event.phase =="did" then
		composer.removeScene("heartBeat")
		
-----------------------------------------------------------------------------------------------------	

	
		-- remove previous scene's view
		--composer.removeScene( "scence 1" )
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
	