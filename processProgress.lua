local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
require("sqlite3")

local returnPress = function ( self,event ) 
           composer.gotoScene( "menuPage", "fade", 400 )

end

function scene:create( event )
    local sceneGroup = self.view




local path = system.pathForFile("personalNurse.sqlite", system.DocumentsDirectory )

local myData = {} -- a table to contain the data loaded from SQLite

local function setupDB()

    local function copyDBtoDocDir()
        file = io.open( path, "r" )
           if( file == nil )then           

               pathSource     = system.pathForFile( "personalNurse.sqlite", system.ResourceDirectory )  
               fileSource = io.open( pathSource, "rb" )
               contentsSource = fileSource:read( "*a" )                                  

                pathDest = system.pathForFile( "personalNurse.sqlite", system.DocumentsDirectory )                 
                fileDest = io.open( pathDest, "wb" )                 
                fileDest:write( contentsSource )                 

                io.close( fileSource )        
                io.close( fileDest )         
           end   
    end

    copyDBtoDocDir()     
    
    db = sqlite3.open( path )

    local function onSystemEvent( event )
        if( event.type == "applicationExit") then
            db:close()
        end
    end
    print ("version "..sqlite3.version())
    print ("db path "..path)  
    
    Runtime:addEventListener ("system", onSystemEvent)    
end

local function loadData()
    
    local count = 0
    local sql = "SELECT * FROM PN_BloodPressure limit 500 "
    local row
    print( sql )
    for row in db:nrows(sql) do
        count = count + 1
        myData[count] = row.time .."血壓→"..row.heatbeat.."收縮壓→ "..row.systoicPressure.."\n".."舒張壓→ "..row.systoicPressure
        print(myData[count]) -- lets see if the data is coming in from SQLite
    end    
    
end

setupDB()

loadData()

-- Handle row rendering
local function onRowRender( event )
    local phase = event.phase
    local row = event.row
    -- in graphics 2.0, the group contentWidth / contentHeight are initially 0, and expand once elements are inserted into the group.
    -- in order to use contentHeight properly, we cache the variable before inserting objects into the group
    local groupContentHeight = row.contentHeight
    local rowTitle = display.newText( row, myData[row.index], 20, 0, nil, 14 )
    -- in Graphics 2.0, the row.x is the center of the row, no longer the top left.
    rowTitle.x = 10
    -- we also set the anchorX of the text to 0, so the object is x-anchored at the left
    rowTitle.anchorX = 0
    print(rowTitle.x)
    rowTitle.y = groupContentHeight * 0.5
    rowTitle:setFillColor(255/255,120/255,50/255)
end

-- Create the widget
local tableView = widget.newTableView
{
    left = -3,
    top = 0,
    height = 430,
    width = 325,
    onRowRender = onRowRender,
    --onRowTouch = onRowTouch,
    --listener = scrollListener
}
-- Insert rows
for i = 1, #myData do
    local isCategory = false
    local rowHeight = 36
    local rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }
    local lineColor = { 0.5, 0.5, 0.5 }
   -- Insert a row into the tableView
    tableView:insertRow(
        {
        isCategory =isCategory,
		rowHeight = rowHeight,
		rowColor = rowColor,
		lineColor = lineColor,
        }
    )
end

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
    returnPress.y =display.contentHeight/1
    
    end




---------------------------------------------------------------------------------------------------
function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "2: show event, phase did" )
--------------------------------------------------------------------------------------------------	
		-- remove previous scene's view
	-- composer.removeScene( "processProgress" )

--------------------------------------------------------------------------------------------------
		-- remove previous scene's view
		composer.removeScene( "scene1" )
	end
end

function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
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

