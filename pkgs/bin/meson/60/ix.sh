{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.60.2.tar.gz
a5d6cfcf776e145f2054d5eefb4bc110
{% endblock %}

{% block unpack %}
# spaces in paths
mkdir src; cd src; extract0 ${src}/0*; cd meson*
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '0.diff' %}
EOF
{% endblock %}

{% block build %}
ln -s meson.py meson
{% endblock %}

{% block install %}
cp -R ../meson* ${out}/bin
{% endblock %}

{% block strip_pc %}
{% endblock %}

{% block purge_dynlib %}
{% endblock %}
