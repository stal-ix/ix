{% extends '//util/base.sh' %}

{% block unpack %}
echo $PWD
echo > $PWD/qqq
mkdir bld && cd bld

for s in ${src}/*; do
    case $s in
        *touch)
        ;;
        *.diff)
        ;;
        *.patch)
        ;;
        *zip)
            $unzip $s
        ;;
        *)
            $untar $s
        ;;
    esac
done

cd *
{% endblock %}

{% block preconf %}
cur_dir=$(pwd)
mkdir ${tmp}/tools && cd ${tmp}/tools
{% block toolconf %}
{% endblock %}
cp $(which dash) sh
setup_compiler
cd ${cur_dir}
{% endblock %}
