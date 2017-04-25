float time, start_time,end_time;
int fa,fb,fc,fd,flag;
int  a,w;
int count,miss_count;
int iter = 100;
int [] record_a = new int[iter];
int [] record_w = new int[iter];
float [] record_t = new float[iter];



void setup(){
    size(800,600);
    background(#eeeeee);
    time = millis();

    initialize();
}


void draw(){

  background(#eeeeee);

  time = millis();

  tunel(a*2,w*2);
   



}

void tunel(int a, int w){
    
    fill(#FFFFFF);
    noStroke();
    rectMode(CENTER);
    rect(width/2,height/2,a/2,w/2);
    fill(#000000);
    rect(width/2,height/2+w/4+5,a/2,10);
    rect(width/2,height/2-w/4-5,a/2,10);





    if( mouseY> height/2-w/4-5 && mouseY < height/2+w/4+5 ){
      if( mouseX < width/2 - a/4){
        fa = 1;
      }
      if( mouseX > width/2 - a/4)
        fb = 1;
      else fb=0;
      if( mouseX < width/2 + a/4 )
        fc = 1;
      if(mouseX > width/2 + a/4)
        fd =1;
      else fd =0;
    }else{
        fa = 0;
        fc = 0;
    }


    if(flag == 1)
      if( fa == 0 || fb == 0 ){
        println("MISS");
        miss_count++;
        background(#FFFFFF);
        initialize();
        return;
    }


   if( fa == 1 && fb == 1 && fc == 1 && flag == 0){
      start_time = time;
      flag = 1;
    }
    if( fa == 1 && fb == 1 && fc ==  1 &&fd == 1 ){
      end_time  = time;

      result();

    }

}

void result(){
  float t = end_time-start_time;
  println(t);
  record_a[count]= a;
  record_w[count]= w;
  record_t[count]= t;

  count++;
  if(count==iter)
    exit();
  initialize();

}

void initialize(){

  flag =0;
  fa = 0;
  fb = 0;
  fc =0;
  fd = 0;

  a = int(random(25,800));
  w = int(random(10,300));

}

void dispose(){

  println("a, w,   t");
  for(int i=0; i<iter ; i++)
    println( record_a[i]+","+record_w[i]+","+record_t[i]  );


  println("miss : "+miss_count);


}
