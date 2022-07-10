{% extends '//lib/clipboard/darwin/ix.sh' %}

{% block configure %}
:
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sdl/2
{% endblock %}

{% block patch %}
sed -e 's|.*libclipboard-config.h.*||' -i include/libclipboard.h
{% endblock %}

{% block build %}
c++ -c -Iinclude -o clip.o -std=c++20 -x c++ - << EOF
{% include 'clip.cpp' %}
EOF
ar q libclipboard.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp include/*.h ${out}/include/
{% endblock %}
