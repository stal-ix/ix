{% extends '//mix/template/py.py' %}

{% block run_deps %}
tool/pv/mix.sh
tool/compress/unzip/mix.sh
lib/archive/mix.sh
{% endblock %}

{% block env %}
do_untar() {
    case $1 in
        *.zip)
            unzip $1
        ;;
        *)
            pv $1 | bsdcat | bsdtar xf -
        ;;
    esac
}

export untar="do_untar"
export unzip="do_untar"
{% endblock %}
