{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.19.tar.lz
sha:ce2f2e5c424790aa96d09dacb93d9bbfdc0b7eb6249c9cb7538452e8ec77cd48
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
cd ed-1.*
{% endblock %}
