{% extends '//bin/meson/60/ix.sh' %}

{% block fetch %}
https://github.com/mesonbuild/meson/archive/refs/tags/0.63.2.tar.gz
sha:023a3f7c74e68991154c3205a6975705861eedbf8130e013d15faa1df1af216e
{% endblock %}

{% block patch %}
patch -p2 << EOF
{% include '0.diff' %}
EOF
{% endblock %}
