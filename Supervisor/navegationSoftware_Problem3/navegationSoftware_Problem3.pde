

int state = 0; 
String input1="";
String input2="";
boolean buildObject = false;


void setup(){
  
  
  size(1200,600);
  drawFrame();
 

}

void draw(){
  
    update(mouseX, mouseY);
    
   
    
    
    

 
    
}


void keyPressed() {
 
  if(buildObject){
      if (key==ENTER||key==RETURN) {
     
        state = 1;
      }
      else if(key == BACKSPACE){
        input1="";
        input2="";
        state=0;
        fill(255,255,255);
        rect(900, 0, 300, 500, 3, 6, 12, 18); //SideBar
        rect(930, 110, 250, 30, 6,6,6,6); //input1
        rect(930, 210, 250, 30, 6,6,6,6); //input2
        rect(1000, 300, 70, 40, 6,6,6,6); //botão construir
      }
      else{
        
          if(state == 1){
            input2 += key;
          }
          else{
            input1 = input1 + key;
          }
         
      
      }
  }

}

void mousePressed(){
  
    switch(isOver(mouseX,mouseY)){
      
       case "novoObjeto":
         buildObject = true; 
         drawSideBar();
         break;
     
       case "enviar":

         break;
     
       case "construirObjeto":

         break;
     
       case "planejar":

         break;
        
        
       case "voltarSideBar":
       
           buildObject=false;
           drawFrame(); 
           break; 
         
         
       default:
       buildObject =false;
      
    }
 
  
  
  
  
  
}


void update(int x, int y){
  
  
   switch(isOver(x,y)){
     
     case "novoObjeto":
         fill(240);
         rect(1100, 10, 75,40,6,6,6,6); //Botão novo objeto
         fill(0);
         text("Novo Objeto", 1105, 30);
         break;
     
     case "enviar":
         fill(240);
         rect(180,550,90,20,6,6,6,6); //Enviar Button
         fill(0);
         text("Enviar", 210, 565);
         break;
     
     case "construirObjeto":
         fill(240);
         rect(1000, 300, 70, 40, 6,6,6,6); //botão construir
         fill(0);
         text("Construir",1010, 325);
         break;
     
     case "planejar":
        fill(240);
        rect(40,550,120,20,6,6,6,6); //Planejar Percurso button
        fill(0);
        text("Planejar Percurso", 55, 565); 
        break;
     
     case "voltarSideBar":
       fill(240);
       rect(1100, 300, 70,40,6,6,6,6);
       fill(0);
       text("Voltar",1120, 325);
      
       break;
     
     default:
     
       drawFrame();
      
      if(buildObject){
        drawSideBar();
      }
   
   }
   
  
  
}


String isOver(int x, int y){
  
  if( (x <= 1175 && x >= 1100 ) && (y <= 50 && y >= 10) && !buildObject){ 
    return "novoObjeto";
  }
  else if((x <= 270 && x >= 180 ) && (y <= 570 && y >= 550)){
    return "enviar";
  }
  else if( (x <= 160 && x >= 40 ) && (y <= 570 && y >= 550) ){
    return "planejar";
  }
  else if( (x <= 1070 && x >= 1000 ) && (y <= 340 && y >= 300) && buildObject){
    return "construirObjeto";
  }
  else if( (x <= 1170 && x >= 1100 ) && (y <= 340 && y >= 300) && buildObject ){
    
    return "voltarSideBar"; 
  }
  
  return "noOne";
}


void drawSideBar(){
          fill(250);
          rect(900, 0, 300, 500, 3, 6, 12, 18); //SideBar
          rect(930, 110, 250, 30, 6,6,6,6); //input1
          rect(930, 210, 250, 30, 6,6,6,6); //input2
          rect(1000, 300, 70, 40, 6,6,6,6); //botão construir
          rect(1100, 300, 70,40,6,6,6,6); //voltar Button
          fill(0); 
          text("Criação de Objeto", 1000, 50);
          text ("Digite a largara do objeto\n\n"+input1, 930, 100); 
          text("Digite o tamanho do objeto\n\n"+input2,930, 200);
          text("Construir",1010, 325);
          text("Voltar",1120, 325);
  
}

void drawFrame(){
  
  background(251,247,247);
  fill(250);
  rect(1100, 10, 75,40,6,6,6,6); //Botão novo objeto
  fill(0);
  text("Novo Objeto", 1105, 30);
  fill(250);
  rect(40,40,1050, 500); //Quadrado do mapa
  fill(0);
  text("Planejador de percurso",500,20);
  fill(250);
  rect(40,550,120,20,6,6,6,6); //Planejar Percurso button
  fill(0);
  text("Planejar Percurso", 55, 565); 
  fill(250);
  rect(180,550,90,20,6,6,6,6); //Enviar Button
  fill(0);
  text("Enviar", 210, 565); 
  
}