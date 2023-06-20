cd ~/${OCI_CCL_DESTINATION_DIR}/java-samples/graalvmee-java-hello-world
mvn clean package
java -jar target/my-app-1.0-SNAPSHOT.jar

echo "Thanks for trying out this sample"