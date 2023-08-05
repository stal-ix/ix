{% extends '//bin/clang/14/gcc/ix.sh' %}

{% block c_compiler %}
bin/gcc(gcc_ver=7,for_target={{host.gnu.three}})
bin/gcc(gcc_ver=7,for_target={{target.gnu.three}})
{% endblock %}
