{% extends 'sh.sh' %}

{% block sh_script %}
step_unpack() {
echo 'unpack step'

{% block preunpack %}
{% endblock %}

{% block unpack %}
{% endblock %}

{% block postunpack %}
{% endblock %}
}

step_patch() {
echo 'patch step'

{% block prepatch %}
{% endblock %}

{% block patch %}
{% endblock %}

{% block postpatch %}
{% endblock %}
}

step_configure() {
echo 'configure stage'

{% block cflags %}
{% endblock %}

{% block preconf %}
{% endblock %}

{% block configure %}
{% endblock %}

{% block postconf %}
{% endblock %}
}

step_build() {
echo 'build stage'

{% block prebuild %}
{% endblock %}

{% block build %}
{% endblock %}

{% block postbuild %}
{% endblock %}
}

step_test() {
echo 'test stage'

{% block pretest %}
{% endblock %}

{% block test %}
{% endblock %}

{% block posttest %}
{% endblock %}
}

step_install() {
echo 'install stage'

{% block preinstall %}
{% endblock %}

{% block install %}
{% endblock %}

{% block postinstall %}
{% endblock %}

{% block prepare_env %}
{% endblock %}
}

do_unpack() {
    step_unpack
}

do_patch() {
    do_unpack

    (
        set -eu
        step_patch
    )
}

do_configure() {
    do_patch
    step_configure
}

do_build() {
    do_configure

    (
        set -eu
        step_build
    )
}

do_install() {
    do_build

    (
        set -eu
        step_install
    )
}

do_test() {
    do_install

    (
        set -eu
        step_test
    )
}

do_execute() {
    echo "execute ${out}"
    do_test
    echo "done ${out}"
}

(
    set -eu

    do_execute
)
{% endblock %}
