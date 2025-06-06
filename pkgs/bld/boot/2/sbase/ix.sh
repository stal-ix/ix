{% extends '//bin/sbase/t/ix.sh' %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_libs %}
bld/boot/0/ind
{% endblock %}

{% block bld_deps %}
bld/boot/2/bmake/unwrap
bld/boot/1/sh
bld/boot/1/env
{% endblock %}

{% block setup_compiler %}
{{super()}}
export PATH="${out}/bin:${PWD}:${PATH}"
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
chroot=printf
{% endif %}
{{super()}}
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_path_GREP=grep
{% endblock %}
