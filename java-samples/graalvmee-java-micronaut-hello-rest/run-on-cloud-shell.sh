cd ~/${OCI_CCL_DESTINATION_DIR}/java-samples/graalvmee-java-micronaut-hello-rest
mvn clean package
nohup java -jar target/MnHelloRest-0.1.jar &

echo "Waiting 30 seconds for app to start"
sleep 30

echo "App is running in background"
echo "Making curl to invoke endpoints"
curl http://localhost:8080/Micronaut

echo ""
echo "Successfully completed"

sleep 2
pid=`ps -ef | grep MnHello | grep java | cut -f3 -d' '`
kill -9 $pid

echo "Thanks for trying out this sample"
