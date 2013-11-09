require 'anim'      --libreria animazioni
require 'res'       --contiene sprite e animazioni    
require 'Tserial'
function aggiorna()  
	love.graphics.draw(bg,0,0)
 	player.direzione:draw(player.x,player.y) 
	if player.arma ~= NULL then
	love.graphics.draw(player.arma,player.x,player.y)
	end
	love.graphics.print(player.x,0,0)
	love.graphics.print(player.y,0,10)
    love.graphics.draw(mage.spell,mage.spellx,mage.spelly)
	if (mage.spellx<800) and mage.spellx>-40 and (player.direzione==de or player.direzione==idlede) then 
	mage.spellx=mage.spellx+10
	elseif mage.spellx>-40 and mage.spellx<800 and (player.direzione==si or player.direzione==idlesi) then
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
   if key=="x" then
	   mage.spellx=player.x
	   mage.spelly=player.y
   end
	   
end
end
function selezionaclasse()
 love.graphics.draw(wp,0,0)
 love.graphics.draw(selchar,0,0)
 love.graphics.draw(frame,framex,framey)
 function love.keyreleased(key)
   if key =="right" and cont <3 then
      framex=framex+150
	  cont=cont+1
	  classe=classe+1
   elseif key =="left" and cont>limit then
      framex=framex-150
	  cont=cont-1
	  classe=classe-1
   elseif key=="down" then
      framex=285
	  framey=320
	  cont=2
	  limit=2
	  classe=4
      elseif key=="up" then
      framex=130
	  framey=173
	  cont=0
	  limit=0
	  classe=0
	  elseif key =="return" then
	  if classe==0  then
	  n=1
	  player.vel=130
	  player.classe="elfo"
	  ande=love.graphics.newImage("elfo_dx.png")
	  ansi=love.graphics.newImage("elfo_sx.png")
	  ansu=love.graphics.newImage("elfo_dtr.png")
	  angiu=love.graphics.newImage("elfo_front.png")
	  idlesiimgum= love.graphics.newImage("elfo_idle_sx.png")
      idledeimgum= love.graphics.newImage("elfo_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
	  elseif classe==1  then
	  n=1
	  player.vel=110
	  player.classe="gnomo"
	  ande=love.graphics.newImage("gnomo_dx.png")
	  ansi=love.graphics.newImage("gnomo_sx.png")
	  ansu=love.graphics.newImage("gnomo_dtr.png")
	  angiu=love.graphics.newImage("gnomo_front.png")
	  idlesiimgum= love.graphics.newImage("gnomo_idle_sx.png")
      idledeimgum= love.graphics.newImage("gnomo_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
   elseif classe==2 then
      n=1
	  player.vel=110
	  player.classe="halfling"
	  ande=love.graphics.newImage("halfling_dx.png")
	  ansi=love.graphics.newImage("halfling_sx.png")
	  ansu=love.graphics.newImage("halfling_dtr.png")
	  angiu=love.graphics.newImage("halfling_front.png")
	  idlesiimgum= love.graphics.newImage("halfling_idle_sx.png")
      idledeimgum= love.graphics.newImage("halfling_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
   elseif classe==3 then
      n=1
	  player.vel=110
	  player.classe="orco"
	  ande=love.graphics.newImage("orco_dx.png")
	  ansi=love.graphics.newImage("orco_sx.png")
	  ansu=love.graphics.newImage("orco_su.png")
	  angiu=love.graphics.newImage("orco_front.png")
	  idlesiimgum= love.graphics.newImage("orco_idle_sx.png")
      idledeimgum= love.graphics.newImage("orco_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
      elseif classe==4 then
      n=1
	  player.vel=100
	  player.classe="nano"
	  ande=love.graphics.newImage("nano_dx.png")
	  ansi=love.graphics.newImage("nano_sx.png")
	  ansu=love.graphics.newImage("nano_dtr.png")
	  angiu=love.graphics.newImage("nano_front.png")
	  idlesiimgum= love.graphics.newImage("nano_idle_sx.png")
      idledeimgum= love.graphics.newImage("nano_idle_dx.png")
	  de=newAnimation(ande,84,100,0.2,0)
	  si=newAnimation(ansi,84,100,0.2,0)
	  giu=newAnimation(angiu,84,100,0.2,0)
	  su=newAnimation(ansu,84,100,0.2,0)
	  idlesi=newAnimation(idlesiimgum,85,100,1,0)
      idlede=newAnimation(idledeimgum,85,100,1,0)
	  player.direzione=idlesi
	  elseif classe==5 then
	  n=1
	  player.vel=150
	  player.classe="umano"
	  player.direzione=idlesi
   end
end
end
end

function spawn_arma()
love.graphics.draw(armi.weap[i],armax,armay)
if(player.x<armax) and (player.x>armax-armi.weap[i]:getWidth()) and (player.y>=armay) and (player.y<armay+60) then
armax=math.random(50,800)
armay=math.random(50,510)
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
