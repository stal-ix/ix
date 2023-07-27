{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/fairyglade/ly
{% endblock %}

{% block git_branch %}
v0.6.0
{% endblock %}

{% block git_sha %}
5af48d3cf47c8edd9edc61ceb450d7ec97494df8962acdfc84a681e58aa11193
{% endblock %}

{% block bld_libs %}
lib/c
lib/pam
lib/kernel
lib/shim/x11
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}

{% block make_flags %}
DESTDIR=${out}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv usr/* ./
rm -r usr
{% endblock %}
