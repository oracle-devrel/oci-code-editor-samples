## Step 3: [OPTIONAL] Confirm Software Version and Environment Variables

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

4. Confirm the environment variable `PATH` is set correctly:

    ```shell
    echo $PATH
    ```

    The output should be similar to:

    ```shell
    /usr/lib64/graalvm/graalvm22-ee-java17/bin/:...
    ```

5. Confirm the `java` version:

    ```shell
    java -version
    ```

    The output should be similar to (versions may vary):

    ```shell
    java version "17.0.5" 2022-10-18 LTS
    Java(TM) SE Runtime Environment GraalVM EE 22.3.0 (build 17.0.5+9-LTS-jvmci-22.3-b07)
    Java HotSpot(TM) 64-Bit Server VM GraalVM EE 22.3.0 (build 17.0.5+9-LTS-jvmci-22.3-b07, mixed mode, sharing)
    ```

6. Confirm the `native-image` version:

    ```shell
    native-image --version
    ```

    The output should be similar to (versions may vary):

    ```shell
    GraalVM 22.3.0 Java 17 EE (Java Version 17.0.5+9-LTS-jvmci-22.3-b07)
    ```

7. Confirm the `maven` version and `Java` used:

    ```shell
    mvn --version
    ```

    The output should be similar to (versions may vary):

    ```shell
    Apache Maven 3.6.1 (Red Hat 3.6.1-6.3)
    Maven home: /opt/rh/rh-maven36/root/usr/share/maven
    Java version: 17.0.5, vendor: Oracle Corporation, runtime: /usr/lib64/graalvm/graalvm22-ee-java17
    Default locale: en_US, platform encoding: UTF-8
    OS name: "linux", version: "4.14.35-2047.516.2.2.el7uek.x86_64", arch: "amd64", family: "unix"
    ```

Continue to **[Step 4: Setup Project and Run](./README.md#step-4-setup-project-and-run)**
