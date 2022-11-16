{% extends '//bld/elfutils/ix.sh' %}

{% block bld_libs %}
lib/intl
lib/curl
lib/kernel
lib/archive
lib/sqlite/3
lib/micro/httpd
{{super()}}
{% endblock %}
