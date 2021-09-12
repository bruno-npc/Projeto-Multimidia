local composer = require( "composer" )
local scene = composer.newScene()
 
 _W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX --centro x
 _CY = display.contentCenterY --centro y

local function next() 
composer.gotoScene('scene04', { effect = "crossFade" , time = 500 } )
end

local function prev() 
composer.gotoScene('scene02', { effect = "crossFade" , time = 500 } )
end

function scene:create( event )
    local sceneGroup = self.view

    local bg = display.newImage(sceneGroup,'background/bg3.png', _CX, _CY);
    bg.height = _H
    bg.width = _W
    
    buttonNext = display.newGroup()
    local imgNext = display.newImage( buttonNext, 'assets/nextPag.png', _CX, _CY)
    imgNext.width = _W * 8/20
    imgNext.height = _H * 9/20

    sceneGroup:insert(buttonNext)

    buttonNext:scale(0.15,0.15)
    buttonNext.x = _W * 17/20
    buttonNext.y = _H * 10/20

    buttonNext:addEventListener('tap', next)

    buttonPrev = display.newGroup()
    local imgPrev = display.newImage( buttonPrev, 'assets/previousPag.png', _CX, _CY)
    imgPrev.width = _W * 8/20
    imgPrev.height = _H * 9/20
    sceneGroup:insert(buttonPrev)

    buttonPrev:scale(0.15,0.15)
    buttonPrev.x = _W * 0/20
    buttonPrev.y = _H * 10/20

    buttonPrev:addEventListener('tap', prev)
end


--[[
 
--]]

function scene:destroy( event )
    buttonNext:removeEventListener('tap', next)
    buttonPrev:removeEventListener('tap', prev)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )
 
return scene