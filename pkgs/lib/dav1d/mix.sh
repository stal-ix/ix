{% extends '//mix/meson.sh' %}

{% block fetch %}
https://github.com/videolan/dav1d/archive/refs/tags/1.0.0.zip
sha:c75cfb130b31a26072329677f29af397f7a8994c857c335e06df31c0be88e845
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
