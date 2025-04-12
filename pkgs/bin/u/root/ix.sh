{% extends '//die/go/build.sh' %}

{% block version %}
0.13.0
{% endblock %}

{% block go_url %}
https://github.com/u-root/u-root/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
ff50657702615e8b59b9dc3f9089fe90c9b96f46b7c0e5e51ba9db4c659c76ab
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp u-root ${out}/bin/
{% endblock %}
