moonrune m;
void setup () {
      size(200, 200);
      m = new moonrune(50);
}
void draw() {
      background(#FF3144);
      m.display(15, 15);
}
void mousePressed() {
      m.generate();
}


int runeSize = 5; 
int blockPixSze = 10; 
color fillcol = color(#2E282A);
color strokecol = color(#00FF00);

class moonrune {
      int generation_method = 1; 
      int seed;
      boolean [][] rune = new boolean[runeSize][runeSize];
      public moonrune(int s) {
            this.seed = s;
      }

      public void generate () {
            seed++;
            rune = new boolean[runeSize][runeSize];
            randomSeed(seed);
            if (generation_method == 0 ) { // complete random
                  for (int i = 0; i< runeSize; i++) {
                        for (int j = 0; j< runeSize; j++) {
                              if (int(random(2)) == 0)
                                    rune[i][j] = true;
                        }
                  }
            } else if (generation_method == 1) { // random with symmetry
                  int mid;
                  boolean even = runeSize %2 == 0;
                  if (even)
                        mid = runeSize/2;
                  else 
                  mid = runeSize/2+1;

                  //generate up and including midpoint
                  for (int i = 0; i< mid; i++) {
                        for (int j = 0; j< runeSize; j++) {
                              if (int(random(2)) == 0)
                                    rune[i][j] = true;
                        }
                  }

                  //mirror left side
                  for (int i = mid; i< runeSize; i++) {
                        for (int j = 0; j< runeSize; j++) {
                              rune[i][j] = rune[runeSize-1-i][j];
                        }
                  }
            }
      }

      public void display(int xm, int ym) {
            for (int i = 0; i< runeSize; i++) {
                  for (int j = 0; j< runeSize; j++) {
                        if (rune[i][j]) {
                              fill(fillcol);
                              stroke(strokecol);
                              rect(i*blockPixSze + xm, j*blockPixSze + ym, blockPixSze, blockPixSze);
                        }
                  }
            }
      }
}