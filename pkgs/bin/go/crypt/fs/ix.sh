{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gocryptfs
{% endblock %}

{% block version %}
2.5.4
{% endblock %}

{% block go_url %}
https://github.com/rfjakob/gocryptfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
cfbc2b4c664e4ea6fefb35c58b26bba227c593475c6e8d0de2dcc4be91d74b43
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
