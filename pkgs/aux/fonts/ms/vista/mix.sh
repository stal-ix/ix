{% extends '//mix/template/fonts.sh' %}

{% block fetch %}
https://web.archive.org/web/20171225132744/http://download.microsoft.com/download/E/6/7/E675FFFC-2A6D-4AB0-B3EB-27C9F8C8F696/PowerPointViewer.exe
sha:249473568eba7a1e4f95498acba594e0f42e6581add4dead70c1dfb908a09423
{% endblock %}

{% block bld_tool %}
bin/cabextract
{% endblock %}

{% block build %}
cabextract -L ${src}/*.exe
cabextract -L ppviewer.cab
{% endblock %}
