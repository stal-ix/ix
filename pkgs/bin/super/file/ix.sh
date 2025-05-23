{% extends '//die/go/build.sh' %}

{% block pkg_name %}
superfile
{% endblock %}

{% block version %}
1.3.0
{% endblock %}

{% block go_url %}
https://github.com/yorukot/superfile/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
294ed09bd1c2a788c7bb45dffa048bb1595266846bbbbe8f2a6c58a9851695bd
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp superfile ${out}/bin/spf
{% endblock %}
