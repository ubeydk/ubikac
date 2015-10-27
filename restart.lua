-- requires 


local storyboard = require ("storyboard")
storyboard.purgeOnSceneChange = true
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )
local widget = require( "widget" )
local ads = require( "ads" )
scene.name  = "restart"

-- background



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

	screenGroup = self.view


	background = display.newImageRect("background.png",320,480)
	background.anchorX = 0.5
	background.anchorY = 0.5
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	screenGroup:insert(background)
	
	
	
	scoreText = display.newText(mydata.score,display.contentCenterX -18,
	display.contentCenterY - 20, native.systemFont, 15)
	scoreText:setFillColor(0,0,0)
	scoreText.alpha = 1 
	screenGroup:insert(scoreText)
		
	bestText = score.init({
	fontSize = 15,
	font = native.systemFont,
	x = display.contentCenterX + 20,
	y = display.contentCenterY -20,
	maxDigits = 7,
	leadingZeros = false,
	filename = "scorefile.txt",
	})
	bestScore = score.get()
	bestText.text = bestScore
	bestText.alpha = 1
	bestText:setFillColor(0,0,0)
	screenGroup:insert(bestText)


	 function handleButtonEvent( event )

       if ( "ended" == event.phase ) then
      	--saveScore()
      	

           audio.play( click, {loop = 1,fadein =30 } )
           storyboard.gotoScene ("game",options)
           
          
       end
         
      
   end

   local button1 = widget.newButton
   {
       width = 150,
       height = 33,
       defaultFile = "menu/buton2.png",
       overFile = "menu/buton2p.png",
       label = "",
       onEvent = handleButtonEvent
   }
   button1.x = display.contentCenterX
   button1.y = display.contentCenterY+70

   screenGroup:insert( button1 )

	text1 = display.newText("PLAY", button1.x,button1.y,"Comix Loud",11)
   	text1:setFillColor(37,45,0)
   	text1.alpha = 1
   	screenGroup:insert(text1)


    function handleButtonEvent2( event )

       if ( "ended" == event.phase ) then
        --saveScore()
		audio.play( click, {loop = 1,fadein =30 } )
		storyboard.gotoScene("start", options)
       end
   end

   local button2 = widget.newButton
   {
       width = 150,
       height = 33,
       defaultFile = "menu/buton3.png",
       overFile = "menu/buton3p.png",
       label = "",
       onEvent = handleButtonEvent2
   }
   button2.x = display.contentCenterX
   button2.y = display.contentCenterY+140

   screenGroup:insert( button2 )

   text2 = display.newText("MENU", button2.x,button2.y-1,"Comix Loud",11)
   	text2:setFillColor(37,45,0)
   	text2.alpha = 1
   	screenGroup:insert(text2)



   	function handleButtonEvent3( event )

       if ( "ended" == event.phase ) then
       audio.play( click, {loop = 1,fadein =30 } )
        storyboard.gn.show("leaderboards")
       end
   end

   local button3 = widget.newButton
   {
       width = 150,
       height = 33,
       defaultFile = "menu/buton3.png",
       overFile = "menu/buton3p.png",
       label = "",
       onEvent = handleButtonEvent3
   }
   button3.x = display.contentCenterX
   button3.y = display.contentCenterY+210

   screenGroup:insert( button3 )

   text3 = display.newText("LEADERS", button3.x,button3.y-1,"Comix Loud",11)
   	text3:setFillColor(37,45,0)
   	text3.alpha = 1
   	screenGroup:insert(text3)
	
end

function scene:enterScene(event)
	timer.performWithDelay( 500, requestScore )
	--setVolume( 1.0 )
	storyboard.removeScene("game")
	--restart:addEventListener("touch", restartGame)
	--menu:addEventListener("touch", goMenu)
	local params = event.params

  if (params ~= nil) then
    stage = params.stage
  end
	showGameOver()
	loadScore()
end

function scene:exitScene(event)
	--restart:removeEventListener("touch", restartGame)
	--transition.cancel(fadeTransition)
	--transition.cancel(scoreTransition)
	--transition.cancel(scoreTextTransition)
	--transition.cancel(startTransition)
end

function scene:destroyScene(event)

end

function restartGame(event)
     if event.phase == "ended" then
     	
		--saveScore()
		audio.play( click, {loop = 1,fadein =30 } )
		storyboard.gotoScene("game", options)
     end
end

function goMenu( event )
	if event.phase == "ended" then
		--saveScore()
		audio.play( click, {loop = 1,fadein =30 } )
		storyboard.gotoScene("start", options)
	end
end

function showStart()
	--menuTransition = transition.to (menu,{time= 200, alpha= 1})
	--startTransition = transition.to(restart,{time=200, alpha=1})
	--scoreTextTransition = transition.to(scoreText,{time=600, alpha=1})
	--scoreTextTransition = transition.to(bestText,{time=600, alpha=1})
end

function showScore()
	--scoreTransition = transition.to(scoreBg,{time=600, y=display.contentCenterY,onComplete=showStart})
	
end

function showGameOver()
	--fadeTransition = transition.to(gameOver,{time=600, alpha=1,onComplete=showScore})
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

function requestScore()
storyboard.gn.request( "setHighScore",
{
    localPlayerScore = { category="CgkIosvj9ZgEEAIQCA", value=mydata.score },
    listener = requestCallback
})

saveScore()

end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)




ads.show( "banner", {x=0, y=0, appId = "ca-app-pub-7809852866279819/3310306286"} )

return scene













