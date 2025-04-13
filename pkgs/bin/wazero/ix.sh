{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wazero
{% endblock %}

{% block version %}
1.9.0
{% endblock %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
36237923ef1010af6b8b0f87025dfe798ad9182a1b2515dd59db949cc3d4e2f0
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
