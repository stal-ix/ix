{% extends '//lib/fluid/synth/t/ix.sh' %}

{% block bld_libs %}
lib/omp
lib/sdl/2
lib/sndfile
lib/readline
{{super()}}
{% endblock %}
