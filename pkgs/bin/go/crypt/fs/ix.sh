{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gocryptfs
{% endblock %}

{% block version %}
2.6.0
{% endblock %}

{% block go_url %}
https://github.com/rfjakob/gocryptfs/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
dfb8bc3f052cf7aa944c60138890fefdbe5f0ef5640847beebbe308d5dfb96fa
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
