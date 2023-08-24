
install_list="${0:-install_pkg.lst}"

while read pkg; do
    echo "Fake installing: ${pkg}"
done < $install_list