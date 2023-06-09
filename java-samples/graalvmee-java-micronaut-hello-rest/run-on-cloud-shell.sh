cd ~/${OCI_CCL_DESTINATION_DIR}/java-samples/graalvmee-java-micronaut-hello-rest
mvn clean package
java -jar target/MnHelloRest-0.1.jar &

echo "App is running in background"
echo "Making curl to invoke endpoints"
curl http://localhost:8080/Micronaut

echo "Successfully completed"
echo "Note: Still the service is running in background. Please run 'fg' and press Ctrl+C to kill the process"
echo "Thanks for trying out this sample"
