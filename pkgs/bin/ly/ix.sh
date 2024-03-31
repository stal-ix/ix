{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/fairyglade/ly
{% endblock %}

{% block git_branch %}
v0.6.0
{% endblock %}

{% block git_sha %}
5d324e9f946d9c817467ae9d1d4a51611a08103b68707ef304068269a537320c
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
