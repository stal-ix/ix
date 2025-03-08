{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/20(c_compiler=bin/clang/20/full,crt_ver=20,libcplpl_ver=20,llvm_extra_targets=flang-new)
{% endblock %}
