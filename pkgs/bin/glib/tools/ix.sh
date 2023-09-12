{% extends '//lib/glib/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/attr
lib/kernel
lib/elfutils
lib/linux/util
{% endblock %}
