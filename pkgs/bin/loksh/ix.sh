{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/dimkr/loksh/releases/download/7.0/loksh-7.0.tar.xz
sha:413275c9a259629bbdb4ce97c610c45bc14a589f73cd51571ed82eec58e45840
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block c_rename_symbol %}
reallocarray
{% endblock %}
