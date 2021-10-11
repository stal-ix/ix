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
            ${unzip} ${s}
        ;;
        *)
            ${untar} ${s}
        ;;
    esac
done

cd *
{% endblock %}

{% block preconf %}
mkdir ${tmp}/tools && cd ${tmp}/tools

cat << EOF > strip
#!$(which dash)
EOF

chmod +x strip

cat << EOF > arch
#!$(which dash)
echo '{{mix.platform.target.arch}}'
EOF

chmod +x arch

ln -s $(which dash) sh

setup_compiler

(
    set -eu

    {% block toolconf %}
    {% endblock %}
)
{% endblock %}

{% block prepare_env %}
cat << EOF > ${out}/env
{% block env %}
{% endblock %}
EOF

(
    set -eu

    {% block autoenv %}
    {% endblock %}
)>> ${out}/env
{% endblock %}
