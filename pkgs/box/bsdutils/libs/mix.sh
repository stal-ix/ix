{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/linux
lib/fts
lib/rpmatch
{% endif %}
lib/c
lib/c++
lib/xo
lib/edit
lib/openssl
lib/curses
{% endblock %}
