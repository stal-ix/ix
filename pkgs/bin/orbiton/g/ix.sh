{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
sha:55cd181f2092e1f50779e61650e7b04c0c22bc2d500ae7d9e750b31151bc5643
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
