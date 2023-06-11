{% extends '//die/c/make.sh' %}

{% block git_repo %}
https://github.com/fairyglade/ly
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_commit %}
c64f806a68af225cc95623971b5e464abb55b879
{% endblock %}

{% block git_sha %}
a2a0d652f381bf7be556dca117b8fc2a59a938c809e6e4b1d82520478c23d118
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
