{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/lunasvg/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/lunasvg
{% endblock %}

{% block build %}
cc -o svg2png examples/svg2png.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp svg2png ${out}/bin/
{% endblock %}
