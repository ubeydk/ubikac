local mydata = require("mydata")
local storyboard = require "storyboard"
storyboard.gn = require( "gameNetwork" )
mydata.score = 0

local function initCallback( event )
    if not event.isError then
        loggedIntoGC = true
        --native.showAlert( "Success!", "", { "OK" } )
        storyboard.gn.request( "login",
			{
			    userInitiated =true
			})

    else
        native.showAlert( "Failed!", event.errorMessage, {"OK"})
        print("Error Code: ", event.errorCode)
    end
end


--native.showAlert( "Calling gameNetwork.init", "", { "OK" } )
storyboard.gn.init( "google", initCallback )


storyboard.gn.request( "login",
			{
			    userInitiated =false
			})

--local ads = require( "ads" )

  --          local function adListener(event)
    --          if (event.isError) then
--
  --            end

    --        end

      --      ads.init("admob", "ca-app-pub-7809852866279819/3310306286", adListener)


storyboard.gotoScene("start")

