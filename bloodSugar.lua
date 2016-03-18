
---------------------------------------------------------------------------------
-- 
-- bloodSugar.lua
--
---------------------------------------------------------------------------------
local image
local composer = require( "composer" )
local scene = composer.newScene()
-- Require the widget library
local widget = require( "widget" )



local returnPress = function ( self,event ) 
           composer.gotoScene( "menuPage", "fade", 400 )





---------------------------------------------------------------------------------------------------

local date = os.date( "*t" )    -- Returns table of date & time values
print( date.year, date.month )  -- Print year and month
print( date.hour, date.min )    -- Print hour and minutes
print( os.date( "%c" ) )        -- Print time/date string, for example "Thu Oct 23 14:55:02 2010"
--------------------------------------------------------------------------------------------------------------------------------------------------------------------         
--2015/10/29      
require "sqlite3"
	local function setUpDatabase(dbName)
	
	local path = system.pathForFile( dbName, system.DocumentsDirectory )
	local file =io.open( path, "r" )
	print("good")
	if( file == nil ) then
		
		local pathSource         =  system.pathForFile(  dbName,  system.ResourceDirectory )
		local fileSource        =  io.open(  pathSource, "r"  )
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
	local  sql  =  "select  ID, time , session,  bloodSugar from PN_bloodSugar"
	local projects  = { }
	print(#projects)
	for a  in  db:nrows(sql ) do
		projects[#projects+1]=
		{
			ID  = a.ID,
			time  = a.time,
			session  =  a.session,
			bloodSugar  =  a.bloodSugar
			}
	end
     
     return projects

end


function insertData(t,s,b)
local sql = " insert into  PN_bloodSugar('time','session','bloodSugar') values (' ".. t .." ',' ".. s .." ' ,  ".. b.." )"
--local sql = "intsert into  PN_BloodPressure(heatbeat,systoicPressure,diostoicBloodPressure) values ( toString (h),toString(s),toString(d))"
--local sql = "intsert into  PN_BloodPressure(heatbeat,systoicPressure,diostoicBloodPressure) values ( h,s,d)"
 db:exec( sql )
 print( sql )
end
db = setUpDatabase("bloodSugar.sqlite")

insertData (os.date(),infoTable.session, infoTable.bRix)

local data = loadData( )

for  x  =  1,  #data do
	print (data[x].ID,data[x].time,data[x].session, data[x].bloodSugar)

end
 
local function onSystemEvent( event )
    if ( event.type == "applicationExit" ) then
        if ( db and db:isopen() ) then
            db:close()
        end
    end
end
Runtime:addEventListener( "system", onSystemEvent )
print("hi")
end


----------------------------------------------------------------------------------------------------------------------------------------------------------

local nextPress = function ( self,event ) 
           composer.gotoScene( "bRix", "fade", 400 )
end

local nextPress1 = function ( self,event ) 
           composer.gotoScene( "session", "fade", 400 )
end



---------------------------------------------------------------------------------

	
	-- Store tabBar height in Composer variable
	--composer.setVariable( "tabBarHeight", tabBar.height )

function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "bloodSugar-assets/Background.png" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
-----------------------------------------------------------------------------------------------------
print("infoTable.bRix[bloodpressure.lua]) = ".. infoTable.bRix)	

if infoTable.bRix == 0 then
	
	local myText = display.newText("000", display.contentWidth/2,display.contentHeight/1.32, native.systemFontBold,50)
    myText:setTextColor(0.04, 0, 0.82) 
    sceneGroup:insert(myText)
    
else	
   
   local myText = display.newText(infoTable.bRix, display.contentWidth/2,display.contentHeight/1.32, native.systemFontBold,50)
    myText:setTextColor(0, 0, 0.67) 

 sceneGroup:insert(myText)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
 print("infoTable.session[bloodpressure.lua]) = ".. infoTable.session)	

if infoTable.session == 0 then
	
	local myText1 = display.newText("早上", display.contentWidth/2,display.contentHeight/2, native.systemFontBold,50)
    myText1:setTextColor(0, 0, 0) 
    sceneGroup:insert(myText1)
    
else	
   
   local myText1 = display.newText(infoTable.session, display.contentWidth/2,display.contentHeight/2, native.systemFontBold,50)
    myText1:setTextColor(0, 0, 0) 

 sceneGroup:insert(myText1)
 
 end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
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
	nextPress.y =display.contentHeight/1.6
	
	

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
    nextPress1.x =display.contentWidth/1.4
	nextPress1.y =display.contentHeight/2.7


end
-----------------------------------------------------------------------------------------------------

-- scene:addEventListener( "create" )

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
		
	composer.removeScene("bRix")
	
		
	
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
