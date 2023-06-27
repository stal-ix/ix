{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/fairyglade/ly
{% endblock %}

{% block git_branch %}
v0.6.0
{% endblock %}

{% block git_sha %}
10c7f9ae2b4ecf98aeb9ccf7789d76f7b628faf93ad6bbd8685101e77b7cbeb3
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
