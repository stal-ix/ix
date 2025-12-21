{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/shim/fake(lib_name=cups)
lib/shim/fake/header(header=cups/cups.h)
lib/shim/fake/header(header=cups/ppd.h)
lib/shim/fake/symbol(symbol_name=cupsServer)
{% endblock %}
