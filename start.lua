local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local widget = require( "widget" )
local mydata = require("mydata")
local score = require( "score" )
--local ads = require( "ads" )


function scene:createScene(event)
  selections = {}

  if event.params ~= nil then
      selections = event.params 
  else
    selections.map = "1"
  end

  options = {
  effect = "fade",
  time = 400,
  params = selections
  }

  mydata.score = 0



   local sheetDatax1 = { width=19, height=22, numFrames=6, sheetContentWidth=114, sheetContentHeight=22 }
   sheetx1 = graphics.newImageSheet( "stoneexp.png", sheetDatax1 )

-- 2nd image sheet
   local sheetDatax2 = { width=19, height=22, numFrames=3, sheetContentWidth=57, sheetContentHeight=22 }
   sheetx2 = graphics.newImageSheet( "stonesprite.png", sheetDatax2 )

   sequenceDatax = {
                { name="stonee", sheet=sheetx1, start=1, count=6, time=250, loopCount=1 },
                { name="stone", sheet=sheetx2, start=1, count=3, time=220, loopCount=0 }
            }

   screenGroup = self.view

   bestText = score.init({
  fontSize = 15,
  font = native.systemFont,
  x = display.contentCenterX + 20,
  y = display.contentCenterY -20,
  maxDigits = 7,
  leadingZeros = false,
  filename = "scorefile.txt",
  })
   bestText.isVisible = false
  screenGroup:insert( bestText )

   click = audio.loadSound( "sound/click.mp3" )
   stepSound1 = audio.loadSound( "sound/step/adim1.mp3" )
   stepSound2 = audio.loadSound( "sound/step/adim2.mp3" )
   stepSound3 = audio.loadSound( "sound/step/adim3.mp3" )
   stepSound4 = audio.loadSound( "sound/step/adim4.mp3" )
   stepSound5 = audio.loadSound( "sound/step/adim5.mp3" )
   stepSlip = audio.loadSound( "sound/step/stepSlip.mp3" )

   man1 = audio.loadSound( "sound/man/1.mp3" )
   man2 = audio.loadSound( "sound/man/2.mp3" )
   man3 = audio.loadSound( "sound/man/3.mp3" )

   stoneSound1 = audio.loadSound( "sound/tas/1.mp3" )
   stoneSound2 = audio.loadSound( "sound/tas/2.mp3" )
   stoneSound3 = audio.loadSound( "sound/tas/3.mp3" )
   stoneSound4 = audio.loadSound( "sound/tas/4.mp3" )
   stoneSound5 = audio.loadSound( "sound/tas/5.mp3" )


   background = display.newImageRect("screenComp/"..selections.map..".png", 320 , 530)

   smokex1 = {width = 128, height=128, numFrames=64, sheetContentHeight=1024, sheetContentWidth=1024}
   smoke = graphics.newImageSheet( "screenComp/smoke2.png", smokex1 )

   smokeData = {
   {name = "smoke", sheet = smokex1, start = 9, count = 33, time = 1500, loopCount = 1}
}
   

   --background.x = display.contentCenterX
   --background.y = display.contentHeight
   background.x=background.contentWidth/2
   background.y=background.contentHeight/2
   screenGroup:insert(background)

   version = ""

   startText1 = display.newText(version, display.contentCenterX,display.contentCenterY+195,native.systemFont,13)
   startText1:setFillColor(0,0,0)
   startText1.alpha = 1
   screenGroup:insert(startText1)

   web = "UbiKac"

   startText2 = display.newText(web, display.contentCenterX,display.contentCenterY-150,native.systemFont,50)
   startText2:setFillColor(0,0,0)
   startText2.alpha = 1
   screenGroup:insert(startText2)
   startText2.isVisible = false

   logo = display.newImageRect( "screenComp/logo.png", 300, 300 )

   logo.x = display.contentCenterX
   logo.y = display.contentCenterY-100

   screenGroup:insert( logo )



  
   


   function handleButtonEventx( event )

       if ( "ended" == event.phase ) then
          audio.play( click, {loop = 1,fadein =30 } )
           storyboard.gotoScene ("game",options)
         --storyboard.gotoScene("game-scene", "fade", 400  )
       end
   end

   local button1 = widget.newButton
   {
       width = 150,
       height = 33,
       defaultFile = "menu/buton1.png",
       overFile = "menu/buton1p.png",
       label = "",
       onEvent = handleButtonEventx
   }
   button1.x = display.contentCenterX
   button1.y = display.contentCenterY

   screenGroup:insert( button1 )

   startText3 = display.newText("PLAY", button1.x,button1.y-3,"Comix Loud",11)
   startText3:setFillColor(37,45,0)
   startText3.alpha = 1
   screenGroup:insert(startText3)



   function handleButtonEvent2x( event )

       if ( "ended" == event.phase ) then
         audio.play( click, {loop = 1,fadein =30 } )
         storyboard.gotoScene ("selectStage",options)
       end
   end

   local button2 = widget.newButton
   {
       width = 170,
       height = 45,
       defaultFile = "menu/buton1.png",
       overFile = "menu/buton1p.png",
       label = "",
       onEvent = handleButtonEvent2x
   }
   button2.x = display.contentCenterX
   button2.y = display.contentCenterY+120

   screenGroup:insert( button2 )


   startText4 = display.newText("SELECT STAGE", button2.x,button2.y-3,"Comix Loud",11)
   startText4:setFillColor(37,45,0)
   startText4.alpha = 1
   screenGroup:insert(startText4)

   --[[ local arrow = widget.newButton
   {
       width = 120,
       height = 26,
       defaultFile = "menu/buton1.png",
       overFile = "menu/buton1p.png",
       label = "",
       onEvent = handleButtonArrow
   }

   arrow.x = display.contentCenterX +60
   arrow.y = button2.y +80

   screenGroup:insert (arrow)]]


   --[[arrowText = display.newText( "Disable Arrows", arrow.x, arrow.y, "Comix Loud", 9 )
   arrowText:setFillColor( 153/255,255/255,51/255 )
   arrowText.isVisible = false

   arrowText2 = display.newText( "Enable Arrows", arrow.x, arrow.y, "Comix Loud", 9 )
    arrowText2:setFillColor( 0,153/255,0 )
    arrowText2.isVisible = false
   screenGroup:insert(arrowText2)
   screenGroup:insert(arrowText)

   arrowx = 0
   print( "buraya girdi" )

   function handleButtonArrow( event )
      if ("ended" == event.phase) then
        if arrowx == 0 then
          arrowText2.isVisible = true
          arrowText.isVisible = false
          arrowx = 1
          print( "buraya girdi" )
        else
          arrowText.isVisible = true
          arrowText2.isVisible = false
          arrowx = 0
        end
      end
    end]]




   function handleButtonEvent3x( event )

       if ( "ended" == event.phase ) then
         storyboard.gotoScene("menu_scene",options)
       end
   end



   local button3 = widget.newButton
   {
       width = 170,
       height = 45,
       defaultFile = "menu/buton1.png",
       overFile = "menu/buton1p.png",
       label = "",
       onEvent = handleButtonEvent3x
   }
   button3.x = display.contentCenterX
   button3.y = display.contentCenterY+180
   screenGroup:insert( button3 )
   button3.isVisible = false





end






function scene:enterScene(event)
  --[[selections = {}

  if event.params ~= nil then
      selections = event.params 
  else
    selections.map = "1"
  end

  options = {
  effect = "fade",
  time = 400,
  params = selections
  }

  background = display.newImageRect("screenComp/"..selections.map..".png", 320 , 530)
     background.x=background.contentWidth/2
   background.y=background.contentHeight/2
   screenGroup:insert(background)]]


  loadScore()
  stage =1
  local params = event.params

  if (params ~= nil) then
    stage = params.stage
  end
   --Runtime:addEventListener("touch", startGame)

end

function scene:exitScene(event)
   --Runtime:removeEventListener("touch",startGame)

end

function scene:destroyScene(event)

end

function loadScore()
  local prevScore = score.load()
  if prevScore ~= nil then
    if prevScore <= mydata.score then
      score.set(mydata.score)
    else 
      score.set(prevScore)  
    end
  else 
    score.set(mydata.score) 
    score.save()
  end
end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)



--ads.show( "banner", {x=0, y=0, appId = "ca-app-pub-7809852866279819/3310306286"} )



return scene

