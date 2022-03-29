{% extends '//mix/dlstubs.sh' %}

{% block lib_deps %}
lib/curl
{% endblock %}

{% block export_symbols_sh %}
llvm-nm --defined-only --extern-only --no-weak ${lib_curl}/lib/libcurl.a
{% endblock %}

{% block export_lib %}
curl
{% endblock %}
