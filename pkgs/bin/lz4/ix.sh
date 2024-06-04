{% extends '//lib/lz4/t/ix.sh' %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block build %}
{{super()}}
>lib/liblz4.1.9.4.dylib
{% endblock %}
