# Micronaut Hello World REST App with GraalVM Enterprise in OCI Code Editor

This sample shows how you can get started quickly with GraalVM Enterprise Edition in Oracle Cloud Infrastructre (OCI) Code Editor. This sample uses a simple hello world REST application built with the Micronaut framework and GraalVM Enterprise Native Image and JDK (Java Development Kit).

## What is GraalVM?

GraalVM is a high-performance JDK distribution that can accelerate any Java workload running on the HotSpot JVM.

GraalVM Native Image ahead-of-time compilation enables you to build lightweight Java applications that are smaller, faster, and use less memory and CPU. At build time, GraalVM Native Image analyzes a Java application and its dependencies to identify just what classes, methods, and fields are absolutely necessary and generates optimized machine code for just those elements.

GraalVM Enterprise Edition is available for use on Oracle Cloud Infrastructure (OCI) at no additional cost.

## What is Micronaut?

Micronaut is a modern, JVM-based framework to build modular, easily testable microservice and serverless applications. By avoiding runtime reflection in favor of annotation processing, Micronaut improves the Java-based development experience by detecting errors at compile time instead of runtime, and improves Java-based application start time and memory footprint. Micronaut includes a persistence framework called Micronaut Data that precomputes your SQL queries at compilation time making it a great fit for working with databases like MySQL, Oracle Autonomous Database, etc.

Micronaut uses GraalVM Native Image to build lightweight Java applications that use less memory and CPUs, are smaller and faster because of an advanced ahead-of-time compilation technology.

## What is Code Editor?

The Code Editor enables you to edit and deploy code for various OCI services directly from the OCI Console. You can now update service workflows and scripts without having to switch between the Console and your local development environments. This makes it easy to rapidly prototype cloud solutions, explore new services, and accomplish quick coding tasks. 

Code Editor's direct integration with Cloud Shell allows you access to the GraalVM Enterprise Native Image and JDK 17 (Java Development Kit) pre-installed in Cloud Shell.

## Step 1: Open Terminal in Code Editor

1. [Login to OCI Console and launch Code Editor](https://cloud.oracle.com/?bdcstate=maximized&codeeditor=true).

2. Open a `New Terminal` in Code Editor. Use this Terminal window to run the commands shown in this sample.

    ![](./images/oci-ce-terminal.png)
    

## Step 2: Select GraalVM as the current JDK 

1. List the installed JDKs:

    ```shell
    csruntimectl java list
    ```

    The output should be similar to:

    ```shell
      graalvmeejdk-17                                               /usr/lib64/graalvm/graalvm22-ee-java17
    * oraclejdk-1.8                                                           /usr/java/jdk1.8.0_351-amd64
      oraclejdk-11                                                                   /usr/java/jdk-11.0.17
    ```

2. Select GraalVM as the current JDK:

    ```shell
    csruntimectl java set graalvmeejdk-17
    ```

    The output should be similar to:

    ```shell
    The current managed java version is set to graalvmeejdk-17.
    ```


## Step 3: [OPTIONAL] Confirm Software Version and Environment Variables

This step is optional - [Check software version and environment variables](./README-check-version-env-vars.md)

## Step 4: Setup Project and Run

1. Clone this GIT repository.

    ```
    git init graalvmee-java-micronaut-hello-rest
    
    cd graalvmee-java-micronaut-hello-rest
    
    git remote add origin https://github.com/oracle-devrel/oci-code-editor-samples.git
    
    git config core.sparsecheckout true
    
    echo "java-samples/graalvmee-java-micronaut-hello-rest/*">>.git/info/sparse-checkout
    
    git pull --depth=1 origin main
    
    cd java-samples/graalvmee-java-micronaut-hello-rest/
    
    ```

    You can now view/change the sample code in code editor.

    ![](./images/oci-ce-gvme-micronaut-code.png)

2. Build the app JAR

    ```shell
    mvn package
    ```

3. Run the app JAR in the background

    ```shell
    java -jar target/MnHelloRest-0.1.jar &
    ```

    ![](./images/oci-ce-micronaut-service.png)

4. Test the app JAR

    4.1) Should output "Hello World"

    ```shell
    curl http://localhost:8080/
    ```

    4.2) Should output "Hello Micronaut"

    ```shell
    curl http://localhost:8080/Micronaut
    ```

    ![](./images/oci-ce-micronaut-response.png)

5. Bring the running app JAR in the foreground

    ```shell
    fg
    ```

6. Once the app is running in the foreground, press CTRL+C to stop it.

7. Build the app native executable

    ```shell
    mvn package -Dpackaging=native-image
    
    ```

8. Run the app native executable in the background

    ```shell
    ./target/MnHelloRest &
    ```

9. Test the app native executable

    9.1) Should output "Hello World"

    ```shell
    curl http://localhost:8080/
    ```

    9.2) Should output "Hello Micronaut-Graal-Native"

    ```shell
    curl http://localhost:8080/Micronaut-Graal-Native
    ```

10. Bring the running app JAR in the foreground

    ```shell
    fg
    ```

11. Once the app is running in the foreground, press CTRL+C to stop it.

## References
* [GraalVM Enterprise Overview](https://www.oracle.com/in/java/graalvm/)
* [Graal VM Enterprise Documentation](https://docs.oracle.com/en/graalvm/enterprise/22/index.html)
* [Micronaut - Microservices and Serverless Application Framework](https://micronaut.io/)

## Contributors
* Author: Sachin Pikle
* Collaborators: Ashok Raja CM
* Last updated: November 2022

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2022 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.

ORACLE AND ITS AFFILIATES DO NOT PROVIDE ANY WARRANTY WHATSOEVER, EXPRESS OR IMPLIED, FOR ANY SOFTWARE, MATERIAL OR CONTENT OF ANY KIND CONTAINED OR PRODUCED WITHIN THIS REPOSITORY, AND IN PARTICULAR SPECIFICALLY DISCLAIM ANY AND ALL IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.  FURTHERMORE, ORACLE AND ITS AFFILIATES DO NOT REPRESENT THAT ANY CUSTOMARY SECURITY REVIEW HAS BEEN PERFORMED WITH RESPECT TO ANY SOFTWARE, MATERIAL OR CONTENT CONTAINED OR PRODUCED WITHIN THIS REPOSITORY. IN ADDITION, AND WITHOUT LIMITING THE FOREGOING, THIRD PARTIES MAY HAVE POSTED SOFTWARE, MATERIAL OR CONTENT TO THIS REPOSITORY WITHOUT ANY REVIEW. USE AT YOUR OWN RISK. 
