{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/traviscross/mtr
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
f392168771570b0fdc104c38dea6bbc2ce585710
{% endblock %}

{% block git_sha %}
f3d6caa3d9105b9f82fb8e6ed08635f07a33e042209c15c2aaa36a3637bfab1f
{% endblock %}

{% block pkg_name %}
mtr
{% endblock %}

{% block version %}
0.96
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/ncurses
{% endblock %}

{% block configure_flags %}
--without-gtk
--without-jansson
{% endblock %}
