## [OPTIONAL] Confirm software version and environment variables

1. Confirm GraalVM is the current JDK:

    ```shell
    csruntimectl java list
    ```

    The output should be similar to (versions may vary):

    ```shell
    * graalvmeejdk-17                                               /usr/lib64/graalvm/graalvm22-ee-java17
      oraclejdk-1.8                                                           /usr/java/jdk1.8.0_351-amd64
      oraclejdk-11                                                                   /usr/java/jdk-11.0.17
    ```

2. Confirm the environment variable `JAVA_HOME` is set correctly:

    ```shell
    echo $JAVA_HOME
    ```

    The output should be similar to:

    ```shell
    /usr/lib64/graalvm/graalvm22-ee-java17
    ```

3. Confirm the environment variable `PATH` is set correctly:

    ```shell
    echo $PATH
    ```

    The output should be similar to:

    ```shell
    /usr/lib64/graalvm/graalvm22-ee-java17/bin/:...
    ```

4. Confirm the `java` version:

    ```shell
    java -version
    ```

    The output should be similar to (versions may vary):

    ```shell
    java version "17.0.9" 2023-10-17 LTS
    Java(TM) SE Runtime Environment GraalVM EE 22.3.4 (build 17.0.9+11-LTS-jvmci-22.3-b28)
    Java HotSpot(TM) 64-Bit Server VM GraalVM EE 22.3.4 (build 17.0.9+11-LTS-jvmci-22.3-b28, mixed mode, sharing)
    ```

5. Confirm the `native-image` version:

    ```shell
    native-image --version
    ```

    The output should be similar to (versions may vary):

    ```shell
    GraalVM 22.3.4 Java 17 EE (Java Version 17.0.9+11-LTS-jvmci-22.3-b28)
    ```

6. Confirm the `Java` used for Maven builds:

    ```shell
    ./mvnw --version
    ```

    The output should be similar to (versions may vary):

    ```shell
    ...
    Java version: 17.0.9, vendor: Oracle Corporation, runtime: /usr/lib64/graalvm/graalvm22-ee-java17
    ...
    ```

Continue to **[Step 4: Build and run as a JAR](./README.md#step-4-build-and-run-as-a-jar)**
