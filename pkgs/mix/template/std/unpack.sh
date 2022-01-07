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
            extract1 ${s}
        ;;
    esac
done
