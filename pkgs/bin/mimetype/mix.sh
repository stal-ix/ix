{% extends '//die/c_std.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/glib
lib/mimetype
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cc -o mimetype -x c++ - << EOF
{% include 'mt.cpp' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mimetype ${out}/bin/
{% endblock %}
