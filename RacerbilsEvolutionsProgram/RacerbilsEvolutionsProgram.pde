//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
public int       populationSize  = 100;     

//CarSystem: Indholder en population af "controllere" 
public CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

raceAlgoritme al = new raceAlgoritme();

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  clear();
  fill(255);
  rect(0,50,1000,1000);
  image(trackImage,0,80);  

  carSystem.updateAndDisplay();
  al.removeBadOnes();
  al.findParrents();
  
  if(carSystem.CarControllerList.size()<10){
    for (int i=0; i<20; i++) { 
      CarController controller = new CarController();
      carSystem.CarControllerList.add(controller);
    }
  }
  
}
