final int ADD_DELETE = 50;

class Champion{
  
  float px, py, dx, dy;
  color c;
  int v;
  
  Champion(float px, float py, int v, color c){
    this.px = px;
    this.py = py;
    this.v = v;
    this.c = c;
    this.dx = random(-1,1)*SPEED;;
    this.dy = random(-1,1)*SPEED;;
  }
  
  void moveAndCollide(){
    px+=dx;
    py+=dy;
    
    
    if(px <= 0)px=0;
    if(py <= 0)py=0;
    if(px+CHAMPION_SIZE > 1024)px=1024-CHAMPION_SIZE;
    if(py+CHAMPION_SIZE > 1024)py=1024-CHAMPION_SIZE;
    
    if(px+dx <= 0)dx*=-1;
    if(py+dy <= 0)dy*=-1;
    if(px+CHAMPION_SIZE+dx > 1024)dx*=-1;
    if(py+CHAMPION_SIZE+dy > 1024)dy*=-1;
    
    boolean dirChanged = false;
    for(int x=int(px);x<px+CHAMPION_SIZE;x+=RECT_SIZE){
      for(int y=int(py);y<py+CHAMPION_SIZE;y+=RECT_SIZE){
        if(x/RECT_SIZE >= 0 && x/RECT_SIZE < ARENA_X && y/RECT_SIZE >= 0 && y/RECT_SIZE < ARENA_Y){
          if(map[x/RECT_SIZE][y/RECT_SIZE] != v){
            if(value[map[x/RECT_SIZE][y/RECT_SIZE]]%ADD_DELETE == 0 && value[map[x/RECT_SIZE][y/RECT_SIZE]] != 0){
              deleteChampion(map[x/RECT_SIZE][y/RECT_SIZE]);
            }
            value[map[x/RECT_SIZE][y/RECT_SIZE]]-=1;
            
            if(value[v]%ADD_DELETE == ADD_DELETE-1){
              addChampion(v);
            }
            value[v]+=1;
            
            map[x/RECT_SIZE][y/RECT_SIZE]=v;
            if(!dirChanged){
              dirChanged = true;
              PVector v = new PVector(px+CHAMPION_SIZE/2-x, py+CHAMPION_SIZE/2-y);
              v.normalize();
              float r = random(-.5,.5);
              dx = v.x*SPEED+r;
              dy = v.y*SPEED-r;
            }
          }
        }
      }
    }
  }
  
  void refresh(){
    fill(c);
    rect(px,py,CHAMPION_SIZE,CHAMPION_SIZE);
  }
  
  void addChampion(int v){
    switch(v){
      case 0:
        prince.add(new Champion(px ,py ,0,color(100,75,100)));
        break;
      case 1:
        king.add(new Champion(px, py,1,color(150,100,75)));
        break;
      case 2:
        princess.add(new Champion(px, py,2,color(150,0,0)));
        break;
      case 3:
        queen.add(new Champion(px,py,3,color(50,75,150)));
        break;
    }
  }
  void deleteChampion(int v){
    switch(v){
      case 0:
        prince.remove(prince.size()-1);
        break;
      case 1:
        king.remove(king.size()-1);
        break;
      case 2:
        princess.remove(princess.size()-1);
        break;
      case 3:
        queen.remove(queen.size()-1);
        break;
    }
  }
}
