
local composer = require( "composer" )

local scene = composer.newScene()

-------------------------------------------------------------------------------------------------------------------
-- Essa classe estava sendo utilizada para realizar testes e tentar resolver problemas nos códigos principais.
--       #############  Erro que estava tentando resolver:  #############
-- Adicionar um objeto (fora das funções de cena) ao "sceneGroup":
-- (link para informações sobre adicionar ao grupo da cena mesmo sem estar nas funções da cena
-- https://gamedevnation.com/scene-management-with-composer-in-solar2d/)
-- Adicionar mudançar em um item após a interação ele (reposicionar o objeto).
-------------------------------------------------------------------------------------------------------------------

-- Função para mover a possição de objetos apresentada nas aulas.
local function dragdrop(grp,e)
    local trageto = e.target
    if (e.phase == 'began') then
        local ponto = display.newRect(grp, 100, 100, 100, 100)
    elseif (e.phase == 'moved') then
        target.x = e.x
        target.y = e.y
    end
end

function scene:create( event )
    local sceneGroup = self.view
    dragdrop(sceneGroup)

    local bg = display.newRect(
        display.contentCenterX, 
        display.contentCenterY, 
        display.viewableContentWidth,
        display.viewableContentHeight
    )
    bg:setFillColor(0, 1, 1)
    sceneGroup:insert(bg)

    local obj = display.newRect(
        display.contentCenterX, 
        display.contentCenterY, 
        100,
        100
    )
    obj:setFillColor(1, 1, 1)
    sceneGroup:insert(obj)
    obj:addEventListener('touch', dragdrop)

end

function scene:destroy( event )
    local sceneGroup = self.view
    obj:removeEventListener('touch', dragdrop)
end

-- -------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "destroy", scene )
-- -------------------------------------------------------------------------------

return scene
