{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cc -o subreaper -x c - << EOF
{% include 'main.c' %}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp subreaper ${out}/bin/
{% endblock %}
