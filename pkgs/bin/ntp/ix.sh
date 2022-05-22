{% extends '//die/autohell.sh' %}

{% block fetch %}
https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz
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
