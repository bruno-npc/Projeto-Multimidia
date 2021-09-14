local composer = require( "composer" )
local scene = composer.newScene()
 
 _W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX --centro x
 _CY = display.contentCenterY --centro y

 local contador = 0

local function next() 
composer.gotoScene('scene00', { effect = "crossFade" , time = 500 } )
end

local function prev() 
composer.gotoScene('scene03', { effect = "crossFade" , time = 500 } )
end

function scene:create( event )
 
    local sceneGroup = self.view
    
    local bg = display.newRect(sceneGroup,_CX,_CY,_W,_H)
    bg:setFillColor(1,1,1)

    local upe = display.newImage(sceneGroup,'assets/upe_logo.jpg',_CX,_CY)
    upe.anchorY = 0
    upe.y = 0
    upe:scale(0.5,0.5)

    local title = display.newText( sceneGroup, "Brasil na 2° guerra mundial", _CX, _H *13/20, native.systemFont, 40 )
    title:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Autor: Bruno Souza", _CX, _H *14/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Para a disciplina de Computação Gráfica e Multimídia", _CX, _H *15/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)
    local subject = display.newText( sceneGroup, "Orientado por: Ewerton Mendonça", _CX, _H *16/20, native.systemFont, 24 )
    subject:setFillColor(0,0,0)

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
 
    local sceneGroup = self.view

    buttonNext:removeEventListener('tap', next)
    buttonPrev:removeEventListener('tap', prev)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )
 
return scene