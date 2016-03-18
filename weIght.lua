
---------------------------------------------------------------------------------
-- 
-- weIght.lua
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
--------------------------------------------------------------------------------------------------------------------------------------------------------------------         
--2015/11/03    
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


function loadData( )
	local  sql  =  "select  ID, time , weight from PN_weight"
	local projects  = { }
	print(#projects)
	for a  in  db:nrows(sql ) do
		projects[#projects+1]=
		{
			ID  = a.ID,
			time  = a.time,
			heatbeat  =  a.heatbeat,
			weight  =  a.weight
			}
	end
     
     return projects

end


function insertData(t,w)
local sql = " insert into  PN_weight('time','weight') values (' ".. t .." ', ".. w.." )"
--local sql = "intsert into  PN_BloodPressure(heatbeat,systoicPressure,diostoicBloodPressure) values ( toString (h),toString(s),toString(d))"
--local sql = "intsert into  PN_BloodPressure(heatbeat,systoicPressure,diostoicBloodPressure) values ( h,s,d)"
 db:exec( sql )
 print( sql )
end
db = setUpDatabase("mydatabase.sqlite")

insertData ("2015.11.02",   infoTable.myweIght)

local data = loadData( )

for  x  =  1,  #data do
	print (data[x].ID,data[x].time,data[x].weight)

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
           composer.gotoScene( "myweIght", "fade", 400 )
end
------------------------------------------------------------------------------------------------------------------- clock


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
---------------------------------------------------------------------------------

	
	-- Store tabBar height in Composer variable
	--composer.setVariable( "tabBarHeight", tabBar.height )

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "weIght-assets/Background.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
	
	
	
	
-----------------------------------------------------------------------------------------------------
print("infoTable.myweIght[bloodpressure.lua]) = ".. infoTable.myweIght)	

if infoTable.myweIght == 0 then
	
	local myText = display.newText("00.0", display.contentWidth/2,display.contentHeight/2.6, native.systemFontBold,50)
    myText:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText)
    
else	
   
   local myText = display.newText(infoTable.myweIght, display.contentWidth/2,display.contentHeight/2.6, native.systemFontBold,50)
    myText:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
 
 local nextPress = widget.newButton
 { 
	
	defaultFile = "bloodPressure-assets/nextPress.png",
	overFile = "bloodPressure-assets/nextOver.png",
	emboss = true,
	onPress = nextPress,
	--onRelease = button1Release,
 }
     sceneGroup:insert(nextPress)
    nextPress.x =display.contentWidth/1.3
	nextPress.y =display.contentHeight/2.8

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
	composer.removeScene("myweIght")
	
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
