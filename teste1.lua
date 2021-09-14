local composer = require( "composer" )
local scene = composer.newScene()
-------------------------------------------------------------------------------------------------------------------
-- Essa classe estava sendo utilizada para realizar testes e tentar resolver problemas nos códigos principais.
--       #############  Erro que estava tentando resolver:  #############
-- Adicionar um objeto (fora das funções de cena) ao "sceneGroup":
-- (link para informações sobre adicionar ao grupo da cena mesmo sem estar nas funções da cena
-- https://gamedevnation.com/scene-management-with-composer-in-solar2d/)
-- Adicionar mudançar em um item após a interação ele (mudar cor do objeto).
-------------------------------------------------------------------------------------------------------------------
local contador = 0

local function mudarCor(grp, bg)
    -- incremento para que após cada toque o valor seja alterado e o objeto também.
    contador = contador + 1
    if (contador == 2) then
        bg:setFillColor(1, 0, 0)
        grp:insert(bg)
    end
    if (contador == 3) then
            bg:setFillColor(0, 1, 0)
            grp:insert(bg)
    end
    if (contador == 4) then
            bg:setFillColor(0, 0, 1)
            grp:insert(bg)
    end
    if (contador == 4) then
            bg:setFillColor(0, 0, 0)
            grp:insert(bg)
    end
end
-------------------------------------------------------------------------------------------------------------------
function scene:create( event )

    local sceneGroup = self.view
    -- Objeto para teste de interação / Interação: Mudar cor após toques
    local bg = display.newRect(
        display.contentCenterX, 
        display.contentCenterY, 
        display.viewableContentWidth,
        display.viewableContentHeight
    )
    bg:setFillColor(0, 1, 1)
    sceneGroup:insert(bg)
    -- Tentetiva de colocar os objetos da função no sceneGroup, 
    -- depois tentei colocar os dados do objeto principal para modificar (por isso bg é passado para a função)
    mudarCor(sceneGroup, bg)
    --------------------------------------------
    bg:addEventListener('tap', mudarCor)
end

function scene:destroy( event )
    local sceneGroup = self.view
    bg:removeEventListener('tap', mudarCor)
end
-------------------------------------------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------
return scene
