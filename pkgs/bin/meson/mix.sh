{% extends '//mix/std/mix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.62.1.tar.gz
sha:9fb52e66dbc613479a5f70e46cc2e8faf5aa65e09313f2c71fa63b8afd018107
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
