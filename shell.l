
/*
 *
 * CS-252 
 * shell.l: lexical analyzer for shell
 * You have to extend it.
 *
 */

%{

#include "y.tab.h"

static  void yyunput (int c,char *buf_ptr  );

void myunputc(int c) {
  unput(c);
}

%}

%option noyywrap

%%

\n {
  return NEWLINE;
}

[ \t] {
  /* Discard spaces and tabs */
}

">" {
  printf("out\n");
  return STDOUT;
}

"<" {
  printf("in\n");
  return STDIN;
}

"2>" {
  printf("err\n");
  return STDERR;
}

">&" {
  printf("out error\n");
  return OUT_ERR;
}

">>" {
  printf("append out\n");
  return APPEND_OUT;
}

">>&" {
  printf("append out err\n");
  return APPEND_OUT_ERR;
}

\| {
  printf("pipe\n");
  return PIPE;
}

"&" {
  printf("ampersand\n");
  return AMPERSAND;
}

[^ \t\n]+ {
  /* Assume that file names have only alpha chars */
  yylval.string = strdup(yytext);
  printf("%s\n", yytext);
  return WORD;
}


