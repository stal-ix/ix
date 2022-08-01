{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/westes/flex/archive/refs/tags/flex-2-5-10.tar.gz
sha:20ccf2a29fb0aef14784e24ae595900acb0bab398cd0e48840d77017580b7bd9
{% block flex_extra_fetch %}
https://gitlab.com/giomasce/flex/-/raw/506e9605baf4638ba47d37133c348df1385ef06c/scan.lex.l
sha:3b18eb2dffe85c695c3000f8255f0849bb7bb996311c66c949b60efeb2a0a5eb
{% endblock %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/9/lex
bld/boot/4/byacc
bld/boot/8/env/std
{% endblock %}

{% block unpack %}
extract1 ${src}/flex*
{% endblock %}

{% block c_rename_symbol %}
warn
{% endblock %}

{% block build %}
cat << EOF > config.h
#define HAVE_DCGETTEXT 1
#define HAVE_GETTEXT 1
#define HAVE_INTTYPES_H 1
#define HAVE_MEMORY_H 1
#define HAVE_STDBOOL_H 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define PACKAGE "flex"
#define PACKAGE_BUGREPORT "help-flex@gnu.org"
#define PACKAGE_NAME "flex"
#define PACKAGE_STRING "flex 2.5.10"
#define PACKAGE_TARNAME "flex"
#define PACKAGE_URL ""
#define PACKAGE_VERSION "2.5.10"
#define STDC_HEADERS 1
#define VERSION "2.5.11"
#define YYTEXT_POINTER 1
EOF

byacc -d parse.y

mv y.tab.h parse.h
mv y.tab.c parse.c

{% block invoke_lex %}
lex ${src}/scan.lex.l
sed -e 's|yylex|flexscan|g' < lex.yy.c > scan.c
{% endblock %}

sh mkskel.sh ./flex.skl > skel.c

for x in ccl dfa ecs gen main misc nfa parse scan skel sym tblcmp yylex options scanopt buf; do
    ${CC} -c -o ${x}.o ${x}.c
done

${CC} -o flex *.o
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp flex ${out}/bin/
{% endblock %}
