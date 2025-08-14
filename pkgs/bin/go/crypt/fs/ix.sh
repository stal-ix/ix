{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gocryptfs
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block go_url %}
https://github.com/rfjakob/gocryptfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
9f639b8ced4285439ffb5d32925e78fdf2c2b94fa705c308861273b5f6f87924
{% endblock %}

{% block bld_libs %}
lib/openssl
{% endblock %}

{% block unpack %}
{{super()}}
cd gocryptfs-xray
{% endblock %}

{% block go_bins %}
gocryptfs-xray
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
