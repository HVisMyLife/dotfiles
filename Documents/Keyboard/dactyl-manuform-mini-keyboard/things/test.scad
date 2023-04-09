difference () {
  union () {
    translate ([-38.121819219172885, 29.255592233168752, 1]) {
      cube ([4, 2, 2], center=true);
    }
  }
  union () {
    translate ([-38.121819219172885, 30.255592233168752, 4]) {
      rotate (a=90.0, v=[1, 0, 0]) {
        cylinder ($fn=30, h=20, r=2.55, center=true);
      }
    }
    translate ([-38.121819219172885, 28.255592233168752, 2]) {
      cube ([0, 0, 0], center=true);
    }
  }
}
