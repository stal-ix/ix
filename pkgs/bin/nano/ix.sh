{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.nano-editor.org/dist/v7/nano-7.2.tar.xz
sha:86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/intl
lib/magic
lib/curses
lib/kernel
{% endblock %}

{% block bld_tool %}
bin/groff
bld/gettext
{% endblock %}

{% block configure_flags %}
--enable-utf8
{% endblock %}
