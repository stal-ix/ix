{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/22(c_compiler=bin/clang/22/full,crt_ver=22,libcplpl_ver=22,llvm_extra_targets=flang)
{% endblock %}
