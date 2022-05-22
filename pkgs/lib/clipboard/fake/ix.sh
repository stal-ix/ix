{% extends '//lib/clipboard/real/ix.sh' %}

{% block configure %}
:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block patch %}
sed -e 's|.*libclipboard-config.h.*||' -i include/libclipboard.h
{% endblock %}

{% block build %}
cc -c -Iinclude -o clip.o -x c++ - << EOF
{% include 'clip.cpp' %}
EOF
ar q libclipboard.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp include/*.h ${out}/include/
{% endblock %}
