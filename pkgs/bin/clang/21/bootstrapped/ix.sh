{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/clang/21(c_compiler=bin/clang/21/full,crt_ver=21,libcplpl_ver=21,llvm_extra_targets=flang)
{% endblock %}
