{% extends '//mix/template/hub.sh' %}

{% block lib_deps %}
{% if mix.platform.target.os == 'linux' %}
lib/linux/mix.sh
lib/fts/mix.sh
lib/rpmatch/mix.sh
{% endif %}
lib/c++/mix.sh
lib/xo/mix.sh
lib/edit/mix.sh
lib/openssl/mix.sh
lib/curses/mix.sh
{% endblock %}
