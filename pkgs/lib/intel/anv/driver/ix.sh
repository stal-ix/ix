{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/llvm
lib/mesa/deps
lib/intel/anv/driver/dl
lib/intel/anv/driver/lib
lib/intel/anv/driver/allsym
{% endblock %}
