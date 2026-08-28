{% extends '//die/c/make.sh' %}

{% block pkg_name %}
ly
{% endblock %}

{% block version %}
1.4.1
{% endblock %}

{% block git_repo %}
https://github.com/fairyglade/ly
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
ea1cfe217e8f650fd0528d709037e7698bb5d7d3043bfe19af11bd4cbe76a28f
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
