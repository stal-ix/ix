{% extends '//die/c/make.sh' %}

{% block fetch %}
{% include '//bin/mrustc/t/ver.sh' %}
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
{% endblock %}

{% block build %}
make -j ${make_thrs} -C tools/minicargo
{% endblock %}

{% block bld_tool %}
bld/bash
bld/fake(tool_name=strip)
bld/fake(tool_name=objcopy)
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp bin/minicargo ${out}/bin/
{% endblock %}
