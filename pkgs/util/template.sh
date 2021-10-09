{% extends 'base.sh' %}

{% block unpack %}
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
cur_dir=${PWD}
mkdir ${tmp}/tools && cd ${tmp}/tools
{% block toolconf %}
{% endblock %}
ln -s $(which dash) sh
setup_compiler
cd ${cur_dir}
{% endblock %}
