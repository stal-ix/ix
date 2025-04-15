{% extends '//die/c/autohell.sh' %}

{% block version %}
4.2.8p15
{% endblock %}

{% block pkg_name %}
ntp
{% endblock %}

{% block fetch %}
https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-{{self.version().strip()[:3]}}/ntp-{{self.version().strip()}}.tar.gz
sha:f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19
{% endblock %}

{% block bld_libs %}
lib/c
lib/cap
lib/event
lib/readline
{% endblock %}

{% block configure_flags %}
--with-lineeditlibs=readline
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
