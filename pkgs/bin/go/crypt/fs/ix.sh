{% extends '//die/go/build.sh' %}

{% block version %}
2.5.2
{% endblock %}

{% block go_url %}
https://github.com/rfjakob/gocryptfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
31e09587b287943de0e3ceb3c5cbb75413789bcc9438f9dd833a17e62af60b4e
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block unpack %}
{{super()}}
cd gocryptfs-xray
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gocryptfs-xray ${out}/bin/
{% endblock %}
