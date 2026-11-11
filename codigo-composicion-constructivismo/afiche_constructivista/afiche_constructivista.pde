float marco = 14;
float horizonte = 540;

void setup() {
size(375, 680); // más compacto para que se vea completo en celular
smooth();
}

void draw() {

// -------------------------
// FONDO
// -------------------------
background(86, 171, 230);


// -------------------------
// NUBES
// -------------------------
float nube1 = (frameCount * 0.35) % (width + 180) - 120;
float nube2 = width - ((frameCount * 0.22) % (width + 220)) + 60;

noStroke();
fill(255, 255, 255, 60);
ellipse(nube1, 95, 90, 45);
ellipse(nube1 + 55, 110, 115, 55);

ellipse(nube2, 155, 90, 45);
ellipse(nube2 - 55, 145, 105, 50);


// -------------------------
// TRIÁNGULOS ROSADOS
// -------------------------
fill(245, 50, 190);
triangle(0, 120, 285, 300, 0, 500);

triangle(0, 330, 290, 350, 0, 560);


// -------------------------
// BANDA DIAGONAL
// -------------------------
pushMatrix();
translate(188, 285);
rotate(radians(-16) + sin(frameCount * 0.01) * 0.035);

fill(40, 70, 210);
rect(-270, -34, 540, 68);

fill(70, 165, 255, 140);
rect(-270, 24, 540, 10);
popMatrix();


// -------------------------
// CÍRCULO SUPERIOR
// -------------------------
float moverY = sin(frameCount * 0.03) * 8;

noStroke();
fill(245, 50, 190);
ellipse(278, 138 + moverY, 102, 102);

fill(55, 70, 210);
ellipse(278, 138 + moverY, 50, 50);


// -------------------------
// LÍNEAS DECORATIVAS
// -------------------------
stroke(55, 80, 220);
strokeWeight(6);
float vibracion = sin(frameCount * 0.06) * 4;

line(220, 335 + vibracion, 348, 285 + vibracion);
line(230, 365 - vibracion, 360, 315 - vibracion);


// -------------------------
// BLOQUES
// -------------------------
noStroke();
float bloque = sin(frameCount * 0.02) * 6;

fill(60, 120, 225);
rect(205 + bloque, 440, 112, 40);

fill(245, 60, 195);
rect(245 - bloque, 495, 90, 24);


// -------------------------
// ESFERAS
// -------------------------
float pulso = 26 + sin(frameCount * 0.05) * 4;

fill(55, 70, 220);
ellipse(72, 515, pulso, pulso);

fill(245, 60, 195);
ellipse(110, 525, 20, 20);


// -------------------------
// CAMINO / GRILLA EN MOVIMIENTO
// -------------------------
drawCamino();


// -------------------------
// MARCO
// -------------------------
noFill();
stroke(40, 70, 210);
strokeWeight(4);
rect(marco, marco, width - marco * 2, height - marco * 2);
}


void drawCamino() {

float baseY = height - marco;
float leftBase = 8;
float rightBase = width - marco;
float vpX = width + 22; // punto de fuga un poco hacia la derecha
float vpY = horizonte;

// fondo suave del camino
noStroke();
fill(150, 205, 245, 65);
quad(leftBase, baseY, rightBase, baseY, vpX, vpY, width * 0.58, vpY);

// líneas de profundidad
stroke(220, 240, 255, 95);
strokeWeight(1);

for (int i = 0; i <= 16; i++) {
float xb = map(i, 0, 16, leftBase, rightBase);
line(xb, baseY, vpX, vpY);
}

// bandas horizontales que van avanzanfo de a poquito"
float avance = (frameCount * 0.045) % 1.0;

for (int i = 0; i < 18; i++) {

float t = (i + avance) / 18.0;
float p = pow(t, 1.75);

float y = lerp(vpY, baseY, p);
float x1 = lerp(vpX, leftBase, p);
float x2 = lerp(vpX, rightBase, p);

stroke(235, 245, 255, 125);
line(x1, y, x2, y);
}
}
