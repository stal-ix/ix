mkdir unp && cd unp

for s in ${src}/*; do
    case ${s} in
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

{% block unpack_chdir %}
cd .. && mv unp/* bld && cd bld
{% endblock %}
