{% extends '//die/go/c.sh' %}

{% block fetch %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
sha:dd0008512eebc893e4b630d07d9bf5e3a4f121b87fe725c32773caa6e391db58
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}

{% block go_build_flags %}
-mod=vendor
{% endblock %}
