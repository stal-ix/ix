{% extends '//die/c_std.sh' %}

{% block unpack %}
: nothing to unpack
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build %}
cat << EOF > ix.h
{% include 'ix.h' %}
EOF

cc -c -o ix.o -x c++ - << EOF
{% include 'ix.cpp' %}
EOF

ar cq libixshim.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp *.a ${out}/lib/
cp *.h ${out}/include/
{% endblock %}
