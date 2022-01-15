#include <stdio.h>

unsigned char nand(unsigned char a, unsigned char b){
    return ~(a&b);
}

int main()
{
	unsigned char x=0x01,y=0x01,z=0x00,w=0x01;
	unsigned char one=0x01;
	unsigned char ix,iy,iz,iw,im1,im2,im3,o;
	ix = nand(x,x);
	iy = nand(y,y);
	iz = nand(z,z);
	iw = nand(w,w);
	im1 = nand(ix,iz);
	im2 = nand(nand(iy,z),nand(nand(nand(x,z), nand(x,z)),iw));
	im3 = nand(im2,im2);
	o = nand(im1, im3);
	printf("Output=%x\n",one&o);
	return 0;
}
