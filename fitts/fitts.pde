boolean isMouseMoved ;
int count,num;
PVector position = new PVector();
int w;
float time,start_time,end_time;
int iter = 100;
float d;
int  [] record_w = new int[iter];
float  [] record_t = new float[iter];
float  [] record_d = new float[iter];

void setup(){


//  size(800,600);
  fullScreen();
  frameRate(60);
  time = millis();

  initialize();
}


void draw(){
  background(#eeeeee);
  time = millis();

  displayRect();
  
  if(mouseX > position.x-w/2 && mouseX < position.x+w/2)
    if(mouseY > position.y-w/2 && mouseY < position.y+w/2)
      if(!isMouseMoved ) 
        num++;

  if(num >60){
    end_time = time;
    result();
  }


  isMouseMoved = false;
}


void mouseMoved(){

  isMouseMoved = true;

}

void displayRect(){

  noStroke();
  fill(#3d3d3d);
  rectMode(CENTER);
  rect( position.x,position.y,w,w );

}

void result() {

  float t = end_time-start_time;

  record_w[count]=w;
  record_d[count]=d;
  record_t[count]=t;
  
  count++;
  if(count == iter)
    exit();

  initialize();

}

void initialize(){

  position.x = int(random(width-100));
  position.y = int(random(height-100));
  d = dist(position.x,position.y,mouseX,mouseY);
  w = int(random(25,200));
  num=0;
  start_time = time;


}

void dispose(){

  println(" w, d, t");
  for(int i = 0; i<iter; i++)
   println( record_w[i],record_d[i], record_t[i] );

}
