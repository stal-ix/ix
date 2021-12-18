{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://nano-editor.org/dist/v6/nano-6.0.tar.xz
5b6ff59f2490db80a3498c4cd3eda085
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/curses/mix.sh

{% if target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
