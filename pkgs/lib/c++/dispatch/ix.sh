{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/c++/{{libcplpl_ver or ('wasi' if wasi else '19/patched')}}
{% endblock %}
