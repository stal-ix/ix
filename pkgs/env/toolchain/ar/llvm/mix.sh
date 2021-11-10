{% extends '//mix/template/py.py' %}

{% block env %}
setup_ar() {
    ln -s "$(command -v llvm-ar)" ar
    ln -s "$(command -v llvm-ranlib)" ranlib
    ln -s "$(command -v llvm-nm)" nm

    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export NM=llvm-nm
}
{% endblock %}
