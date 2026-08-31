{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wazero
{% endblock %}

{% block version %}
1.12.0
{% endblock %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
70936fc4d73972492c825361f4a8f95a2cb8ae9b341d7bdd8063057d40d41215
{% endblock %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
