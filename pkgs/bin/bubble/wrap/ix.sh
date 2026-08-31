{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bubblewrap
{% endblock %}

{% block version %}
0.12.0
{% endblock %}

{% block fetch %}
https://github.com/containers/bubblewrap/releases/download/v{{self.version().strip()}}/bubblewrap-{{self.version().strip()}}.tar.xz
9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
{% endblock %}

{% block configure_flags %}
--disable-selinux
--disable-man
--with-priv-mode=none
--with-bash-completion-dir=no
--with-zsh-completion-dir=no
{% endblock %}
