{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/protocolbuffers/protobuf/archive/refs/tags/v21.12.tar.gz
sha:22fdaf641b31655d4b2297f9981fa5203b2866f8332d3c6333f6b0107bb320de
{% endblock %}

{% block lib_deps %}
lib/z
lib/c
lib/c++
{% endblock %}
