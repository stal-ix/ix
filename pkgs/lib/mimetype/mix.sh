{% extends '//mix/c_std.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/magic
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
c++ -c -o iface.o -x c++ - << EOF
{% include 'mt.cpp' %}
EOF

ar q libmimetype.a *.o
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp *.a ${out}/lib/
{% endblock %}
