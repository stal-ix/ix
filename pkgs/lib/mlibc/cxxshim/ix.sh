{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/managarm/cxxshim
{% endblock %}

{% block git_commit %}
82344efd46c0356272800c3b5bd3286fc681e114
{% endblock %}

{% block git_sha %}
04a88d31b120e57ffb60cc984eb7dd15479e5aee0cf948526f6580738ac7763e
{% endblock %}

{% block meson_flags %}
install_headers=true
{% endblock %}
