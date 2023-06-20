# Java Hello World with GraalVM Enterprise in OCI Code Editor

This sample shows how you can get started quickly with GraalVM Enterprise Edition in Oracle Cloud Infrastructre (OCI) Code Editor. This sample uses a simple hello world Java application built with GraalVM Enterprise Native Image and JDK (Java Development Kit).

## What is GraalVM?

GraalVM is a high-performance JDK distribution that can accelerate any Java workload running on the HotSpot JVM.

GraalVM Native Image ahead-of-time compilation enables you to build lightweight Java applications that are smaller, faster, and use less memory and CPU. At build time, GraalVM Native Image analyzes a Java application and its dependencies to identify just what classes, methods, and fields are absolutely necessary and generates optimized machine code for just those elements.

GraalVM Enterprise Edition is available for use on Oracle Cloud Infrastructure (OCI) at no additional cost.

## What is Code Editor?

The Code Editor enables you to edit and deploy code for various OCI services directly from the OCI Console. You can now update service workflows and scripts without having to switch between the Console and your local development environments. This makes it easy to rapidly prototype cloud solutions, explore new services, and accomplish quick coding tasks. 

Code Editor's direct integration with Cloud Shell allows you access to the GraalVM Enterprise Native Image and JDK 17 (Java Development Kit) pre-installed in Cloud Shell.

## Quick Launch

If you have your OCI tenancy and want to try out this sample, click on 'Open in Code Editor' button below.

[<img src="https://raw.githubusercontent.com/oracle-devrel/oci-code-editor-samples/main/images/open-in-code-editor.png" />](https://cloud.oracle.com/?region=home&cs_repo_url=https://github.com/oracle-devrel/oci-code-editor-samples.git&cs_open_ce=true&cs_readme_path=README.md&cs_initscript_path=./java-samples/graalvmee-java-hello-world/run-on-cloud-shell.sh)

This button automates upto Step 3 on your OCI Cloud Shell and opens the code in OCI Code Editor to continue with Step 4 manually.

If you like to do it fully manually yourself, start from Step 1 below.

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

    ```shell
    git init graalvmee-java-hello-world
    
    cd graalvmee-java-hello-world
    
    git remote add origin https://github.com/oracle-devrel/oci-code-editor-samples.git
    
    git config core.sparsecheckout true
    
    echo "java-samples/graalvmee-java-hello-world/*">>.git/info/sparse-checkout
    
    git pull --depth=1 origin main
    
    cd java-samples/graalvmee-java-hello-world/
    
    ```

    You can now view/change the sample code in code editor.

    ![](./images/oci-ce-java-code.png)

2. Build a JAR for the sample app.

    ```shell
    mvn clean package
    ```

3. Run the JAR using:

    ```shell
    java -jar target/my-app-1.0-SNAPSHOT.jar
    ```

    The output should be similar to:
    ```
    Hello World!
    ```

## Step 4: Using GraalVM Native Image

1. **Option 1: Quick Build enabled** Let's use GraalVM Native Image to produce a native executable with the `Quick Build` option.

    4.1) To enable `Quick Build`, open [pom.xml](pom.xml) in the Code Editor and uncomment the line shown:

    ```
    <buildArg>-Ob</buildArg>
    ```

    4.2) Run the Native Image build to generate a native executable:

    ```shell
    mvn clean -Pnative -DskipTests package
    ```

    4.3) Run the native executable using:

    ```shell
    ./target/my-app
    ```
    
2. **Option 2: Quick Build disabled** Let's use GraalVM Native Image to produce a native executable without the `Quick Build` option.
    
    5.1) To disable `Quick Build`, open [pom.xml](pom.xml) in the Code Editor and comment the line shown:  

    ```
    <!-- <buildArg>-Ob</buildArg> -->
    ```

    5.2) Run the Native Image build to generate a native executable:

    ```shell
    mvn clean -Pnative -DskipTests package
    ```

    5.3) Run the native executable using:

    ```shell
    ./target/my-app
    ```

    The output should be similar to:
    ```
    Hello World!
    ```

## References
* [GraalVM Enterprise Overview](https://www.oracle.com/in/java/graalvm/)
* [Graal VM Enterprise Documentation](https://docs.oracle.com/en/graalvm/enterprise/22/index.html)

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
