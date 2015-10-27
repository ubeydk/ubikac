local storyboard = require ("storyboard")
storyboard.purgeOnSceneChange = true
local scene = storyboard.newScene()
--local ads = require( "ads" )


local physics = require ("physics")
physics.start()
physics.setGravity(0, 9.8)

local mydata = require("mydata")











-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

function scene:createScene( event )

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

   screenGroup = self.view

   mydata.score = 0

   audio.setVolume( 1 ) 

   

   running = false

   playSlipSound = audio.play( stepSlip, {loops = -1} )

   audio.pause( playSlipSound )

   
   

   


   --background = display.newImage("back2.png")
   --background.x = background.contentWidth/2
   --background.y = background.contentHeight/2
   --screenGroup:insert(background)

   background = display.newImage( "screenComp/"..selections.map..".png" )
   background.x = background.contentWidth/2
   background.y = background.contentHeight/2
   screenGroup:insert (background)




   

   ceiling1 = display.newImage("invisible.png")  
   ceiling1.x = 0
   ceiling1.y = display.contentHeight
   physics.addBody(ceiling1, "static", {bounce=0.0})
   screenGroup:insert(ceiling1)

   ceiling2 = display.newImage("invisible.png")
   ceiling2.x = display.contentWidth
   ceiling2.y = display.contentHeight
   physics.addBody(ceiling2,"static", {bounce=0})
   screenGroup:insert(ceiling2)


      scoreText = display.newText(mydata.score, display.contentCenterX,display.contentCenterY,"Comix Loud",20)
   scoreText:setFillColor(1,1,0)
   scoreText.alpha = 1
   screenGroup:insert(scoreText)

   right = display.newImageRect( "screenComp/right.png",100,80 )
   right.x = 280
   right.y = 363
   screenGroup:insert(right)

   left = display.newImageRect( "screenComp/left.png",100,80 )
   left.x = 30
   left.y = 363
   screenGroup:insert(left)

  




   devam = "t"


   obje1 = display.newSprite( sheetx1, sequenceDatax )


   obje1.x = math.random (0,3)*display.contentWidth/16
   --physics.addBody(obje1,"dynamic", {bounce=0})
   obje1:setSequence( "stone" )
   obje1:play( )
   screenGroup:insert(obje1)
   obje1.p = "n"
   

   obje2 = display.newSprite( sheetx1, sequenceDatax )
   obje2.x = 4*display.contentWidth/16+math.random (0,3)*display.contentWidth/16
   --physics.addBody(obje2,"dynamic", {bounce=0})
   obje2:setSequence( "stone" )
   obje2:play( )
   screenGroup:insert(obje2)
   obje2.p = "n"
   

   obje3 = display.newSprite( sheetx1, sequenceDatax )
   obje3.x = 8*display.contentWidth/16+math.random (0,3)*display.contentWidth/16
   --physics.addBody(obje3,"dynamic", {bounce=0})
   obje3:setSequence( "stone" )
   obje3:play( )
   screenGroup:insert(obje3)
   obje3.p = "n"
   

   obje4 = display.newSprite( sheetx1, sequenceDatax )
   obje4.x = 12*display.contentWidth/16+math.random (0,3)*display.contentWidth/16
   --physics.addBody(obje4,"dynamic", {bounce=0})
   obje4:setSequence( "stone" )
   obje4:play( )
   screenGroup:insert(obje4)
   obje4.p = "n"
   

  

   --physics.addBody(obje1,"kinetic")
   --physics.addBody(obje2,"kinetic")
   --physics.addBody(obje3,"kinetic")
   --physics.addBody(obje4,"kinetic")
   objeler = {}
   i = 1
   countp = 0
   esikdeger = 4
   direction = "r"




   --timer.performWithDelay( 4000, addObje, -1 )

   

   obje1.speed = 0
   obje2.speed = 0
   obje3.speed = 0
   obje4.speed = 0








   local sheetData1 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet1 = graphics.newImageSheet( "run.png", sheetData1 )

-- 2nd image sheet
   local sheetData2 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet2 = graphics.newImageSheet( "runl.png", sheetData2 )

   local sheetData3 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet3 = graphics.newImageSheet( "slow.png", sheetData3 )

   local sheetData4 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet4 = graphics.newImageSheet( "slowl.png", sheetData4 )

   local sheetData5 = { width=25, height=29, numFrames=1, sheetContentWidth=25, sheetContentHeight=29 }
   local sheet5 = graphics.newImageSheet( "stand.png", sheetData5 )

   local sheetData6 = { width=25, height=29, numFrames=1, sheetContentWidth=25, sheetContentHeight=29 }
   local sheet6 = graphics.newImageSheet( "standl.png", sheetData6 )

   local sheetData7 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet7 = graphics.newImageSheet( "dusme.png", sheetData7 )

   local sheetData8 = { width=25, height=29, numFrames=6, sheetContentWidth=150, sheetContentHeight=29 }
   local sheet8 = graphics.newImageSheet( "dusmel.png", sheetData8 )

-- In your sequences, add the parameter 'sheet=', referencing which image sheet the sequence should use
   sequenceData = {
                { name="run", sheet=sheet1, start=1, count=6, time=220, loopCount=0 },
                { name="runl", sheet=sheet2, start=1, count=6, time=220, loopCount=0 },
                { name="slow", sheet=sheet3, start=1, count=6, time=220, loopCount=0 },
                { name="slowl", sheet=sheet4, start=1, count=6, time=220, loopCount=0 },
                { name="stand", sheet=sheet5, start=1, count=1, time=220, loopCount=0 },
                { name="standl", sheet=sheet6, start=1, count=1, time=220, loopCount=0 },
                { name="dusme", sheet=sheet7, start=1, count=6, time=220, loopCount=1 },
                { name="dusmel", sheet=sheet8, start=1, count=6, time=220, loopCount=1 }
                }

   

   karakter = display.newSprite( sheet1, sequenceData )
   karakter.x = display.contentWidth/2
   karakter.y = 468
   --physics.addBody(karakter,"dynamic", {bounce = 0, friction = .5})
   screenGroup:insert(karakter)
   --karakter:play( )
   karakter:setSequence( "stand" )
   --screenGroup:insert(karakter)
   karakter:play()

   karakter.name = "stand"
   karakter.speed = 0

   

   




   

end

function addObje (event)

   
       
         objeler[i] = display.newSprite( sheetx1, sequenceDatax )
         objeler[i].x = 12*display.contentWidth/16+math.random (0,3)*display.contentWidth/16
         screenGroup:insert(objeler[i])
         objeler[i].speed = 0
         objeler[i]:setSequence( "stone" )
         objeler[i]:play( )
         objeler[i].p = "n"

         objeler[i].enterFrame = objeMove
         Runtime:addEventListener("enterFrame", objeler[i])
         i = i+1
    

end




   





function scene:enterScene(event)

   
  print( selections.map )

   storyboard.removeScene("start")
   storyboard.removeScene("restart")
   Runtime:addEventListener("touch", touchScreen)

   obje1.enterFrame = objeMove
   Runtime:addEventListener("enterFrame", obje1)

   obje2.enterFrame = objeMove
   Runtime:addEventListener("enterFrame", obje2)

   obje3.enterFrame = objeMove
   Runtime:addEventListener("enterFrame", obje3)

   obje4.enterFrame = objeMove
   Runtime:addEventListener("enterFrame", obje4)

   karakter.enterFrame =karakterMove
   Runtime:addEventListener("enterFrame", karakter)

   --ads.hide( )
   

   --karakter:addEventListener("collision", onCollision)

end

function scene:exitScene( event )
   storyboard.removeScene("start")

   Runtime:removeEventListener("touch",touchScreen)
   Runtime:removeEventListener("enterFrame", obje1)
   Runtime:removeEventListener("enterFrame", obje2)
   Runtime:removeEventListener("enterFrame", obje3)
   Runtime:removeEventListener("enterFrame", obje4)
   --karakter:removeEventListener("collision",onCollision)

   for x = 1, #objeler+3, 1 do
      Runtime:removeEventListener("enterFrame",objeler[x])
   end


   -- body
end

function scene:destroyScene( event )
   -- body
end




function activateJetssag(self,event)
   
   if running == false and self.speed > 0 then
   running = true
   playStep()


   end --end if statement for step sound 
   
if self.x <310 then
   self.speed = self.speed +.8
   --if karakter:getSequence

   if self.speed > 0 then
      direction = "r"
     
   end

   if self.speed < 0 then
      self.speed = self.speed+ .3
   end

   if self.speed > 0 then
      self.speed = self.speed- .3
   end

      if direction == "r" then
         if karakter.name ~= "run" then
            if playSlipSound ~= null then
            audio.pause(playSlipSound)
         end
            karakter:setSequence("run")
            karakter:play()
            karakter.name = "run"
          end
      end
      self.x = self.x + self.speed

      if self.x > 310 then
         self.x = 308
         self.speed = -self.speed/2
         if direction ~= "r" then
            direction = "r"
         end
      end
      if self.x < 10  then
         self.x = 12
         self.speed = -self.speed/2
         if direction ~= "r" then
            direction = "r"
         end

      end
   end
end--end function acitveSag

function activateJetssol(self,event)
   --self:applyForce(-0.16, 0, self.x, self.y)
if running == false and self.speed < 0 then
   running = true
   playStep()


end --if else end for sound play

   if self.x > 5 then
   self.speed = self.speed -.8
   if self.speed < 0 then
      direction = "l"
   end

   if self.speed < 0 then
      self.speed = self.speed+ .3
   end

   if self.speed > 0 then
      self.speed = self.speed- .3
   end


   if direction == "l" then
         if karakter.name ~= "runl" then
            if playSlipSound ~= null then
            audio.pause(playSlipSound)
             end

            karakter:setSequence("runl")
            karakter:play()
            karakter.name = "runl"
          end
      end



      self.x = self.x + self.speed

      if self.x > 310  then

         self.x = 308
         self.speed = -self.speed/2

         if direction ~= "r" then
            direction = "r"
         end
      end
      if self.x < 10 then
         self.x = 12
         self.speed = -self.speed/2
         if direction ~= "r" then
            direction = "r"
         end

      end
   end
end--end function active sol

function karakterMove( self,event )
   running = false


   if math.abs( self.speed ) < .5 then
      self.speed = 0
      if direction == "r" then
        if playSlipSound ~= null then
            audio.pause(playSlipSound)
         end
         karakter:setSequence( "stand" )
         karakter:play()
         karakter.name = "stand"
         elseif direction == "l" then
         if playSlipSound ~= null then
            audio.pause(playSlipSound)
         end
         karakter:setSequence( "standl" )
         karakter:play()
         karakter.name = "standl" 
      end

      
   end


   if self.speed < 0 then
      self.speed = self.speed+ .3
   end

   if self.speed > 0 then
      self.speed = self.speed- .3
   end
   if self.x < 10 or self.x > 310 then
         self.speed = -self.speed/2
         if direction ~= "r" then
            direction = "r"
         end

      end


   self.x = self.x + self.speed

end --end Karakter Move Function

function playStep (event)  --stepSound Function
   if running == true then
              ixy = math.random(1,5)

              if ixy == 1 then
               playStepSound = audio.play (stepSound1, {onComplete = playStep})
               elseif ixy ==2 then
                playStepSound = audio.play (stepSound2, {onComplete = playStep})
               elseif ixy ==3 then
                playStepSound = audio.play (stepSound3, {onComplete = playStep})
               elseif ixy ==4 then
                playStepSound = audio.play (stepSound4, {onComplete = playStep})
                elseif ixy ==5 then
                playStepSound = audio.play (stepSound5, {onComplete = playStep})
             end
   end  --running check if  statement end 
end --end stepSound Function




function touchScreen(event)
    --print("touch")
   if event.phase == "began" then
      if event.x < display.contentWidth/2 then
          karakter.enterFrame = activateJetssol
          --Runtime:addEventListener("enterFrame", karakter)
          
          

      end
      if event.x >= display.contentWidth/2 then
         karakter.enterFrame = activateJetssag
         --Runtime:addEventListener("enterFrame", karakter)
      end
   end

   
   if event.phase == "ended" then
      if direction == "r" then
         audio.resume (playSlipSound)
         karakter:setSequence( "slow" )
         karakter:play()
         karakter.name = "slow"
      end

      if direction == "l" then
         audio.resume (playSlipSound)
         karakter:setSequence( "slowl" )
         karakter:play()
         karakter.name = "slowl"
      end
      
       karakter.enterFrame = karakterMove
   end
end

function changeScene (event)
   storyboard.gotoScene("restart")  
end







function objeMove(self,event )

  

   if self.y >= (453) then
      if self.p == "n" then
      if devam == "t" then
         if self.x-self.contentWidth/2-1 <= karakter.x and self.x + self.contentWidth/2+1 > karakter.x then


            --print ("deneme")
            if direction == "r"   then
               karakter:setSequence( "dusme" )
               karakter:play( )

            end
            if direction == "l" then
               karakter:setSequence( "dusmel" )
               karakter:play( )
            end

            audio.setVolume( 0.4 )
            setSound = math.random(1,3)

            if (setSound == 1 ) then 
               audio.play(man1,  {loop = 1} )
            elseif (setSound==2) then
               audio.play(man2,  {loop = 1} )
            elseif (setSound == 3) then
               audio.play( man3, {loop=1} )
            end


            
            Runtime:removeEventListener("enterFrame", karakter)
            Runtime:removeEventListener("touch",touchScreen)
            running = false    
            timer.performWithDelay(555, endgame)
            devam = "f"
            audio.pause( playSlipSound )

         end
            
            
         end
   end

    

   if self.p == "n" then
      timer.performWithDelay(math.random(251,550), respawn )   
      mydata.score = mydata.score +1
      
      scoreText.text = mydata.score
      self.y = 450
      self:setSequence( "stonee" )
      playStoneExp()
      self:play( )
      countp = countp +1
      self.p = "y"
   end
      if (countp == esikdeger) then
         addObje()
         esikdeger = esikdeger +1
         countp = 0

      end
      --self.speed = 0    
         
      elseif self.y < -100   then



      else
         
         self.speed = self.speed +.55
         self.y = self.y+self.speed 
         
      end

      function endgame()

      storyboard.gotoScene( "restart", options )

      end

    

      function respawn()
         
      self.x = math.random (0,15)*display.contentWidth/16+10
      self.y = 35
      self.speed = 0
      self.p = "n"
      self:setSequence( "stone" )
      self:play( )
           
      end
     
   
end



function playStoneExp( event )
      soundint = math.random(1,5 )
      if soundint ==1 then
         audio.play(stoneSound1, {loop = 1} )
      elseif soundint ==2 then
         audio.play(stoneSound2, {loop = 1} )
      elseif soundint ==3 then
         audio.play(stoneSound3, {loop = 1} )
      elseif soundint ==4 then
         audio.play(stoneSound4, {loop = 1} )
      elseif soundint ==5 then
         audio.play(stoneSound5, {loop = 1} )
      end
   
end

 








scene:addEventListener("createScene",scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)


            


return scene