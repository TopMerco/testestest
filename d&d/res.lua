  --local angiu  = love.graphics.newImage("angiu.png")
  --local ansu  = love.graphics.newImage("ansu.png")
  local ande  = love.graphics.newImage("umano_dx.png")
  local ansi = love.graphics.newImage("umano_sx.png")
  local idlesiimgum= love.graphics.newImage("umano_idle_sx.png")
  local idledeimgum= love.graphics.newImage("umano_idle_dx.png")
  wp = love.graphics.newImage("wp.png")
  selchar=love.graphics.newImage("selchar.png")
  sword=love.graphics.newImage("spada.png")
  frame=love.graphics.newImage("frame.png")
  elsword=love.graphics.newImage("elsword.png")
  bloodsword=love.graphics.newImage("bloodsword.png")
  sphere=love.graphics.newImage("sphere.png")
  framex=130
  framey=173
  cont=0
  limit=0
  classe=0
  bg=love.graphics.newImage("bg1.png")
  math.randomseed(os.time())
  math.random()
  math.random()
  armax=math.random(50,720)
  armay=math.random(50,510)
  i=math.random(0,2)
  n=0
  --animazioni
 ande=love.graphics.newImage("umano_dx.png")
 ansi=love.graphics.newImage("umano_sx.png")
 idlesiimgum= love.graphics.newImage("umano_idle_sx.png")
 idledeimgum= love.graphics.newImage("umano_idle_dx.png")
 de=newAnimation(ande,84,100,0.2,0)
 si=newAnimation(ansi,84,100,0.2,0)
 idlesi=newAnimation(idlesiimgum,85,100,1,0)
 idlede=newAnimation(idledeimgum,85,100,1,0)
 --fine animazioni
  
  -- struttura classi
  armi={
    weap ={sword,elsword}
}
  mage={
    spell=sphere,
	spellx=-100,
	spelly=-100
 }
armi.weap[0]=sword
armi.weap[1]=elsword
armi.weap[2]=bloodsword
player={     
	x=400,
	y=300,                 
    classe="NULL",
	direzione=idlesi,
	vel=0,
	arma=NULL,
	}

	
  -- fine struttura classi