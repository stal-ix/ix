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

step_patch() (
set -eu

echo 'patch step'

{% block prepatch %}
{% endblock %}

{% block patch %}
{% endblock %}

{% block postpatch %}
{% endblock %}
)

step_setup() {
echo 'setup stage'

{% block setup %}
{% endblock %}
}

step_configure() {
echo 'configure stage'

{% block preconf %}
{% endblock %}

{% block configure %}
{% endblock %}

{% block postconf %}
{% endblock %}
}

step_build() (
set -eu

echo 'build stage'

{% block prebuild %}
{% endblock %}

{% block build %}
{% endblock %}

{% block postbuild %}
{% endblock %}
)

step_test() (
set -eu

echo 'test stage'

{% block pretest %}
{% endblock %}

{% block test %}
{% endblock %}

{% block posttest %}
{% endblock %}
)

step_install() (
set -eu

echo 'install stage'

{% block preinstall %}
{% endblock %}

{% block install %}
{% endblock %}

{% block postinstall %}
{% endblock %}

{% block prepare_env %}
{% endblock %}
)

do_unpack() {
    step_unpack
}

do_patch() {
    do_unpack
    step_patch
}

do_setup() {
    do_patch
    step_setup
}

do_configure() {
    do_setup
    step_configure
}

do_build() {
    do_configure
    step_build
}

do_install() {
    do_build
    step_install
}

do_test() {
    do_install
    step_test
}

do_execute() {
    echo "execute ${out}"
    do_test
    echo "done ${out}"
}

do_execute
{% endblock %}
