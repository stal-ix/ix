{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wazero
{% endblock %}

{% block version %}
1.10.1
{% endblock %}

{% block go_url %}
https://github.com/tetratelabs/wazero/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
3cf766aa4ede658cd3db01b11be22bcad6782b7193210bc88f86715ecdf25466
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/wazero
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp wazero ${out}/bin/
{% endblock %}
