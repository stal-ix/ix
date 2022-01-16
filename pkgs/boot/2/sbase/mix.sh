{% extends '//box/sbase/t/mix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/2/shutil
boot/2/bmake
boot/1/env
{% endblock %}

{% block unpack %}
extract0 ${src}/*.zip; cd *
{% endblock %}

{% block step_setup %}
{{self.setup_compiler()}}
export PATH="${out}/bin:${PWD}:${PATH}"
export SHELL="$0"
{% endblock %}

{% block make_flags %}
CC=${CC}
{% endblock %}

{% block patch %}
>getconf.h

cat << EOF > getconf.c
int main() {
    return 0;
}
EOF
{% endblock %}
