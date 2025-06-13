{% extends '//die/fonts.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mscorefonts2/cabs/PowerPointViewer.exe
c4e753548d3092ffd7dd3849105e0a26d9b5a1afe46e6e667fe7c6887893701f
{% endblock %}

{% block bld_tool %}
bin/cabextract
{% endblock %}

{% block step_unpack %}
cabextract -L ${src}/*.exe
cabextract -L ppviewer.cab
{% endblock %}
