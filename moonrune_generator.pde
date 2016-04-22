moonrune m;
void setup () {
      size(200,200);
      m = new moonrune(50);
}
void draw() {
      background(#FF3144);
      m.display(15,15);
}
void mousePressed(){
      m.generate();
}


int runeSize = 7; 
int blockPixSze = 10; 
color fillcol = color(#2E282A);
color strokecol = color(#FDEEE7);

class moonrune {
      int seed;
      boolean [][] rune = new boolean[runeSize][runeSize];
      public moonrune(int s) {
            this.seed = s;
      }

      public void generate () {
            seed++;
            rune = new boolean[runeSize][runeSize];
            randomSeed(seed);
            for (int i = 0; i< runeSize; i++) {
                  for (int j = 0; j< runeSize; j++) {
                        if (int(random(2)) == 0)
                              rune[i][j] = true;
                        
                  }
            }
      }
      public void display(int xm, int ym){
            for (int i = 0; i< runeSize; i++) {
                  for (int j = 0; j< runeSize; j++) {
                        if (rune[i][j]){
                              fill(fillcol);
                              stroke(strokecol);
                              rect(i*blockPixSze + xm, j*blockPixSze + ym, blockPixSze,blockPixSze);
                        }
                  }
            }      
      }
      
}