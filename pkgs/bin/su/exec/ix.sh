{% extends '//die/c/make.sh' %}

{% block pkg_name %}
su-exec
{% endblock %}

{% block version %}
0.3
{% endblock %}

{% block fetch %}
https://github.com/ncopa/su-exec/archive/refs/tags/v{{self.version().strip()}}.tar.gz
1de7479857879b6d14772792375290a87eac9a37b0524d39739a4a0739039620
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp su-exec ${out}/bin/
{% endblock %}
