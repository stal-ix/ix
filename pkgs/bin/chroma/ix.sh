{% extends '//die/go/build.sh' %}

{% block pkg_name %}
chroma
{% endblock %}

{% block version %}
2.17.2
{% endblock %}

{% block go_url %}
https://github.com/alecthomas/chroma/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0a9050f0c08f7f919a73acd9c47d1e087a10fa23e942dae47db255746133da07
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/chroma
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp chroma ${out}/bin/
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
