mkdir src; cd src

for s in ${src}/*; do
    case ${s} in
        *touch)
        ;;
        *.diff)
        ;;
        *.patch)
        ;;
        *)
            extract{% block skip_dirs %}1{% endblock %} ${s}
        ;;
    esac
done
