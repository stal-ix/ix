{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/OpenVisualCloud/SVT-HEVC/archive/refs/tags/v1.5.1.tar.gz
sha:fcadf3a326e012bdc7d7357b55573b45dfd37bf4a4186c93ed1c4b98fe3f1f6d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}
