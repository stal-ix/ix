{% include 'util.sh' %}

postinstall_f() (
{% if boot %}
{% if bin %}
rm -rf ${out}/lib ${out}/include
{% else %}
: skip
{% endif %}
{% else %}
{% include 'postinstall.sh' %}
{% endif %}
)

env_f() (
{% include 'env.sh' %}
)

unpack_f() {
{% include 'unpack.sh' %}
}

step_setup_f() {
export bld=${PWD}
{% include 'setup.sh' %}
}

step_install_install_f() (
{% block install %}
    echo 'do install'
{% endblock %}
)

step_install_postinstall_f() (
{% block postinstall %}
    postinstall_f
{% endblock %}
)

step_install_prepare_env_f() (
{% block prepare_env %}
    env_f
{% endblock %}
)

step_install_f() (
    step_install_install_f
    step_install_postinstall_f
    step_install_prepare_env_f
)

setup_bt_f() (
{% include 'bt.sh' %}
)

setup_compiler_f() {
{% block setup_compiler %}
    : skip compiler setup
{% endblock %}
}

setup_tools_f() (
{% block setup_tools %}
    : skip user tools
{% endblock %}
)
