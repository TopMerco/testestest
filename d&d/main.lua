require 'anim'      --libreria animazioni
require 'res'       --classeiene sprite e animazioni    
require 'Tserial'
require 'collision'
function aggiorna()  
	love.graphics.draw(bg,0,0)
 	player.direzione:draw(player.x,player.y) 
 	love.graphics.draw(player.arma,player.x+42,player.y-42)
	love.graphics.print(player.x,0,0)
	love.graphics.print(player.y,0,10)
    love.graphics.draw(mage.spell,mage.spellx,mage.spelly)
	if (mage.spellx<800) and mage.spellx>-40 and (mage.direzione==de or mage.direzione==idlede) then 
	mage.spellx=mage.spellx+10
	elseif mage.spellx>-40 and mage.spellx<800 and (mage.direzione==si or mage.direzione==idlesi) then
	mage.spellx=mage.spellx-10
	end
	spawn_arma()
end

function comandi(dt)
 if love.keyboard.isDown("left") then
    player.direzione=si
	player.direzione:update(dt)
	if(player.x>10) then
	player.x=player.x-player.vel*dt
	end
  elseif love.keyboard.isDown("right") then
    player.direzione=de
	player.direzione:update(dt)
	if(player.x<750) then
	player.x=player.x+player.vel*dt
	end
	end
  if love.keyboard.isDown("up") then
	 if(player.y>-30) then
     player.y=player.y-player.vel*dt  
	 end 
  elseif love.keyboard.isDown("down") then
	 if(player.y<510) then
     player.y=player.y+player.vel*dt  
	 end
  end
  function love.keyreleased(key)
   if key == "left" then
       player.direzione=idlesi
   elseif key == "right" then
       player.direzione=idlede
    end
   if key=="x" and (mage.spellx>800 or mage.spellx<0) then
   	if(player.direzione==de) then
	   mage.spellx=player.x+86
	else
		mage.spellx=player.x
	end
	   mage.spelly=player.y+40
	   mage.direzione=player.direzione
   end
	   
end
end

function selezionaclasse()
 love.graphics.draw(wp,0,0)
 love.graphics.draw(selchar,0,0)
 love.graphics.draw(frame,framex,framey)
 function love.keyreleased(key)
   if key =="right" and classe <limit then
      framex=framex+150
	  classe=classe+1
   elseif key =="left" and classe>0 and classe >4 then
      framex=framex-150
	  classe=classe-1
   elseif key=="down" then
      framex=285
	  framey=320
	  classe=4
	  limit=5
      elseif key=="up" then
      framex=130
	  framey=173
	  classe=0
	  limit=3
	  elseif key =="return" then
	  n=1
	  player.vel=130
	  player.classe=classe
	  ande=love.graphics.newImage(classe.."_dx.png")
	  ansi=love.graphics.newImage(classe.."_sx.png")
	  ansu=love.graphics.newImage(classe.."_dtr.png")
	  angiu=love.graphics.newImage(classe.."_front.png")
	  idlesiimgum= love.graphics.newImage(classe.."_idle_sx.png")
      idledeimgum= love.graphics.newImage(classe.."_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
end
end
end

function spawn_arma()
love.graphics.draw(armi.weap[i],armi.x,armi.y)
if(collisione(player.x,player.y,85,100,armi.x,armi.y,sword:getWidth(),sword:getHeight())) then
armi.x=math.random(50,800)
armi.y=math.random(50,510)
player.arma=armi.weap[i]
i=math.random(0,2)
end
end
function love.load()
end

function love.update(dt)
 if n==1 then
 comandi(dt)
 end
end

function love.draw()
  if n==0 then
  selezionaclasse()
  elseif n==1 then
  aggiorna()
  end
end
