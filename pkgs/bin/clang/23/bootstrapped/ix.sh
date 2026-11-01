{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/23(c_compiler=bin/clang/23/full,crt_ver=23,libcplpl_ver=23,llvm_extra_targets=flang)
{% endblock %}
