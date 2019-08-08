void clearCanvas() {
  fill(white);
  rect(0, 0, width, height);
}

int frameCount = 1;
void frameCount() {
  if (frameCount < 60) {
    frameCount++;
  } else {
    frameCount = 1;
  }
}
