{% extends 'sh.sh' %}

{% block functions %}
{{super()}}

step_unpack() {
{% block step_unpack %}
{% block unpack %}
echo 'no unpack'
{% endblock %}
{% endblock %}
}

step_patch() (
{% block step_patch %}
{% block patch %}
echo 'no patch'
{% endblock %}
{% endblock %}
)

step_setup() {
{% block step_setup %}
echo 'no setup'
{% endblock %}
}

step_configure() (
{% block step_configure %}
{% block configure %}
echo 'no configure'
{% endblock %}
{% endblock %}
)

step_build() (
{% block step_build %}
{% block build %}
echo 'no build'
{% endblock %}
{% endblock %}
)

step_test() (
{% block step_test %}
{% block test %}
echo 'no tests'
{% endblock %}
{% endblock %}
)

step_install() (
{% block step_install %}
echo 'no install'
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
{% endblock %}

{% block sh_script %}
do_{{stage or 'execute'}}
{% endblock %}
