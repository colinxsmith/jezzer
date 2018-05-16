#include<stdio.h>
int main(int argc,char**argv)
{
	char* infile="/home/colin/Dropbox/stand.png";
	unsigned long i=0;
	argc--;argv++;
	while(argc)
	{
		infile=*argv;
		argc--;argv++;
	}
	FILE* fin=fopen(infile,"r");
	if(fin)
	{
		unsigned long in;
		while((in=fgetc(fin))!=EOF)
		{
			if(i%24 == 0) printf("\"");
			printf("\\x%.2lx",in);
			if(i%24 == 23) printf("\"\n");
			i++;
		}
		i--;
		if(i%24 != 23) printf("\";\n");
		fclose(fin);
		return 0;
	}
	fprintf(stderr,"Couldn't open file %s!!!!!!!\n",infile);
	return 1;
}
