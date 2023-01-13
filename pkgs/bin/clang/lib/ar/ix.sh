{% extends '//die/env.sh' %}

{% block env %}
setup_ar() {
    export AR=llvm-ar
    export RANLIB=llvm-ranlib
    export NM=llvm-nm

    ln -s "$(which llvm-ar)" ar
    ln -s "$(which llvm-ranlib)" ranlib
    ln -s "$(which llvm-nm)" nm
}
{% endblock %}
