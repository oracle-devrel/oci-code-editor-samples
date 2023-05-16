echo "Welcome to OCI Code Editor Samples"

while true; do
    read -p "Do you wish to proceed? " yn
    case $yn in
        [Yy]* ) echo "Yes, Done"; break;;
        [Nn]* ) echo "Skipped"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done