{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/19(c_compiler=bin/clang/19/full,crt_ver=19,libcplpl_ver=19,llvm_extra_targets=flang-new)
{% endblock %}
