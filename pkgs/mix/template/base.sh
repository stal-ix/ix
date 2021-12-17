{% extends 'sh.sh' %}

{% block sh_script %}
{% block functions %}
{% endblock %}

step_unpack() {
{% block step_unpack %}
{% block unpack %}
echo 'unpack step'
{% endblock %}
{% endblock %}
}

step_patch() (
{% block step_patch %}
{% block patch %}
echo 'patch step'
{% endblock %}
{% endblock %}
)

step_setup() {
{% block step_setup %}
echo 'setup stage'
{% endblock %}
}

step_configure() (
{% block step_configure %}
{% block configure %}
echo 'configure stage'
{% endblock %}
{% endblock %}
)

step_build() (
{% block step_build %}
{% block build %}
echo 'build stage'
{% endblock %}
{% endblock %}
)

step_test() (
{% block step_test %}
echo 'test stage'
{% endblock %}
)

step_install() (
{% block step_install %}
echo 'install stage'
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
    do_test
}

do_{{stage or 'execute'}}
{% endblock %}
