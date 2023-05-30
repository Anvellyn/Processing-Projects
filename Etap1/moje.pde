import peasy.*;

//slonce
public class Slonce {
  
  private PShape ksztalt;
  PImage img = loadImage("slonce.jpg");
  public Slonce(float promien) {
    ksztalt=createShape(SPHERE, promien);
    ksztalt.setTexture(img);
  }
  
  public void wyswietl(){
    pushMatrix();
    shape(ksztalt);
    popMatrix();
  }
}

public class Planeta {

  private PShape ksztalt;
  private PVector vector = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  private float promien, kat, predkosc;
  private boolean swiatlo;
  private Ksiezyc[] ksiezyce;

  public Planeta(float prom, float odleglosc, float pred, boolean swiat, int ileKsiezycow, boolean dodatek) {
    promien=prom;    
    predkosc=pred;
    swiatlo=swiat;
    vector.mult(odleglosc);
    kat = radians(random(360));
    ksztalt=createShape(SPHERE, promien);
    
    ksztalt.setFill(color(random(255), random(255), random(255)));
    ksiezyce = new Ksiezyc[ileKsiezycow];
    for (int i = 0; i < ksiezyce.length; i++) {
        if (i%2 == 0){
        ksiezyce[i]=new Ksiezyc(promien/3, 70 + (i*20), random(2), false);
        }
        else {
        ksiezyce[i]=new Ksiezyc(promien/3, 70 + (i*20), random(2), true);
        }
      }
      if (dodatek) {
        //lightSpecular(0, 255, 0);
       // shininess(5.0);
      }
  }
  public Planeta(float dist, float spe) {
    PShape shape = loadShape("magnet.obj");  
    predkosc=spe; 
    swiatlo = false;
    vector.mult(dist);
    kat = radians(random(360));
    ksztalt=shape;
    ksztalt.setFill(color(random(255), random(255), random(255)));
    ksztalt.scale(15);
  }

  public void wyswietl() {
    pushMatrix();
    PVector vecTmp = new PVector(1, 0, 1);
    PVector vecProduct = vector.cross(vecTmp);
    rotate(kat, vecProduct.x, vecProduct.y, vecProduct.z);
    /*if (swiatlo) { 
      float lightPosX = vector.x - (promien/2);
      float lightPosY = vector.y - (promien/2);
      float lightPosZ = vector.z - (promien/2);
      float lightDirX = 1;
      float lightDirY = 0;
      float lightDirZ = 1;
      float angleFalloff = radians(30);
      float concentration = 1;
      spotLight(255, 255, 255, lightPosX, lightPosY, lightPosZ, lightDirX, lightDirY, lightDirZ, angleFalloff, concentration);
    }*/
    translate(vector.x, vector.y, vector.z);
    shape(ksztalt);
    kat+=predkosc;
    if (ksiezyce!=null) {
      for (int i = 0; i < ksiezyce.length; i++) {
        ksiezyce[i].wyswietl();
      }
    }
    popMatrix();
  }
}


public class Ksiezyc {
  
  private PShape ksztalt;
  private PVector vector = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  private float kat, predkosc;

  public Ksiezyc(float promien, float dist, float spe, boolean czyBox) {  
    predkosc = spe/30;
    vector.mult(dist);  
    kat = radians(random(360));  
    if (czyBox){
    ksztalt = createShape(BOX, promien);
    }
    else {
      ksztalt = createShape(SPHERE, promien);
    }
    ksztalt.setFill(color(random(255), random(255), random(255)));
  }

  public void wyswietl() {
    pushMatrix();
    PVector vecTmp = new PVector(1, 0, 1);     
    PVector vecProduct = vector.cross(vecTmp);
    rotate(kat, vecProduct.x, vecProduct.y, vecProduct.z);
    translate(vector.x, vector.y, vector.z); 
    shape(ksztalt);
    kat+=predkosc;
    popMatrix();
  }
}

Slonce sun;
PeasyCam peasy;
Planeta planet;
Planeta planet2;
Planeta planet3;
Planeta planet4;


void setup() {
  size (1920, 1080, P3D);
  background(0);
  noStroke();
  peasy = new PeasyCam(this, 1000);
 sun=new Slonce(100);
 planet = new Planeta(20, 250, 0.002, true, 2, false);
 planet2 = new Planeta(400, 0.002);
 planet3 = new Planeta(30, 600, 0.005, true, 2, false);
 planet4 = new Planeta(35, 1000, 0.002, true, 3, true);
 float lightPosX = 1000;
  float lightPosY = 1000;
  float lightPosZ = -1000;
  pointLight(0, 0, 255, lightPosX, lightPosY, lightPosZ);
}


void draw() {
  background(0);
  sun.wyswietl();
  //
  // Pozostałe ustawienia oświetlenia i rysowanie planet
  lightSpecular(0, 255, 0);
  pointLight(255,0,0, 0, 0, 0);
  ambientLight(0, 0, 128);

  planet.wyswietl();
  planet3.wyswietl();
  planet4.wyswietl();
  planet2.wyswietl();
  specular(0, 255, 0);
  shininess(50.0);
  planet4.wyswietl();
}
