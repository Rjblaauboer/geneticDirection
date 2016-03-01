class Ball implements Comparable<Ball>{
  PVector direction; 
  float speed;
  float timestamp; 
  float timeAlive = 0; 
  PVector pos;
  boolean done = false; 
  
  Ball(PVector _pos){
   pos = _pos.copy();
   direction = new PVector(random(-1,1), random(-1,1)).normalize();
   speed = random(3,7) + random(1,2);
   timestamp = millis();
  }
  
  Ball(PVector _pos, Ball b1, Ball b2){
    pos = _pos.copy();
    timestamp = millis();
    float value = round(random(0,1)); 
    if(value == 0){ direction = b1.direction; 
    } else { direction = b2.direction; }
    value = round(random(0,1)); 
    if(value == 0){ speed = b1.speed; 
    } else { speed = b2.speed; }
    //speed *= random(0.99,1.01);
    //speed = constrain(speed,-20,20);
    direction.rotate( random(-0.01, 0.01) );     
  }
  
  void update(){
   pos = pos.add( direction.copy().mult(speed) );  
  }
  
  void display(){
   fill(150);
   stroke(0);
   ellipse(pos.x, pos.y, 5,5); 
  }
  
  void info(){
   println("Ball", "T:", timeAlive);  
  }

  boolean done(){
    if(pos.x < 0 || pos.x > width || pos.y*0.2 < 0 || pos.y*0.2 > height){
     if(!done){ timeAlive = millis() - timestamp;}
     done = true; 
     return true; 
    }
    return false; 
  } 
  
  int compareTo(Ball compareBall){
   float compareTimeAlive = compareBall.timeAlive;  
   if(timeAlive > compareTimeAlive){
     return 1; 
   } else {
     return -1; 
   }
  }
}