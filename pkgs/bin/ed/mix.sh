{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.17.tar.lz
sha:71de39883c25b6fab44add80635382a10c9bf154515b94729f4a6529ddcc5e54
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}

{% block bld_tool %}
bin/lzip
bld/flex
bin/bison/3/6
{% endblock %}

{% block unpack %}
cp ${src}/*.lz ./
lzip -d *.lz
bsdtar xf ed*
cd ed-1.17
{% endblock %}
