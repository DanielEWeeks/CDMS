boolean drawHelp = false;
long    helpStartMS = millis();
String[] helpLines = {
    "Keyboard Shortcuts:",
    "",
    "0-9    set drawing speed",
    "a-g    change setups",
    "arrows change gears and mount points",
    "x      erase the paper",
    "[ ]    change pen color",
    "< >    change pen width",
    "/      invert connecting rod",
    "~      draw entire cycle",
};

void helpDraw() 
{
  if (drawHelp) {
    long elapsed = millis() - helpStartMS;
    float alpha = constrain(map(elapsed, 10*1000, 13*1000, 1, 0),0,1);
    if (alpha <= 0.0001) {
      drawHelp = false;
    }
    noStroke();

    float hx = width-500*seventyTwoScale;
    float hy = 30*seventyTwoScale-100*constrain(map(elapsed,0,300,1,0),0,1);
    
    fill(255,alpha*alpha*192);
    rect(hx-8, 0, width-(hx-8), hy + 22*helpLines.length);

    fill(100, alpha*alpha*255);

    textFont(hFont);
    textAlign(LEFT);
    for (int i = 0; i < helpLines.length; ++i) {
      text(helpLines[i], hx, hy+22*i);
    }
  }
}

void toggleHelp() 
{
  if (drawHelp) {
    drawHelp = false;
  } else {
    drawHelp = true;
    helpStartMS = millis();
  }
}
