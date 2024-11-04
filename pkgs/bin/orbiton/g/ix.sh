{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:3facf3b4f066d9a6ba33a969fd0b540c224bdfdfde1d4abe3fcc70e072dbee1b
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/gtk/3
lib/vte/3
{% endblock %}

{% block build %}
cc -o og gtk3/main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp og ${out}/bin/
{% endblock %}
