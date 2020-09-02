/**
 * Getting Started with Capture.
 *
 * Reading and displaying an image from an attached Capture device.
 *
 * Original name in processing exemple is GettingStartedCapture.pde and located in Processing\sketchbook-X.X.X\libraries\video\examples\Capture\GettingStartedCapture
 *   
 */

import processing.video.*;

Capture cam;

void settings() {
  fullScreen(); 
  //OR 
  //size(); // Do not add size() in setup() !!!
}

void setup() {
  //size(); //NO gonna gererated an IllegalStateException: size(
  
  /*
  * cannot be used here, see https://processing.org/reference/size_.html since processing version 3.5.2
  * When not using the PDE, size() can only be used inside settings().
  * Remove the size() method from setup(), and add the following:
  * public void settings() {size(640, 480);}
  */
 
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this,640,480,20);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[58]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 800, 600, "Built-in iSight", 5); 
    //cam = new Capture(this,1280,720,30);
    
    // Start capturing the images from the camera
    cam.start();
  }
}

void captureEvent(Capture cam){
  cam.read();
  //Event here is a frame ready in the buffer and loop
} 

//void mousePressed(){
//  cam.read();  //Read frame only on key pressed
//} 




void draw() {
    background(0);
    
  if (cam.available() == true) { cam.read();}
  
 //image(cam, 0, 0, 800, 600); // up or downscaling picture from capture cam 
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  set(0, 0, cam); //natif plus rapide
}

/*
Test with an avermedia camera using the default microsoft pilote 10.0.19041.423 so all mode available are not suported and gave me blank screen specialy at 30fps !  
Available cameras:
[0] "name=HUE HD Camera,size=1280x720,fps=15" no
[1] "name=HUE HD Camera,size=1280x720,fps=30" no
[2] "name=HUE HD Camera,size=640x480,fps=15" OK
[3] "name=HUE HD Camera,size=640x480,fps=30" OK
[4] "name=HUE HD Camera,size=640x360,fps=15" OK
[5] "name=HUE HD Camera,size=640x360,fps=30" OK
[6] "name=HUE HD Camera,size=544x288,fps=15"
[7] "name=HUE HD Camera,size=544x288,fps=30"
[8] "name=HUE HD Camera,size=432x240,fps=15"
[9] "name=HUE HD Camera,size=432x240,fps=30"
[10] "name=HUE HD Camera,size=352x288,fps=15"
[11] "name=HUE HD Camera,size=352x288,fps=30"
[12] "name=HUE HD Camera,size=320x240,fps=15"
[13] "name=HUE HD Camera,size=320x240,fps=30"
[14] "name=HUE HD Camera,size=320x176,fps=15"
[15] "name=HUE HD Camera,size=320x176,fps=30"
[16] "name=HUE HD Camera,size=160x120,fps=15"
[17] "name=HUE HD Camera,size=160x120,fps=30" ok
[18] "name=HUE HD Camera,size=752x416,fps=15"
[19] "name=HUE HD Camera,size=752x416,fps=30" no
[20] "name=HUE HD Camera,size=800x448,fps=15"
[21] "name=HUE HD Camera,size=800x448,fps=30" no
[22] "name=HUE HD Camera,size=800x600,fps=15"
[23] "name=HUE HD Camera,size=800x600,fps=30" no
[24] "name=HUE HD Camera,size=864x480,fps=15"
[25] "name=HUE HD Camera,size=864x480,fps=30" no
[26] "name=HUE HD Camera,size=960x544,fps=15"
[27] "name=HUE HD Camera,size=960x544,fps=30" no
[28] "name=HUE HD Camera,size=960x720,fps=15"
[29] "name=HUE HD Camera,size=960x720,fps=30" no
[30] "name=HUE HD Camera,size=1024x576,fps=15" OK
[31] "name=HUE HD Camera,size=1024x576,fps=30" no
[32] "name=HUE HD Camera,size=1184x656,fps=15" no
[33] "name=HUE HD Camera,size=1184x656,fps=30" no
[34] "name=HUE HD Camera,size=1280x720,fps=10" ok
[35] "name=HUE HD Camera,size=640x480,fps=15"
[36] "name=HUE HD Camera,size=640x480,fps=30" ok
[37] "name=HUE HD Camera,size=640x360,fps=15"
[38] "name=HUE HD Camera,size=640x360,fps=30"
[39] "name=HUE HD Camera,size=544x288,fps=15"
[40] "name=HUE HD Camera,size=544x288,fps=30"
[41] "name=HUE HD Camera,size=432x240,fps=15"
[42] "name=HUE HD Camera,size=432x240,fps=30"
[43] "name=HUE HD Camera,size=352x288,fps=15"
[44] "name=HUE HD Camera,size=352x288,fps=30"
[45] "name=HUE HD Camera,size=320x240,fps=15"
[46] "name=HUE HD Camera,size=320x240,fps=30"
[47] "name=HUE HD Camera,size=320x176,fps=15"
[48] "name=HUE HD Camera,size=320x176,fps=30"
[49] "name=HUE HD Camera,size=160x120,fps=15"
[50] "name=HUE HD Camera,size=160x120,fps=30"
[51] "name=HUE HD Camera,size=752x416,fps=10"
[52] "name=HUE HD Camera,size=752x416,fps=20"
[53] "name=HUE HD Camera,size=800x448,fps=10"
[54] "name=HUE HD Camera,size=800x448,fps=20"
[55] "name=HUE HD Camera,size=864x480,fps=10"
[56] "name=HUE HD Camera,size=864x480,fps=20"
[57] "name=HUE HD Camera,size=800x600,fps=10"
[58] "name=HUE HD Camera,size=800x600,fps=20" OK
[59] "name=HUE HD Camera,size=960x544,fps=10"
[60] "name=HUE HD Camera,size=960x544,fps=20"
[61] "name=HUE HD Camera,size=1024x576,fps=15"
[62] "name=HUE HD Camera,size=960x720,fps=15"
[63] "name=HUE HD Camera,size=1184x656,fps=10"
*/
