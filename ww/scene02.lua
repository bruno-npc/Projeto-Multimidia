display.setStatusBar( display.HiddenStatusBar )

local composer = require( "composer" )
local scene = composer.newScene()
 
 _W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX --centro x
 _CY = display.contentCenterY --centro y

local contador = 0

local function next() 
composer.gotoScene('scene03', { effect = "crossFade" , time = 500 } )
end

local function prev() 
composer.gotoScene('scene01', { effect = "crossFade" , time = 500 } )
end

function scene:create( event )
 
    local sceneGroup = self.view
    
    local bgInicial = display.newImage( sceneGroup, 'background/bg2.png', _CX, _CY )
    bgInicial.width = _W
    bgInicial.height = _H

    local title = display.newText( sceneGroup, "O general", _CX, _H * 2/20, native.systemFont, 30 )
    title.x = _W * 2/20

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


function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
    
        local physics = require('physics')
        physics.start()
        physics.setGravity( 0, 0 )
    
        local gravidadeItens = display.newGroup()
    
        local poste = display.newImage(gravidadeItens, 'assetsBg4/itens_bg4.png')
        poste.x = _CX - 200
        poste.y = _CY

        sceneGroup:insert(gravidadeItens)

        poste.name = 'poste'
        physics.addBody(poste)
    
        local gravidadeGeneral = display.newGroup()
        local general = display.newImage (gravidadeGeneral, 'assetsBg4/general_bg4.png')
        general.x = _CX + 200
        general.y = _CY

        sceneGroup:insert(gravidadeGeneral)

        --general:addEventListener('touch', dragdrop )
        
    elseif ( phase == "did" ) then
        
        
    end
end


local function onLocalCollision( self, event )
    if(event.target.name == 'general') then

    end
end


--[[
    local function dragdrop(e) 
        if (e.phase == 'moved') then
            general.x = e.x
            general.y = e.y
        end
      end
 
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