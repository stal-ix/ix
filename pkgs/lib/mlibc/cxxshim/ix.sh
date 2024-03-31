{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/managarm/cxxshim
{% endblock %}

{% block git_commit %}
82344efd46c0356272800c3b5bd3286fc681e114
{% endblock %}

{% block git_sha %}
1259e5229ceb4dd22d8d511a568b0fef75b82067fa4036a91dfe833503f150d2
{% endblock %}

{% block meson_flags %}
install_headers=true
{% endblock %}
