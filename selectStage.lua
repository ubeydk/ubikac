local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
storyboard.purgeOnSceneChange = true
local widget = require( "widget" )
local score = require( "score" )
scene.name  = "selectStage"



function scene:createScene(event)

  local screenGroup = self.view

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

  stages = 1

   local function scrollListener( event )
      local phase = event.phase
      local direction = event.direction
      
      if "began" == phase then
        --print( "Began" )
      elseif "moved" == phase then
        --print( "Moved" )
      elseif "ended" == phase then
        --print( "Ended" )
      end
      
      -- If the scrollView has reached it's scroll limit
      if event.limitReached then
        if "up" == direction then
          print( "Reached Top Limit" )
        elseif "down" == direction then
          print( "Reached Bottom Limit" )
        elseif "left" == direction then
          print( "Reached Left Limit" )
        elseif "right" == direction then
          print( "Reached Right Limit" )
        end
      end
          
      return true
    end

    scrollView = widget.newScrollView
{
  left = 0,
  top = 0,
  width = display.contentWidth,
  height = display.contentHeight,
  bottomPadding = 130,
  id = "onBottom",
  horizontalScrollDisabled = true,
  verticalScrollDisabled = false,
  listener = scrollListener,
  backgroundColor = {0,0,0},
}

  screenGroup:insert(scrollView)


  local buttonx = widget.newButton
   {
       width = 150,
       height = 33,
       defaultFile = "menu/buton1.png",
       overFile = "menu/buton1p.png",
       label = "",
       onEvent = handleButtonEvent3a
   }
   buttonx.x = display.contentCenterX
   buttonx.y = display.contentCenterY +200



  local rec = display.newRect( buttonx.x, buttonx.y+20, display.contentWidth, 110)
  rec:setFillColor(0,0,0  )
  screenGroup:insert(rec)

   screenGroup:insert( buttonx )

   startText = display.newText("BACK", buttonx.x,buttonx.y-3,native.systemFont,16)
   startText:setFillColor(37,45,0)
   startText.alpha = 1
   screenGroup:insert(startText)

   





  

   local button1a = widget.newButton
   {
       width = 150,
       height = 300,
       defaultFile = "screenComp/1.png",
       --overFile = "screenComp/1.png",
       label = "",
       onEvent = handleButtonEventa
   }
   button1a.x = display.contentCenterX-80
   button1a.y = display.contentCenterY

   --screenGroup:insert( button1a )
   scrollView:insert( button1a)

   startText3 = display.newText("Choose stage", display.contentCenterX,display.contentCenterY-180,native.systemFont,16)
   startText3:setFillColor(37,45,0)
   startText3.alpha = 1
   --screenGroup:insert(startText3)
   scrollView:insert( startText3 )


   

   local button2a = widget.newButton
   {
       width = 150,
       height = 300,
       defaultFile = "screenComp/2.png",
       overFile = "screenComp/2.png",
       label = "",
       onEvent = handleButtonEvent2a
   }
   button2a.x = display.contentCenterX+80
   button2a.y = display.contentCenterY

   --screenGroup:insert( button2a )
   scrollView:insert( button2a )

   startText4 = display.newText("at least 500\n high point", button2a.x,button2a.y-3,native.systemFont,16)
   startText4:setFillColor(37,0,0)
   startText4.alpha = 1
   if (score.get()<500) then
    startText4.isVisible = true
    elseif(score.get()>=500) then
    startText4.isVisible = false
  end
   --screenGroup:insert(startText4)
   scrollView:insert(startText4)



   

   

   local button3a = widget.newButton
   {
       width = 150,
       height = 300,
       defaultFile = "screenComp/3.png",
       overFile = "screenComp/3.png",
       label = "",
       onEvent = handleButtonEvent4a
   }
   button3a.x = display.contentCenterX-80
   button3a.y = display.contentCenterY+320

   --screenGroup:insert( button2a )
   scrollView:insert( button3a )

   startText5 = display.newText("at least 750\n high point", button3a.x,button3a.y-3,native.systemFont,16)
   startText5:setFillColor(37,0,0)
   startText5.alpha = 1
   if (score.get()<750) then
    startText5.isVisible = true
    elseif(score.get()>=750) then
    startText5.isVisible = false
  end
   --screenGroup:insert(startText4)
   scrollView:insert(startText5)

   local button4a = widget.newButton
   {
       width = 150,
       height = 300,
       defaultFile = "screenComp/4.png",
       overFile = "screenComp/4.png",
       label = "",
       onEvent = handleButtonEvent5a
   }
   button4a.x = display.contentCenterX+80
   button4a.y = display.contentCenterY+320

   --screenGroup:insert( button2a )
   scrollView:insert( button4a )

   startText6 = display.newText("at least 1000\n high point", button4a.x,button4a.y-3,native.systemFont,16)
   startText6:setFillColor(37,0,0)
   startText6.alpha = 1
   if (score.get()<1000) then
    startText6.isVisible = true
    elseif(score.get()>=1000) then
    startText6.isVisible = false
  end
   --screenGroup:insert(startText4)
   scrollView:insert(startText6)


  -- body


  
   




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

function saveScore()
  score.save()
end


function scene:enterScene(event)
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

  loadScore()
  -- body
end

function scene:exitScene(event)
  -- body
end

function scene:destroyScene(event)
  -- body
end

function handleButtonEventa( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end


       if ( "ended" == event.phase ) then
          selections.map = "1"

          options = {
          effect = "fade",
          time = 400,
          params = selections
          }

         audio.play( click, {loop = 1,fadein =30 } )
         storyboard.gotoScene ("start",options)
       end
       return true
   end

   function handleButtonEvent2a( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end

       if ( "ended" == event.phase ) then
          if(score.get()>=500) then

          selections.map = "2"
          
          options = {
          effect = "fade",
          time = 400,
          params = selections
          }
            

           audio.play( click, {loop = 1,fadein =30 } )
           storyboard.gotoScene ("start",options)
         end
       end
   end

   function handleButtonEvent3a( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end

       if ( "ended" == event.phase ) then
         audio.play( click, {loop = 1,fadein =30 } )
         storyboard.gotoScene ("start","fade",400)

         print( score.get() )
       end
   end

   function handleButtonEvent4a( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end

       if ( "ended" == event.phase ) then
          if(score.get()>=750) then

          selections.map = "3"
          
          options = {
          effect = "fade",
          time = 400,
          params = selections
          }
            

           audio.play( click, {loop = 1,fadein =30 } )
           storyboard.gotoScene ("start",options)
         end
       end
   end

   function handleButtonEvent5a( event )

    local phase = event.phase

    if ( phase == "moved" ) then
        local dy = math.abs( ( event.y - event.yStart ) )
        -- If the touch on the button has moved more than 10 pixels,
        -- pass focus back to the scroll view so it can continue scrolling
        if ( dy > 10 ) then
            scrollView:takeFocus( event )
        end
    end

       if ( "ended" == event.phase ) then
          if(score.get()>=1000) then

          selections.map = "4"
          
          options = {
          effect = "fade",
          time = 400,
          params = selections
          }
            

           audio.play( click, {loop = 1,fadein =30 } )
           storyboard.gotoScene ("start",options)
         end
       end
   end

















scene:addEventListener("enterScene", scene)
scene:addEventListener("createScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene