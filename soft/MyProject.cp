#line 1 "C:/Users/City_Lap/OneDrive/Desktop/embedded project/soft/MyProject.c"
char count=0;
 void interrupt(){
 while(intf_bit){
 portc=0x00;
 if(portb.b1==0){
 if(porta.b0){
 porta.b2=1;
 porta.B0=0;
 porta.B1=0;
 porte.B1=1;
 porte.B0=0;
 porte.B2=0;
 for(count=3;count>0;count--){
 portc=0;
 portc|= ((count%10) <<4);
 delay_ms(1000);
 }
 porte.B0=1;
 porte.B1=0;
 }
 else if(porte.b0){
 porte.b2=1;
 porte.B0=0;
 porte.B1=0;
 porta.B1=1;
 porta.B0=0;
 porta.B2=0;
 for(count=3;count>0;count--){
 portc=0;
 portc|= ((count%10) <<4);
 delay_ms(1000);
 }
 porta.B0=1;
 porta.B1=0;
 }
 portc=0x00;
 delay_ms(1000);
 while(portb.b1==0);

 }
 if(portb.b0){
 intf_bit=0;
 }
 }
}


char i;
void countDown(char num){
for(i=num;i>3;i--){
 if(num==23){
 porta.B2=1;
 porta.B0=0;
 porta.B1=0;
 porte.B0=1;
 porte.B1=0;
 porte.B2=0;

 }
 if(num==15){
 porta.B0=1;
 porta.B1=0;
 porta.B2=0;
 porte.B2=1;
 porte.B0=0;
 porte.B1=0;
 }
 portc=i/10;
 portc |=((i%10)<<4);
 delay_ms(1000);
}
if(i==3){
if(num==23){
porta.b1=1;
porta.b2=0;

}
if(num==15){
porte.b1=1;
porte.b2=0;
}
for(i=3;i>0;i--){
 portc=0;
 portc|=((i%10)<<4);
 delay_ms(1000);
}
portc=0x00;
delay_ms(1000);

}
}

void main() {
ADCON1=0x07;
trisb.b0=1;
trisb.b1=1;
trisb.b2=0;
trisa=0b000;
trise=0b000;
trisc=0b00000000;
portc=0b00000000;
porta=0b00000000;
porte=0b00000000;
portb.b0=1;
portb.b1=1;
portb.b2=1;
gie_bit=1;
inte_bit=1;
intedg_bit=0;
not_rbpu_bit=0;
while(1){
 countDown(23);
 countDown(15);
}

}
