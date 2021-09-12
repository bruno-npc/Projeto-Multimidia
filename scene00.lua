display.setStatusBar( display.HiddenStatusBar )

local composer = require("composer")
local scene = composer.newScene()

_W = display.contentWidth
_H = display.contentHeight
_CentroX = display.contentCenterX
_CentroY = display.contentCenterY

local function next() 
  composer.gotoScene('scene01', { effect = "crossFade" , time = 500 } )
end


function scene:create( event )
  
  local sceneGroup = self.view
  
  local background = display.newImage( sceneGroup, 'background/bg4.png', _CentroX, _CentroY)
  background.width = _W
  background.height = _H
  local title = display.newText( sceneGroup, "Brasil na 2° guerra mundial", _CentroX, _H * 2/20, native.systemFont, 60 )
  local subTitle2 = display.newText( sceneGroup, "Autor: Bruno Souza", _CentroX, _H * 4/20, native.systemFont, 30 )

  buttonNext = display.newGroup()
  local imgNext = display.newImage( buttonNext, 'assets/nextPag.png', _CX, _CY)
  imgNext.width = _W * 5/20
  imgNext.height = _H * 6/20
  
  sceneGroup:insert(buttonNext)

  buttonNext:scale(0.40,0.40)
  buttonNext.x = _W * 10/20
  buttonNext.y = _H * 10/20

  buttonNext:addEventListener('tap', next)
  
end


function scene:show( event )
  local sceneGroup = self.view
  local phase = event.phase

  if ( phase == "will" ) then

  elseif ( phase == "did" ) then

  end
end

-- destroy()
function scene:destroy( event )

  local sceneGroup = self.view
  
  buttonNext:removeEventListener('tap', next)
end

-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene
