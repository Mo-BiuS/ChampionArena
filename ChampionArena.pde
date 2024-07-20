final int ARENA_X = 32, ARENA_Y = 32;
final int RECT_SIZE = 32;
final int CHAMPION_SIZE = 32;
final int SPEED = 12;
int[][] map = new int[ARENA_X][ARENA_Y];
int[] value = new int[5];

Champion[] championList = new Champion[12];

ArrayList<Champion> prince = new ArrayList<Champion>();
ArrayList<Champion> king = new ArrayList<Champion>();
ArrayList<Champion> princess = new ArrayList<Champion>();
ArrayList<Champion> queen = new ArrayList<Champion>();

void setup(){
  size(1024,1024+64);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(32);
  
  value[4] = ARENA_X*ARENA_Y;
  
  for(int x = 0; x < ARENA_X; x++){
    for(int y = 0; y < ARENA_Y; y++){
      map[x][y] = 4;
    }
  }
  int in = CHAMPION_SIZE*2;
  int out = 1024-in-CHAMPION_SIZE;
  for(int i=0;i<4;i++)prince.add(new Champion(in ,in ,0,color(100,75,100)));
  for(int i=0;i<4;i++)king.add(new Champion(in, out,1,color(150,100,75)));
  for(int i=0;i<4;i++)princess.add(new Champion(out, in,2,color(150,0,0)));
  for(int i=0;i<4;i++)queen.add(new Champion(out,out,3,color(50,75,150)));
}
void draw(){
  for(int x = 0; x < ARENA_X; x++){
    for(int y = 0; y < ARENA_Y; y++){
      switch(map[x][y]){
        case 0:fill(200,175,200);break;
        case 1:fill(250,200,175);break;
        case 2:fill(250,100,100);break;
        case 3:fill(150,175,250);break;
        default:fill(0,0,0);break;
      }
      rect(x*RECT_SIZE,y*RECT_SIZE,RECT_SIZE,RECT_SIZE);
    }
  }
  for(int i = 0; i < prince.size();i++){
    prince.get(i).refresh();
    prince.get(i).moveAndCollide();
  }
  for(int i = 0; i < king.size();i++){
    king.get(i).refresh();
    king.get(i).moveAndCollide();
  }
  for(int i = 0; i < princess.size();i++){
    princess.get(i).refresh();
    princess.get(i).moveAndCollide();
  }
  for(int i = 0; i < queen.size();i++){
    queen.get(i).refresh();
    queen.get(i).moveAndCollide();
  }
  fill(0);
  rect(0,1024,1024,64);
  
  var cor = 944;
  if(value[4]==0)cor+=16;
  
  var p = 8;
  var s = (float(value[0])/(ARENA_X*ARENA_Y))*cor;
  fill(200,175,200);
  rect(p,1032,s,48);
  fill(100,75,100);
  text(value[0],p+s/2,1056);
  
  p+=s+16;
  s = (float(value[1])/(ARENA_X*ARENA_Y))*cor;
  fill(250,200,175);
  rect(p,1032,s,48);
  fill(150,100,75);
  text(value[1],p+s/2,1056);
  
  p+=s+16;
  s = (float(value[2])/(ARENA_X*ARENA_Y))*cor;
  fill(250,100,100);
  rect(p,1032,s,48);
  fill(150,0,0);
  text(value[2],p+s/2,1056);
  
  p+=s+16;
  s = (float(value[3])/(ARENA_X*ARENA_Y))*cor;
  fill(150,175,250);
  rect(p,1032,s,48);
  fill(50,75,150);
  text(value[3],p+s/2,1056);
  
  p+=s+16;
  s = (float(value[4])/(ARENA_X*ARENA_Y))*cor;
  fill(50,50,50);
  rect(p,1032,s,48);
  fill(0,0,0);
  text(value[4],p+s/2,1056);
}
