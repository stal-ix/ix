{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/openal
{% endblock %}

{% block export_symbols_sh %}
llvm-nm --defined-only --extern-only --no-weak ${lib_openal}/lib/libopenal.a
{% endblock %}

{% block export_lib %}
openal
{% endblock %}
