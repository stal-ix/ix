{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/jarun/nnn/archive/refs/tags/v4.3.tar.gz
8263efb03dc28e02f32ddaa0e07ddaf1
{% endblock %}

{% block bld_deps %}
lib/readline/mix.sh
lib/curses/mix.sh
dev/build/pkg-config/mix.sh
{{super()}}
{% endblock %}
