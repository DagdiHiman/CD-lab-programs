# CD-lab-programs
2020 Compiler Design Lab Programs

Ubuntu does not come installed with a lex and yacc compiler to do so install it first by
1. Open the terminal
2. type  ```sudo apt-get install flex```
3. enter your password

after installation of flex finishes

4. type ```sudo apt-get install bison```
5. enter your pasword.

Successfully  Lex and Yacc have been installed on your system.

Running a Lex and Yacc program                
1. write the lex program in a file and save it as  ```file.l```
2. open the terminal and navigate to the directory where you have saved the file.l  (e.x ```cd Desktop```)
3. type  ```lex filename.l```
4. then type  ```cc lex.yy.c -lfl```
5. then type  ```./a.out```

Your lex progam will be running now (comment should be correct).
or compiling lex and yacc together

1. write lex program in a file ```file.l``` and yacc in a file ```file.y```
2. open the terminal and navigate to the directory where you have saved the files.
3. type ```lex filename.l```
4. type ```yacc filename.y```
5. type ```cc lex.yy.c y.tab.h -lfl```
6. type ```./a.out```


The lex and yacc will run succesfully now 
