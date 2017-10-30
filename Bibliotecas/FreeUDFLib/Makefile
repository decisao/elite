FLAGS=-$$$$O+ -$$$$D+
INSTALL_DIR="/Program Files/InterBase Corp/InterBase/Bin"

.SUFFIXES:	# Delete all suffixes.
# Auto-make all lex, yacc, pascal, dpr and dpk files
%.dpl: %.dpk
	${DCC3} ${FLAGS} $<

%.dll: %.dpr
	${DCC3} ${FLAGS} $<

%.exe: %.dpr

%.dcu: %.pas
	${DCC3} ${FLAGS} $<

%.dcu:
	${DCC3} ${FLAGS} $*.pas

%.pas: %.l
	lex -LP -o $@ $<

%.pas: %.y
	yacc -LP -D $*.hp -o $@ $<

default: all

all: FreeUDFLib.dll

clean:
	rm -f ExprLexer.pas ExprParser.pas ExprParser.hp Symbols.pas *.dcu *~* *.dof *.dsk *.exe *.dll

install: FreeUDFLib.dll
	cp FreeUDFLib.dll ${INSTALL_DIR}

FreeUDFLib.dll: ExprLexer.pas ExprParser.pas Symbols.pas TimeFncs.pas MathFncs.pas StrFncs.pas User.pas Encrypt.pas Misc.pas udf_glob.pas BlobFncs.pas /develop/Lib/VariantSymbolTable.pas

Symbols.dcu: Symbols.pas

Symbols.pas: Symbols.l /etc/yylex.pas

ExprLexer.dcu: ExprLexer.pas

ExprLexer.pas: ExprLexer.l ExprParser.y /etc/yylex.pas

ExprParser.dcu: ExprParser.pas

ExprParser.pas: ExprParser.y /etc/yyparse.pas
