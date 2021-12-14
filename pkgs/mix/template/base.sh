{% extends 'sh.sh' %}

{% block sh_script %}
{% block functions %}
{% endblock %}

step_unpack() {
echo 'unpack step'

{% block step_unpack %}
{% block unpack %}
{% endblock %}
{% endblock %}
}

step_patch() (
set -eu

echo 'patch step'

{% block step_patch %}
{% block patch %}
{% endblock %}
{% endblock %}
)

step_setup() {
echo 'setup stage'

{% block step_setup %}
{% block setup %}
{% endblock %}
{% endblock %}
}

step_configure() (
set -eu

echo 'configure stage'

{% block step_configure %}
{% block configure %}
{% endblock %}
{% endblock %}
)

step_build() (
set -eu

echo 'build stage'

{% block step_build %}
{% block build %}
{% endblock %}
{% endblock %}
)

step_test() (
set -eu

echo 'test stage'

{% block step_test %}
{% block test %}
{% if kind == 'bin' %}
{% block test_bin %}
{% endblock %}
{% endif %}

{% if kind == 'lib' %}
{% block test_lib %}
{% endblock %}
{% endif %}
{% endblock %}
{% endblock %}
)

step_install() (
set -eu

echo 'install stage'

{% block step_install %}
{% block install %}
{% endblock %}
{% endblock %}
)

do_unpack() {
    step_unpack
}

do_setup() {
    do_unpack
    step_setup
}

do_patch() {
    do_setup
    step_patch
}

do_configure() {
    do_patch
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
