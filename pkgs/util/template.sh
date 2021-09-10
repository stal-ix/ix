{% block deps %}
{% endblock %}

{% block fetch %}
{% endblock %}

do_unpack() {
{% block unpack %}
    mkdir bld && cd bld

    for s in $src/*; do
        case $s in
            *touch)
            ;;
            *)
                $untar $s
            ;;
        esac
    done

    cd *
{% endblock %}
}

do_configure() {
    echo 'configure stage'

{% block preconf %}
    setup_compiler
{% endblock %}

{% block configure %}
{% endblock %}

{% block postconf %}
{% endblock %}
}

do_build() {
    echo 'build stage'
{% block build %}
{% endblock %}
}

do_test() {
    echo 'test stage'
{% block test %}
{% endblock %}
}

do_install() {
    echo 'install stage'

{% block install %}
{% endblock %}

    cat << EOF > $out/env
{% block env %}
{% endblock %}
EOF
}

build() {
    do_unpack
    do_configure
    do_build
    do_test
    do_install
}
