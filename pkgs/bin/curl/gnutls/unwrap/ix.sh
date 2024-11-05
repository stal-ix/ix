{% extends '//lib/curl/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/bsd/overlay
lib/ng/tcp2/gnutls
{% endblock %}
