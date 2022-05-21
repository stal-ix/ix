{% extends '//die/fonts.sh' %}

{% block fetch %}
http://download.windowsupdate.com/msdownload/update/software/svpk/2011/02/windows6.1-kb976932-x86_c3516bc5c9e69fee6d9ac4f981f5b95977a8a2fa.exe
sha:e5449839955a22fc4dd596291aff1433b998f9797e1c784232226aba1f8abd97
{% endblock %}

{% block unpack %}
mkdir src; cd src; cabextract -L ${src}/*.exe
{% endblock %}

{% block bld_tool %}
bin/cabextract
{% endblock %}
