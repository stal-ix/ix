{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
bubblewrap
{% endblock %}

{% block version %}
0.9.0
{% endblock %}

{% block fetch %}
https://github.com/containers/bubblewrap/releases/download/v{{self.version().strip()}}/bubblewrap-{{self.version().strip()}}.tar.xz
c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43bab9f2d05dd094e1
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
