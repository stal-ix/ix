{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gocryptfs
{% endblock %}

{% block version %}
2.7.0
{% endblock %}

{% block go_url %}
https://github.com/rfjakob/gocryptfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
7bcb517c543cc5ef01cbc7993328b152f86eb8934d98ef698019a15fb22e0082
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd gocryptfs-xray
{% endblock %}

{% block go_bins %}
gocryptfs-xray
{% endblock %}

{% block go_tool %}
bin/go/lang/27
{% endblock %}
