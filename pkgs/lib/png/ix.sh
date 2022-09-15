{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v1.6.38.tar.gz
sha:d4160037fa5d09fa7cff555037f2a7f2fefc99ca01e21723b19bfcda33015234
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
