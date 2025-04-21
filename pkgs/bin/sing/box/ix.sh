{% extends '//die/go/build.sh' %}

{% block pkg_name %}
sing-box
{% endblock %}

{% block version %}
1.11.8
{% endblock %}

{% block go_url %}
https://github.com/SagerNet/sing-box/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
78e19c20c85ffb1ae60489f5af9ad0f2bfa0727336f14f3c9de750ee28ce705c
{% endblock %}

{% block step_unpack %}
{{super()}}
cd cmd/sing-box
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp sing-box ${out}/bin/
{% endblock %}


{% block go_tool %}
bin/go/lang/24
{% endblock %}
