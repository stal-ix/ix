{% extends '//die/c/autorehell.sh' %}

{% block git_repo %}
https://github.com/universal-ctags/ctags
{% endblock %}

{% block git_branch %}
v{{self.version().strip()}}
{% endblock %}

{% block git_commit %}
b8eb0da4121372b5d74a90fc36cba6a31f147f3c
{% endblock %}

{% block git_sha %}
764850d849e043a7978c82afd2a5ac37ece6e393f2ccbb7f20ea9c98529bbbbb
{% endblock %}

{% block pkg_name %}
universal-ctags
{% endblock %}

{% block version %}
6.2.1
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}
