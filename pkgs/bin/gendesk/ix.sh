{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/xyproto/gendesk/archive/refs/tags/1.0.9.tar.gz
{% endblock %}

{% block go_sha %}
81cf78b86132c609d1926bff1e0f7f0fceb4f4d2070e6f486e79935ae27b42be
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gendesk ${out}/bin/
{% endblock %}
