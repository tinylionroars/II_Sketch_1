//base code from Daniel Shiffman's github & Coding Train videos, as well & the tools tab on the processing.org website.

import processing.video.*;

Capture video;

boolean recording = false;


void setup() {
  size(640,480);
  background (0);
  video = new Capture (this, 640, 480, 30);
  video.start();
}

/*
void captureEvent(Capture video) {
  video.read();
}
*/


void keyPressed() {
  
  if (key == 'r' || key == 'R') { // Trigger saveFrame
    recording = !recording;
  }
}

void draw() {
  video.read(); //add stutter leave first on?
  image(video, 0, 0, width, height); //placeholder for more effects
  
   video.loadPixels();
   loadPixels();
   for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int loc = x + y * video.width;
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        float d = dist(x, y, mouseX, mouseY);
        if (x > 600) {
          pixels[loc] = color(mouseX, g, d);
        } else if (y > 400) {
          pixels[loc] = color(d, mouseX, b);
        } else if (y < 250) {
          pixels[loc] = color(r, b, g*mouseY);
        } else if (x < 300) {
          pixels[loc] = color(d, r, d);
        } else {
          pixels[loc] = color(r*mouseX, r, g);
        }
      }
   }
  updatePixels();
  
  if (recording) { //recording action
    saveFrame("output/frames####.png");
  }
   
  //visual feedback AFTER saveFrame()
  textAlign(CENTER);
  fill(255);
  if (!recording) {
    text("Press r to start recording.", width/2, height-24);
  } 
  else {
    text("Press r to stop recording.", width/2, height-24);
  }
  
  stroke(255);   // A red dot for when we are recording
  if (recording) {
    fill(255, 0, 0);
  } else { 
    noFill();
  }
  ellipse(width/2, height-48, 16, 16);
  
}