
---------------------------------------------------------------------------------
--
-- scene1.lua     Displaying  the StartScreen image 
--                            when touch the screen  go to menuPage.lua
--
---------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

local image

local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		composer.gotoScene( "menuPage", "slideLeft", 800  )
		
		return true
	end
end

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	
	image = display.newImage( "startScreen.jpg" )
	image.x = display.contentCenterX
	image.y = display.contentCenterY
	
	sceneGroup:insert( image )
	
	image.touch = onSceneTouch
end

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		print( "1: show event, phase did" )
	
		-- remove previous scene's view
		composer.removeScene( "scene4" )
	
		-- Update Lua memory text display
		local showMem = function()
			image:addEventListener( "touch", image )
			-- text3.isVisible = true
			--text2.text = text2.text .. collectgarbage("count")/1000 .. "MB"
			-- text2.x = display.contentWidth * 0.5
		end
		memTimer = timer.performWithDelay( 1000, showMem, 1 )
	
	end
	
end




function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then
	
		print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		image:removeEventListener( "touch", image )
	
		-- cancel timer
		timer.cancel( memTimer ); memTimer = nil;
	
		-- reset label text
		-- text2.text = "MemUsage: "
	
	end
end


function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene