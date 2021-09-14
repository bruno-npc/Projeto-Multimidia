display.setStatusBar( display.HiddenStatusBar )

local composer = require( "composer" )
local scene = composer.newScene()
 
 _W = display.contentWidth
 _H = display.contentHeight
 _CX = display.contentCenterX --centro x
 _CY = display.contentCenterY --centro y

 local contador = 0

local function next() 
composer.gotoScene('scene02', { effect = "crossFade" , time = 500 } )
end

local function prev() 
composer.gotoScene('scene00', { effect = "crossFade" , time = 500 } )
end

  --------Interação-----------------------------------------------------------------------------------------
  --Erro: não consigo criar um "sceneGroup" (fora das classes 'scene:') para colocar as imagens e removelas quando passar pra próxima tela.
  function mudarBg (GrupoCena)
    contador = contador + 1
    if (contador == 2) then
      local sprite1 = display.newImage(GrupoCena, 'assetsBg1/italia3.png',  _CX, _CY)
      sprite2.height = _H
    end
    if (contador == 3) then
      local sprite2 = display.newImage(GrupoCena, 'assetsBg1/italia3.png',  _CX, _CY)
      sprite2.height = _H
    end
    if (contador == 4) then
      local caixaTexto = display.newImage(GrupoCena, 'assets/caixa_bg1.png', 500, 500)
      caixaTexto.width = 400
      caixaTexto.height = 400
      caixaTexto.x = display.contentCenterX
      caixaTexto.y = display.contentCenterY
    end
    --GrupoCena:insert(sprites)
  end

function scene:create( event )

    local sceneGroup = self.view

    mudarBg(sceneGroup)
    
    local bgInicial = display.newImage( sceneGroup, 'background/bg1.png', _CX, _CY )
    bgInicial.width = _W
    bgInicial.height = _H

    local italia = display.newImage(sceneGroup,'assetsBg1/italia1.png', _CX, _CY);
    italia.height = _H
    italia:addEventListener('tap', mudarBg)


    local title = display.newText( sceneGroup, "A reconquista", _CX, _H * 2/20, native.systemFont, 30 )
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

    italia:addEventListener('tap', mudarBg)
  end

function scene:destroy( event )
    local sceneGroup = self.view
    
    --italia:removeEventListener('tap', mudarBg)
    buttonNext:removeEventListener('tap', next)
    buttonPrev:removeEventListener('tap', prev)
end

scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
 
return scene