{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://nano-editor.org/dist/v6/nano-6.0.tar.xz
5b6ff59f2490db80a3498c4cd3eda085
{% endblock %}

{% block bld_libs %}
lib/intl
lib/curses

{% if target.os == 'linux' %}
lib/linux
{% endif %}
{% endblock %}

{% block bld_tool %}
bin/gettext
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
