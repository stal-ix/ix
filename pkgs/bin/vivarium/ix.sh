{% extends '//die/c/meson.sh' %}

{% block git_repo %}
https://github.com/inclement/vivarium
{% endblock %}

{% block git_commit %}
1ffa4368cc87f96955f5358b5896156753b59a4f
{% endblock %}

{% block git_sha %}
b1ebead005da9a4e5fa1a90368e42f38029690ecba883abf575862226e4bd01c
{% endblock %}

{% block bld_libs %}
lib/c
lib/toml/c99
lib/wlroots/15
{% endblock %}

