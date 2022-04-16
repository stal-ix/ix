{% extends '//mix/fonts.sh' %}

{% block fetch %}
#https://web.archive.org/web/20171225132744/http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
#sha:249473568eba7a1e4f95498acba594e0f42e6581add4dead70c1dfb908a09423
#sha:184cfda9476c09798764f78744ace801737869dd30da8a81480b471a10f37c22
https://downloads.sourceforge.net/project/mscorefonts2/cabs/PowerPointViewer.exe
sha:c4e753548d3092ffd7dd3849105e0a26d9b5a1afe46e6e667fe7c6887893701f
#sha:05fd17e1b57b43ab668527a7d4baabaf24658291b479f09b443895466a62bdc9
{% endblock %}

{% block bld_tool %}
bin/cabextract
{% endblock %}

{% block step_unpack %}
cabextract -L ${src}/*.exe
cabextract -L ppviewer.cab
{% endblock %}
