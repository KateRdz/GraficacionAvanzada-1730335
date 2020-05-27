import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage mascara;

Capture video;
OpenCV opencv;

void setup() {
    size(640, 480);
    mascara=loadImage("kk.png");
    video = new Capture(this, 640/2, 480/2);
    opencv = new OpenCV(this, 640/2, 480/2);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

    video.start();
}

void draw() {
    scale(2);
    opencv.loadImage(video);
    
    image(video, 0, 0 );
    
    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    Rectangle[] cara = opencv.detect();
    println(cara.length);
    
    for (int i = 0; i < cara.length; i++) {
      println(cara[i].x + "," + cara[i].y);
      image(mascara,cara[i].x, cara[i].y, cara[i].width, cara[i].height);
    }
}

void captureEvent(Capture c) {
  c.read();
}
