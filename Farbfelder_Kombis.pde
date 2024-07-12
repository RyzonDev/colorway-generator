import java.util.ArrayList;
import processing.core.PApplet;
import processing.core.PImage;

ArrayList<Integer> backgroundColors;
ArrayList<Integer> triangleColors;
PApplet parent;

// Farbcodes und Farbnamen definieren
int[] colorCodes = {
  #000000, 
  #000000, 
  #000000,
  #032952, 
  #032952, 
  #032952, 
  #61032b, 
  #61032b, 
  #003b42, 
  #91cbdf,
  #c7e0c8, 
  #404040, 
  #f0ded9,
  #f0f0f0, 
  #edebe9, 
  #381a5c, 
  #9ebdd6, 
  #605545, 
  #A98A69, 
  #f7a55f,
  #d6dad9, #d6dad9, #454247, #d6dad9, #a59f9e, #9ea99c, #fd6148, #aba7b1, #000000, #dcd9e3,
  #4a5768,#f0f0f0, #bcbac4, #787885, #2e3e67, #4a4848, #262d2d, #262d2d, #F0EDF5, #AAA9AC,
  #ddebdf, #b0ac98, #5b636c, #cfd9d4, #82778d, #5e788d, #ebc86d, #534f5c, #50708b, #032952,
  #4a4a4a, #59637c, #4a5557, #a2727f, #224367, #916e68, #8a6d69, #d97837, #33302c, #142438,
  #016a4b, #943030, #00489F, #1a4397, #cecebf, #cc8544, #c96745, #93aeca, #b5b791, #d2a366,
  #42485b, #74837e, #4b4a85, #90402c
};

String[] colorNames = {
  "knight-black", 
  "knight-black-melange", 
  "knight-black-reflective-print", 
  "abyss-blue", 
  "abyss-blue-melange",
  "abyss-blue-reflective-print", 
  "velvet-red", 
  "velvet-red-melange", 
  "sunken-teal", 
  "electric-blue",
  "frozen-green", 
  "gravel-grey", 
  "orchid-haze", 
  "arctic-white", 
  "clouded-dune", 
  "purple-shadow", 
  "blurred-nebular",
  "stone-green", 
  "rigid-copper", "burnt-copper", "sportsgrey-light", "sportsgrey-light-reflective-print",
  "sportsgrey-dark", "sportslight-grey", "coffee-dye", "dusted-olive", "melted-red", "lilac-bloom",
  "ryzon-x-andre-greipel", "ryzon-x-andre-greipel-bright", "ryzon-x-andre-greipel-dark", "bright",
  "decode-bright", "decode-dark", "frodissimo", "nocturnal-black", "charcoal-black",
  "charcoal-black-reflective-print", "iced-grey", "deep-grey", "frozen-mint", "desert-dusk", "nightfall",
  "faded-grey", "purple-dawn", "faded-sky", "amber-gold", "pari-run-club-los-angeles-edt", "blue-lagoon",
  "ryzon-x-la-marzocco", "reflective-grey", "violet-dusk", "hidden-pine", "shaded-lavender", "coastal-blue", "hazed-brown",
  "hazy-beige", "golden-desert", "drained-green", "dark-blue", "green-dew", "soaked-red", "solar-blue", "blue-royal",
  "pistachio-cream", "ocher-clay", "timber-brown", "blue-void", "green-glare", "cocoa-gold", "far-blue", "turquoise-ash",
  "purple-grape", "cinnamon-red"
};


void setup() {
  size(64, 64);
  noStroke(); 
  frameRate(60);
  
  backgroundColors = new ArrayList<Integer>();
  triangleColors = new ArrayList<Integer>();
  
  // Hintergrundfarben und Dreiecksfarben hinzufügen
  for (int i = 0; i < colorCodes.length; i++) {
    for (int j = 0; j < colorCodes.length; j++) {
      backgroundColors.add(colorCodes[i]);
      triangleColors.add(colorCodes[j]);
    }
  }
}

void draw() {
  int currentColorIndex = frameCount - 1;
  String colorName1 = getColorName((currentColorIndex / colorCodes.length) % colorCodes.length);
  String colorName2 = getColorName(currentColorIndex % colorCodes.length);
  String colorNameCombination = colorName1 + "-" + colorName2;
  if (colorName1 == colorName2) {
    colorNameCombination = colorName1;
  }
  String fileName = "./export/" + colorNameCombination + ".png";
  File file = new File(fileName);
  
  if (!file.exists()) {
    background(backgroundColors.get(currentColorIndex));
 
    // Rechteck zeichnen
    fill(triangleColors.get(currentColorIndex));
    rect(height / 2, 0, width / 2, height);
    saveImage(fileName);
  
    if (frameCount >= backgroundColors.size()) {
      noLoop();
    }
  }
}

String getColorName(int index) {
  if (index >= 0 && index < colorNames.length) {
    return colorNames[index];
  } else {
    return "unknown";
  }
}

void saveImage(String fileName) {
  PImage image = get(0, 0, width, height);
  image.save(fileName);
}
