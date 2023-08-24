
install_list="${1:-install_pkg.lst}"

while read pkg; do
    echo "Fake installing: ${pkg}"
done < $install_list