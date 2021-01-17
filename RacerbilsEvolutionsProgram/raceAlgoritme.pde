class raceAlgoritme {
  public ArrayList<CarController> bestCar  = new ArrayList<CarController>();
  public boolean bestCarListIsFull = false;

  void findParrents() {
    if (!bestCarListIsFull) {
      for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
        CarController carCon = carSystem.CarControllerList.get(i);
        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        float Greenish = carCon.sensorSystem.clockWiseRotationFrameCounter;
        if (s.overLine &&60 < Greenish  ) {
          bestCar.add(carSystem.CarControllerList.get(i));
        }
        s.overLine = false;

        if (bestCar.size() == 2) {
          
          bestCarListIsFull = true;
         
          break;
        }
      }
    } else {
      print(bestCar.size());
      NewGen();
    }
  }

  void NewGen() {
    print(bestCar.size());
    carSystem.CarControllerList.clear();
    for (int i=0; i<populationSize; i++) { 
      CarController controller = new CarController();
      
      controller = parre(bestCar.get(0), bestCar.get(1));
      carSystem.CarControllerList.add(controller);
    }
    bestCar.clear();
    bestCarListIsFull = false;
  }
  
  CarController parre(CarController car1, CarController car2) {
    CarController child = new CarController();
    float[] newWeights = new float[8];

    for (int i = 0; i<newWeights.length; ++i) {
      float random = (float)Math.random();

      if (random > .5) {
        float f = car1.hjerne.weights[i];
        newWeights[i]= f;
      } else {
        float f = car2.hjerne.weights[i];
        newWeights[i]= f;
      }
      float r = (float)Math.random();
      if (r > .9) {
      newWeights[i] = random(-car1.varians, car2.varians);
      }
    }
    child.hjerne.weights = newWeights;
    return child;
  }
  
   

  void removeBadOnes() {
    if (frameCount%200==0) {
      println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
      for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
     

        SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
        float Greenish = s.clockWiseRotationFrameCounter;
        if (s.whiteSensorFrameCount > 0||10> Greenish ) {
          carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
        }
        
      }
    }
  }
}
