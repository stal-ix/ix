{% extends '//mix/template/py.py' %}

{% block env %}
setup_ar_env() {
    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export NM=llvm-nm
}

setup_ar() {
    setup_ar_env

    ln -s "$(which llvm-ar)" ar
    ln -s "$(which llvm-ranlib)" ranlib
    ln -s "$(which llvm-nm)" nm
}
{% endblock %}
