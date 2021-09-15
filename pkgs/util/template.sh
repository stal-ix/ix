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
mkdir .tools && cd .tools
{% block toolconf %}
{% endblock %}
ln -s $(which dash) sh
setup_compiler
cd ..
{% endblock %}
