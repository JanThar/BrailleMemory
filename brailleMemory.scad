scaleLetter=2;
cardEdge = 30;

brailleDistance = 2.5*scaleLetter;
brailleDot = 1*scaleLetter;
resolution = 18;

cardLong = 80;
cardShort = 50;

fingergap = 10;
coordinatecross = 30;

cardBottom = 1;
cardTop = 1;

$charKeys = [
    "a","b","c","d","e","f","g","h","i","j",
    "k","l","m","n","o","p","q","r","s","t",
    "u","v","x","y","z","&","%","[","ß","st",
    "au","eu","ei","ch","sch","`","^","ü","ö","w",
    ",",":","~","\"",">",
    ".",";","+","*","äu","ä",
    "-",">>","()","<<","ie","#",
    "'","?","/","<","$","_"
    ];

$charValues = [
    [1],[1,2],[1,4],[1,4,5],[1,5],[1,2,4],[1,2,4,5],[1,2,5],[2,4], [2,4,5], 
    [1,3],[1,2,3],[1,4,3],[1,4,5,3],[1,5,3],[1,2,4,3],[1,2,4,5,3],[1,2,5,3],[2,4,3], [2,4,5,3], 
    [1,3,6],[1,2,3,6],[1,4,3,6],[1,4,5,3,6],[1,5,3,6],[1,2,4,3,6],[1,2,4,5,3,6],[1,2,5,3,6],[2,4,3,6], [2,4,5,3,6], 
    [1,6],[1,2,6],[1,4,6],[1,4,5,6],[1,5,6],[1,2,4,6],[1,2,4,5,6],[1,2,5,6],[2,4,6], [2,4,5,6], 
    [2],[2,5],[5],[4],[4,5],
    [3],[2,3],[2,5,3],[5,3],[4,3],[4,5,3],
    [3,6],[2,3,6],[2,5,3,6],[5,3,6],[4,3,6],[4,5,3,6],
    [6],[2,6],[2,5,6],[5,6],[4,6],[4,5,6]
    ];
    
$romanNumbers = ["","I","II","III","IV","V","VI","VII","VIII",""
    ];
    
$gameModi = ["Memory","Speak","1P-Bet","2P-Bet","3P-Bet","4P-Bet","Scrabble","Domino","Pairs"];

variante = 0; // 0...7
//backBlock();
//blackBlock();
//brailleBlock();

//betBlock();
//betBlockBack();

offset=1; // 0...2
//connectorTopBlock();
//connectorMiddleBlock();

//connectorMiddle();
//translate([0,0,-2*cardBottom])
//connectorEdge ();

//connectorBottomBlock();
//connectorBottom ();

//connectorBottom ();
//connectorEdge ();

//gameCards();

//box();

threeReaderBox();

module threeReaderBox() {
    difference() {
    hull() {
        for(i=[0:1]) {
            for(j=[0:1]) {
                for(k=[0:1]) {
            translate([i*165-82.5,j*60-30,k*27-13.5])
                sphere(d=5,center=true, $fn=resolution);
                }
            }
        }
    }
    translate([0,9+cardShort/2,14.25-1])
        classicCardBaseForm(cardEdge+1, cardShort*2, cardShort, cardBottom+cardTop+1);
    translate([-55,9+cardShort/2,14.25-1])
        classicCardBaseForm(cardEdge+1, cardShort*2, cardShort, cardBottom+cardTop+1);
    translate([+55,9+cardShort/2,14.25-1])
        classicCardBaseForm(cardEdge+1, cardShort*2, cardShort, cardBottom+cardTop+1);
    
    translate([0,9+cardShort/2,14.25+1])
        classicCardBaseForm(cardEdge-2, cardShort*2, cardShort, cardBottom+cardTop+1);
    translate([-55,9+cardShort/2,14.25+1])
        classicCardBaseForm(cardEdge-2, cardShort*2, cardShort, cardBottom+cardTop+1);
    translate([+55,9+cardShort/2,14.25+1])
        classicCardBaseForm(cardEdge-2, cardShort*2, cardShort, cardBottom+cardTop+1);
    
    translate([0,0,-3])
        cube([40,60, 26], center=true);
    translate([-55,0,-3])
        cube([40,60, 26], center=true);
    translate([55,0,-3])
        cube([40,60, 26], center=true);
    
    translate([0,0,-3-4])
        cube([49,60, 18], center=true);
        
    translate([30,6.5,-5])
        cube([8,47,21], center=true);
    
    translate([55,0,-3])
        cylinder(d=50,h=26,center=true);
    translate([-55,0,-3])
        cylinder(d=50,h=26,center=true);
    
    translate([0,0,-15.5])
        cube([165,60, 1], center=true);
        
    translate([0,-5,+10])
        cube([40,5, 2], center=true);
    translate([0,-21,+10])
        cube([40,18, 2], center=true);
    translate([0,-6.5-17,+10])
        cube([40,13,4], center=true);
        
    translate([-55,-5,+10])
        cube([40,5, 2], center=true);
    translate([-55,-21,+10])
        cube([40,18, 2], center=true);
    translate([-55,-6.5-17,+10])
        cube([40,13,4], center=true);

    translate([+55,-5,+10])
        cube([40,5, 2], center=true);
    translate([+55,-21,+10])
        cube([40,18, 2], center=true);
    translate([+55,-6.5-17,+10])
        cube([40,13,4], center=true);
    
    translate([0,0,3])
        rotate([0,90,0])
        cylinder(d=10,h=100, center=true);
    translate([0,-20,3])
        rotate([0,90,0])
        cylinder(d=10,h=100, center=true);
    translate([0,20,3])
        rotate([0,90,0])
        cylinder(d=10,h=100, center=true);
        
    translate([3.5+20+55,-1,-36])
    cube([2.5,8.5,100],center=true);
        translate([3.5+20-55,-1,-36])
    cube([2.5,8.5,100],center=true);
        translate([3.5+20,-1,-36])
    cube([2.5,8.5,100],center=true);
    
   translate([55,32.5,0])
rotate([90,0,0])
    hull() {
        translate([0,11,0])
        cube([51,2,2],center=true);
        translate([51/2-23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-51/2+23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    }
       translate([-55,32.5,0])
rotate([90,0,0])
    hull() {
        translate([0,11,0])
        cube([51,2,2],center=true);
        translate([51/2-23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-51/2+23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    }
       translate([0,32.5,0])
rotate([90,0,0])
    hull() {
        translate([0,11,0])
        cube([51,2,2],center=true);
        translate([51/2-23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-51/2+23/2,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    }

   translate([0,-32.5,0])
rotate([90,0,0])
    hull() {
        translate([170/2-16,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-170/2+16,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    } 
       translate([-170/2,0,0])
rotate([90,0,90])
    hull() {
        translate([30-14,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-30+14,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    } 
       translate([170/2,0,0])
rotate([90,0,90])
    hull() {
        translate([30-14,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
        translate([-30+14,0,0])
        cylinder(d=23, h=2, $fn=resolution*2, center=true);
    } 

}
}

module gameCards() {
    for (i=[0:8]) { // 8 Drucke -> 
        translate([ceil(i/3)%3*(cardShort+2),i%3*(cardShort+2),0])
        gameCardTop($gameModi[i+variante*9]);
    }
}

module box() {
    difference() {
    difference() {
        union() {
        translate([8,0,22.5])
            cylinder(d=106,h=45, center=true, $fn=resolution*4);
        translate([8,0,45])
            resize([106,106,32])
            sphere(d=106, center=true, $fn=resolution*4);
    }
    union() {
        translate([8,0,22.5])
            cylinder(d=100,h=45, center=true, $fn=resolution*4);
        translate([8,0,45])
            resize([100,100,26])
            sphere(d=100, center=true, $fn=resolution*4);
    }
}
union() {
    //translate([-12.5,2.5,23])
    //cube([80,80,58], center=true);
    translate([0,0,-5+52])
    union() { // RFID reader
        translate([0,0,-2])
        cube([42,70,4], center=true);
        translate([0,70/2-27/2,2.5])
        cube([42,27,5], center=true);
        translate([0,0,0.5])
        cube([42,10,1], center=true);
    } 
    translate([40,0,26])
    rotate([0,90,0])
    union() { // speaker
        translate([0,0,5])
        cylinder(d=52,h=15, $fn=resolution*2, center=true); 
        cylinder(d=24,h=25, $fn=resolution*2, center=true); 
    }
    translate([-32,0,25])
    rotate([0,90,0])  
     union() { // Emic 2
        translate([0,0,-2])
        cube([40,33,10], center=true);
    }       
  
    translate([0,0,18])
    union() { // Batterie Pack
        cube([49,60,20], center=true);
    }   
    
    translate([0,0,-15/2+52-9])
    rotate([0,0,0])  
    union() { // Arduino
        cube([55,75,15], center=true);
    }   
}
}
                                    // Buttons
    

}

module connectorBottomBlock() {
    for(i=[0:5]) {
        translate([2*(cardShort+fingergap+2*cardBottom),i*(coordinatecross-cardBottom*3),0])
            connectorBottom ();
        translate([cardShort+fingergap+2*cardBottom,i*(coordinatecross-cardBottom*3),0])
            connectorBottom ();
        translate([0,i*(coordinatecross-cardBottom*3),0])
            connectorBottom ();
    }
    for(i=[0:4]) {
        translate([0.5*(cardShort+fingergap+2*cardBottom),i*(coordinatecross-cardBottom*3),0])
            connectorEdge ();
        translate([0.5*(cardShort+fingergap+2*cardBottom)+cardShort+fingergap+2*cardBottom,i*(coordinatecross-cardBottom*3),0])
            connectorEdge ();
    }
}

module connectorTopBlock() {
    for (i=[0:35]) {
        translate([(floor(i/6))%6*((coordinatecross-cardBottom*2)+cardBottom*2),i%6*((coordinatecross-cardBottom*2)+cardBottom*2),0])
            connectorTop($romanNumbers[floor((i+offset*36)/9)%9],$romanNumbers[(i+offset*36)%9]);
    }
}

module connectorMiddleBlock() {
    for (i=[0:35]) {
        translate([ceil(i/6)%6*((coordinatecross-cardBottom*2)+cardBottom*2),i%6*((coordinatecross-cardBottom*2)+cardBottom*2),0])
            connectorMiddle();
    }
}

module connectorTop(number1, number2) {
    hull () {
        cylinder(d=cardTop,h=cardTop, center=true, $fn=resolution);
        translate([cardShort/4,0,0])
        cylinder(d=cardTop,h=cardTop, center=true, $fn=resolution);
    }
    hull () {
        cylinder(d=cardTop,h=cardTop, center=true, $fn=resolution);
        translate([0,-cardShort/4,0])
        cylinder(d=cardTop,h=cardTop, center=true, $fn=resolution);
    }
    translate([-cardShort/6,-0,-cardTop/2])
        linear_extrude(height = cardTop) {
            rotate([0,0,-90])
            text(text=number1, font="Helvetica Neue:Normal", size=cardShort/8, halign="center", valign="center", $fn=resolution);
        }
    rotate([0,0,-90])
        translate([-cardShort/6,0,-cardTop/2])
        linear_extrude(height = cardTop) {
        rotate([0,0,-90])
        text(text=number2, font="Helvetica Neue:Normal", size=cardShort/8, halign="center", valign="center", $fn=resolution);
    }
}


module connectorMiddle() {
    //translate([(cardShort+fingergap)/2,0,0])
    union() {
    color("Orange",1)
        difference() {
            translate([0,0,-cardBottom*9/4])
                difference() {
                    cube([coordinatecross-cardBottom*2,coordinatecross-cardBottom*2,cardBottom*7/2], center=true);
                    translate([(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop+cardBottom*3, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop+cardBottom*3, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                    translate([(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop+cardBottom*3, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop+cardBottom*3, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                }
            translate([0,0,-cardBottom*4])
                cylinder(d=fingergap+cardTop,h= cardBottom*6, center=true, $fn=resolution*4);
        }
    }
}

module connectorEdge () {
    intersection() {
        connectorCenter();
        rotate([0,0,45])
        translate([0,0,-cardShort*cardShort/2])
            cube([cardShort*cardShort,cardShort*cardShort,cardShort*cardShort]);
    }
}

        
module connectorBottom () {
    color("Grey",1)
    intersection() {
            translate([-(cardShort+fingergap)/2,0,0])
        union() {
            difference() {
                translate([0,0,-cardBottom/2*5])
                    cube([cardShort*cardShort,cardEdge+fingergap-(cardEdge+cardTop-cardBottom*8),cardBottom], center=true); // width??
                hull() {
                    translate([(cardEdge+fingergap*3/2-(cardEdge+cardTop-cardBottom*10)),0,0])
                        cylinder(d=fingergap, h=cardBottom*10, center=true,  $fn=resolution*4);
                    translate([cardShort+fingergap-(cardEdge+fingergap*3/2-(cardEdge+cardTop-cardBottom*10)),0,0])
                        cylinder(d=fingergap, h=cardBottom*10, center=true,  $fn=resolution*4);
                }
            }
            translate([0,0,0])
                connectorCenter();
            translate([cardShort+fingergap,0,0])
                connectorCenter();
        }
        rotate([0,0,45])
            cube(sqrt(pow(cardShort+fingergap,2)/2),sqrt(pow(cardShort+fingergap,2)/2),100, center=true);
    }
}


module connectorCenter () {
    difference() {
        union() {
            translate([0,0,-cardBottom/2*3])
                difference() {
                    cube([coordinatecross+cardBottom*4,coordinatecross+cardBottom*4,cardBottom], center=true);
                    translate([(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*4, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*4, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*4, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*4, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                }
            translate([0,0,-cardBottom/2*5])
                difference() {
                    cube([coordinatecross+cardBottom*8,coordinatecross+cardBottom*8,,cardBottom], center=true);
                    translate([(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*8, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*8, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*8, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop-cardBottom*8, h=cardBottom+cardTop*2, center=true, $fn=resolution*4);
                }
            translate([0,0,cardBottom/2])
                difference() {
                    cube([coordinatecross,coordinatecross,cardBottom*3], center=true);
                    translate([(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop, h=cardBottom+cardTop*10, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop, h=cardBottom+cardTop*10, center=true, $fn=resolution*4);
                    translate([(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop, h=cardBottom+cardTop*10, center=true, $fn=resolution*4);
                    translate([-(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                        cylinder (d=cardEdge+cardTop, h=cardBottom+cardTop*10, center=true, $fn=resolution*4);
                }
            }
        translate([0,0,cardBottom/2])
            difference() {
                cube([coordinatecross-cardBottom*2,coordinatecross-cardBottom,cardBottom*5], center=true);
                translate([(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                    cylinder (d=cardEdge+cardTop+cardBottom*2, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                translate([-(cardEdge/2+fingergap/2),(cardEdge/2+fingergap/2),0])
                    cylinder (d=cardEdge+cardTop+cardBottom*2, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                translate([(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                    cylinder (d=cardEdge+cardTop+cardBottom*2, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
                translate([-(cardEdge/2+fingergap/2),-(cardEdge/2+fingergap/2),0])
                    cylinder (d=cardEdge+cardTop+cardBottom*2, h=cardBottom+cardTop*4, center=true, $fn=resolution*4);
            }
    }
    translate([0,0,-cardBottom])
    cylinder(d=fingergap,h= cardBottom*4, center=true, $fn=resolution*4);
}

// =, ≠
module betBlock() {
    symmetricCardBlack("=");
    translate([0,1*(cardShort+2),0])
    symmetricCardBlack("≠");
}

module betBlockBack() {
    symmmetricCardBack();
    translate([0,1*(cardShort+2),0])
    symmmetricCardBack();
}


// Standard text
module blackBlock() {
    for (i=[0:8]) { // 8 Drucke -> 
        translate([ceil(i/3)%3*(cardShort+2),i%3*(cardShort+2),0])
        symmetricCardBlack($charKeys[i+variante*9]);
    }
}

// Braille text
module brailleBlock() {
    for (i=[0:8]) { // 8 Drucke -> 
        translate([ceil(i/3)%3*(cardShort+2),i%3*(cardShort+2),0])
        symmetricCardBraille($charValues[i+variante*9]);
    }
}

module backBlock() {
    for (i=[0:8]) { // 8 Drucke -> 
        translate([ceil(i/3)%3*(cardShort+2),i%3*(cardShort+2),0])
        symmmetricCardBack();
    }
}

module symmetricCardBraille(matrix) {
    symmmetricCardTop();    
    translate([-cardShort/3.2,0,cardTop/2])
        brailleLetter(matrix);
    translate([cardShort/3.2,0,cardTop/2])
        rotate([0,0,180])
        brailleLetter(matrix);
    translate([0,-cardShort/3.2,cardTop/2])
        rotate([0,0,90])
        brailleLetter(matrix);
    translate([0,cardShort/3.2,cardTop/2])
        rotate([0,0,270])
        brailleLetter(matrix);
}

module symmetricCardBlack(letter) {
    symmmetricCardTop();    
    translate([-cardShort/3.2,0,cardTop/2])
        blackLetter(letter);
    translate([cardShort/3.2,0,cardTop/2])
        rotate([0,0,180])
        blackLetter(letter);
    translate([0,-cardShort/3.2,cardTop/2])
        rotate([0,0,90])
        blackLetter(letter);
    translate([0,cardShort/3.2,cardTop/2])
        rotate([0,0,270])
        blackLetter(letter);
}

module symmmetricCardTop() {
    translate([0,0,cardTop/2])
    difference() {
        classicCardBaseForm(cardEdge, cardShort, cardShort, cardTop);
        classicCardBaseForm(cardEdge-cardTop*2, cardShort, cardShort,  cardTop*2);
    }
    intersection() {
        union() {
            translate([0,0,cardTop/4])
                rotate([0,0,45])
                cube([cardTop,cardShort*2,cardTop/2], center=true);            
            translate([0,0,cardTop/4])
                rotate([0,0,-45])
                cube([cardTop,cardShort*2,cardTop/2], center=true);
        }
        translate([0,0,cardTop/2])
            classicCardBaseForm(cardEdge, cardShort, cardShort, cardTop);
    }
}

module gameCardTop(blackLetter) {
    translate([0,0,cardTop/2])
    difference() {
        classicCardBaseForm(cardEdge, cardShort, cardShort, cardTop);
        classicCardBaseForm(cardEdge-cardTop*2, cardShort, cardShort,  cardTop*2);
    }
//    intersection() {
//        union() {
//            translate([0,0,cardTop/4])
//                rotate([0,0,45])
//                cube([cardTop,cardShort*2,cardTop/2], center=true);            
//            translate([0,0,cardTop/4])
//                rotate([0,0,-45])
//                cube([cardTop,cardShort*2,cardTop/2], center=true);
//        }
//        translate([0,0,cardTop/2])
//            classicCardBaseForm(cardEdge, cardShort, cardShort, cardTop);
//    }
    
        translate([brailleDistance*2+brailleDot,0,0])
        linear_extrude(height = cardTop) {
            rotate([0,0,-90])
            text(text=blackLetter, font="Helvetica Neue:Normal", size=(brailleDistance*2+brailleDot)/2, halign="center", valign="center", $fn=resolution);
        }

        translate([-brailleDistance*2-brailleDot,0,0])
        linear_extrude(height = cardTop) {
            rotate([0,0,-90])
            text(text=blackLetter, font="Braille deutsch", size=(brailleDistance*2+brailleDot)/3, halign="center", valign="center", $fn=resolution);
        }
}

module symmmetricCardBack() {
    translate([0,0,-cardBottom/2])
        classicCardBaseForm(cardEdge, cardShort, cardShort,  cardBottom);   
}


module classicCardBaseForm(radius, length, width, height) {
    hull() {
        translate([width/2-cardEdge/2,length/2-cardEdge/2,0])
        cylinder (d=radius, h=height, center=true, $fn=resolution*4);
        translate([width/2-cardEdge/2,-length/2+cardEdge/2,0])
        cylinder (d=radius, h=height, center=true, $fn=resolution*4);
        translate([-width/2+cardEdge/2,length/2-cardEdge/2,0])
        cylinder (d=radius, h=height, center=true, $fn=resolution*4);
        translate([-width/2+cardEdge/2,-length/2+cardEdge/2,0])
        cylinder (d=radius, h=height, center=true, $fn=resolution*4);
    }
}

module brailleLetter (matrix) {
    for(i = [0:len(matrix)-1]) {
        translate([brailleDistance*((matrix[i]-1)%3)-brailleDistance,brailleDistance*floor((matrix[i]-1)/3)-brailleDistance/2,0]) cylinder(d=1*brailleDot, h=cardTop, center=true, $fn=resolution);
    }
}

module blackLetter (blackLetter) {
        translate([0,0,-cardTop/2])
        linear_extrude(height = cardTop) {
            rotate([0,0,-90])
            text(text=blackLetter, font="Helvetica Neue:Normal", size=brailleDistance*2+brailleDot, halign="center", valign="center", $fn=resolution);
        }
}

module brailleLetter1 (blackLetter) {
        translate([0,0,-cardTop/2])
        linear_extrude(height = cardTop) {
            rotate([0,0,-90])
            text(text=blackLetter, font="Braille deutsch", size=brailleDistance*2+brailleDot, halign="center", valign="center", $fn=resolution);
        }
}