{% extends '//die/c_std.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block build %}
cc -o fixtty -x c - << EOF
{% include 'main.c' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fixtty ${out}/bin/
{% endblock %}
