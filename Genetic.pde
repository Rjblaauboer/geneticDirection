import java.util.Arrays;
Ball[] set;

void setup() {
  size(400, 400);
  set = new Ball[20]; 
  for (int i = 0; i<set.length; i++) {
    set[i] = new Ball( new PVector(width/2, height/2) );
  }
}



void draw() {
  background(255);
  boolean finished = true; 
  for (Ball b : set) {
    b.update(); 
    if (!b.done()) {
      finished = false;
    }
  }
  for (Ball b : set) {
    b.display();
  }
  if (finished) {
    Ball[] newSet = new Ball[20]; 
    Arrays.sort( set );
    for(int i = 0; i<newSet.length; i++){
     Ball b1 = set[ floor(random(0,5)) ];  
     Ball b2 = set[ floor(random(0,5)) ]; 
     newSet[i] = new Ball(new PVector(width/2, height/2), b1, b2); 
    }
    println("Finished set"); 
    set[0].info();
    set[set.length-1].info();
    set = newSet;
  }
}