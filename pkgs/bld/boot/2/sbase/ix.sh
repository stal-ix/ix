{% extends '//bin/sbase/t/ix.sh' %}

{% block make_bin %}
bmake
{% endblock %}

{% block make_no_thrs %}
{% endblock %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
bld/boot/2/shutil
bld/boot/2/bmake
bld/boot/1/env
{% endblock %}

{% block unpack %}
mkdir src; cd src; extract0 ${src}/*.gz; cd *
{% endblock %}

{% block setup_compiler %}
export PATH="${out}/bin:${PWD}:${PATH}"
{% for x in ix.parse_list(self.cpp_defines()) %}
export CPPFLAGS="-D{{x}} ${CPPFLAGS}"
{% endfor %}
{{super()}}
{% endblock %}

{% block cpp_defines %}
{% if darwin %}
chroot=printf
{% endif %}
{{super()}}
{% endblock %}

{% block make_flags %}
CC=${CC}
AR=${AR}
RANLIB=${RANLIB}
CFLAGS="${CFLAGS} ${CPPFLAGS}"
LDFLAGS="${LDFLAGS}"
{% endblock %}

{% block patch %}
>getconf.h

cat << EOF > getconf.c
int main() {
    return 0;
}
EOF
{% endblock %}

{% block env %}
{{super()}}
export ac_cv_path_GREP=grep
{% endblock %}
