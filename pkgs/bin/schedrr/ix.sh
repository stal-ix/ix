{% extends '//die/c_std.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/shim/gnu
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cc -o schedrr -x c++ - << EOF
{% include 'rr.cpp' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp schedrr ${out}/bin/
{% endblock %}
