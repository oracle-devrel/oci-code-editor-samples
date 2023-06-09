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

[<img src="../../images/open-in-code-editor.png" />](https://cloud.oracle.com/?region=home&cs_repo_url=https://github.com/oracle-devrel/oci-code-editor-samples.git&cs_open_ce=true&cs_readme_path=README.md&cs_branch=pre-prod&cs_initscript_path=./java-samples/graalvmee-java-hello-world/run-on-cloud-shell.sh)

This button automates upto Step 3. run Step 4 manually.

If you like to do it fully manually, start from Step 1 below.

## Step 1: Open Terminal in Code Editor

1. [Login to OCI Console and launch Code Editor](https://cloud.oracle.com/?bdcstate=maximized&codeeditor=true).

2. Open a `New Terminal` in Code Editor. Use this Terminal window to run the commands shown in this sample.
![](./images/oci-ce-terminal.png)


## Step 2: [OPTIONAL] Confirm Software Version and Environment Variables

1. List the installed JDKs:

    ```shell
    csruntimectl java list
    ```

    The output should be similar to:

    ```shell
      graalvmeejdk-17.0.4                                    /usr/lib64/graalvm/graalvm22-ee-java17
    * openjdk-11.0.15                   /usr/lib/jvm/java-11-openjdk-11.0.15.0.9-2.0.1.el7_9.x86_64
      openjdk-1.8.0.332                /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-1.el7_9.x86_64
    ```

2. Select GraalVM as the current JDK:

    ```shell
    csruntimectl java set graalvmeejdk-17.0.4
    ```

    The output should be similar to:

    ```shell
    The current managed java version is set to graalvmeejdk-17.0.4.
    ```

3. Confirm the environment variable `JAVA_HOME` is set correctly:

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
    /usr/lib64/graalvm/graalvm22-ee-java17/bin/:/ggs_client/usr/bin: ...
    ```

5. Confirm the `java` version:

    ```shell
    java -version
    ```

    The output should be similar to:

    ```shell
    java version "17.0.4" 2022-07-19 LTS   
    Java(TM) SE Runtime Environment GraalVM EE 22.2.0 (build 17.0.4+11-LTS-jvmci-22.2-b05)   
    Java HotSpot(TM) 64-Bit Server VM GraalVM EE 22.2.0 (build 17.0.4+11-LTS-jvmci-22.2-b05, mixed mode, sharing)
    ```

6. Confirm the `native-image` version:

    ```shell
    native-image --version
    ```

    The output should be similar to:

    ```shell
    GraalVM 22.2.0 Java 17 EE (Java Version 17.0.4+11-LTS-jvmci-22.2-b05)
    ```

7. Confirm the `maven` version and `Java` used:

    ```shell
    mvn --version
    ```

    The output should be similar to:

    ```shell
    Apache Maven 3.6.1 (Red Hat 3.6.1-6.3)
    Maven home: /opt/rh/rh-maven36/root/usr/share/maven
    Java version: 17.0.4, vendor: Oracle Corporation, runtime: /usr/lib64/graalvm/graalvm22-ee-java17   
    Default locale: en_US, platform encoding: UTF-8
    OS name: "linux", version: "4.14.35-2047.513.2.2.el7uek.x86_64", arch: "amd64", family: "unix"
    ```

## Step 3: Setup Project and Run

1. Clone this GIT repository.

    ```shell
    git init graalvmee-java-hello-world
    cd graalvmee-java-hello-world
    git remote add origin https://github.com/oracle-devrel/oci-code-editor-samples.git
    git config core. sparsecheckout true
    echo "java-samples/graalvmee-java-hello-world/*">>.git/info/sparse-checkout
    git pull --depth=1 origin main
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

1. **Option 1: Quick Build enabled**

    To enable `Quick Build`, open [pom.xml](pom.xml) in the Code Editor and uncomment the line shown:

    ```
    <buildArg>-Ob</buildArg>
    ```

    Run the Native Image build to generate a native executable:

    ```shell
    export USE_NATIVE_IMAGE_JAVA_PLATFORM_MODULE_SYSTEM=false

    mvn clean -Pnative -DskipTests package
    ```

    With **Quick Build enabled** in the pom.xml, the output should be similar to:

    ```
    ...
    You enabled -Ob for this image build. This will configure some optimizations to reduce image build time.
    ...
    ========================================================================================================================
    GraalVM Native Image: Generating 'my-app' (executable)...
    ========================================================================================================================
    [1/7] Initializing...                                                                                   (11.8s @ 0.20GB)
    Version info: 'GraalVM 22.2.0 Java 17 EE'
    Java version info: '17.0.4+11-LTS-jvmci-22.2-b05'
    C compiler: gcc (redhat, x86_64, 11.2.1)
    Garbage collector: Serial GC
    [2/7] Performing analysis...  [*****]                                                                   (21.3s @ 0.70GB)
    1,826 (62.43%) of  2,925 classes reachable
    1,665 (46.89%) of  3,551 fields reachable
    7,652 (37.13%) of 20,607 methods reachable
        21 classes,     0 fields, and   258 methods registered for reflection
        49 classes,    32 fields, and    48 methods registered for JNI access
        4 native libraries: dl, pthread, rt, z
    [3/7] Building universe...                                                                               (3.0s @ 0.95GB)
    [4/7] Parsing methods...      [**]                                                                       (2.9s @ 0.40GB)
    [5/7] Inlining methods...     [***]                                                                      (2.0s @ 0.65GB)
    [6/7] Compiling methods...    [***]                                                                     (10.8s @ 0.80GB)
    [7/7] Creating image...                                                                                  (2.2s @ 0.98GB)
    1.78MB (42.88%) for code area:     4,439 compilation units
    2.23MB (53.52%) for image heap:   36,755 objects and 1 resources
    153.46KB ( 3.60%) for other data
    4.16MB in total
    ------------------------------------------------------------------------------------------------------------------------
    Top 10 packages in code area:                               Top 10 object types in image heap:
    208.78KB com.oracle.svm.jni                                 374.00KB byte[] for code metadata
    184.71KB java.lang                                          317.32KB byte[] for java.lang.String
    169.35KB com.oracle.svm.core.code                           268.43KB java.lang.Class
    143.98KB java.util                                          263.72KB java.lang.String
    104.54KB com.oracle.svm.core.genscavenge                    213.43KB byte[] for general heap data
    80.73KB java.util.concurrent                               111.71KB char[]
    64.87KB java.lang.invoke                                    71.33KB com.oracle.svm.core.hub.DynamicHubCompanion
    52.95KB java.math                                           68.66KB byte[] for reflection metadata
    44.58KB com.oracle.svm.jni.functions                        50.56KB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
    40.69KB java.io                                             45.11KB java.util.HashMap$Node[]
    700.71KB for 99 more packages                               347.76KB for 478 more object types
    ------------------------------------------------------------------------------------------------------------------------
                            1.4s (2.4% of total time) in 14 GCs | Peak RSS: 1.62GB | CPU load: 1.74
    ------------------------------------------------------------------------------------------------------------------------
    Produced artifacts:
    /home/user_graal/graalvmee-java-hello-world/target/my-app (executable)
    /home/user_graal/graalvmee-java-hello-world/target/my-app.build_artifacts.txt (txt)
    ========================================================================================================================
    Finished generating 'my-app' in 56.0s.
    ...
    ```

2.  **Option 2: Quick Build disabled** 
    
    To disable `Quick Build`, open [pom.xml](pom.xml) in the Code Editor and comment the line shown:  

    ```
    <!-- <buildArg>-Ob</buildArg> -->
    ```

    Run the Native Image build to generate a native executable:

    ```shell
    export USE_NATIVE_IMAGE_JAVA_PLATFORM_MODULE_SYSTEM=false

    mvn clean -Pnative -DskipTests package
    ```

    With **Quick Build disabled** in the pom.xml, the output should be similar to:

    ```
    ...
    ========================================================================================================================
    GraalVM Native Image: Generating 'my-app' (executable)...
    ========================================================================================================================
    [1/7] Initializing...                                                                                   (10.9s @ 0.22GB)
    Version info: 'GraalVM 22.2.0 Java 17 EE'
    Java version info: '17.0.4+11-LTS-jvmci-22.2-b05'
    C compiler: gcc (redhat, x86_64, 11.2.1)
    Garbage collector: Serial GC
    [2/7] Performing analysis...  [*****]                                                                   (19.0s @ 0.75GB)
    1,865 (61.63%) of  3,026 classes reachable
    1,701 (47.24%) of  3,601 fields reachable
    7,647 (36.19%) of 21,131 methods reachable
        21 classes,     0 fields, and   258 methods registered for reflection
        49 classes,    32 fields, and    48 methods registered for JNI access
        4 native libraries: dl, pthread, rt, z
    [3/7] Building universe...                                                                               (2.7s @ 1.01GB)
    [4/7] Parsing methods...      [**]                                                                       (2.7s @ 0.47GB)
    [5/7] Inlining methods...     [***]                                                                      (1.7s @ 0.72GB)
    [6/7] Compiling methods...    [******]                                                                  (42.4s @ 2.24GB)
    [7/7] Creating image...                                                                                  (2.2s @ 2.47GB)
    2.50MB (49.19%) for code area:     3,718 compilation units
    2.43MB (47.85%) for image heap:   37,070 objects and 1 resources
    154.52KB ( 2.97%) for other data
    5.09MB in total
    ------------------------------------------------------------------------------------------------------------------------
    Top 10 packages in code area:                               Top 10 object types in image heap:
    299.96KB java.lang                                          508.60KB byte[] for code metadata
    193.82KB com.oracle.svm.jni                                 319.97KB byte[] for java.lang.String
    190.72KB java.util                                          288.09KB java.lang.Class
    157.50KB com.oracle.svm.core.code                           265.69KB java.lang.String
    118.87KB com.oracle.svm.core.genscavenge                    215.05KB byte[] for general heap data
    111.79KB java.util.concurrent                               111.71KB char[]
    75.69KB java.lang.invoke                                    72.85KB com.oracle.svm.core.hub.DynamicHubCompanion
    73.33KB java.math                                           69.74KB byte[] for reflection metadata
    71.31KB jdk.proxy4                                          51.44KB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
    68.17KB com.oracle.svm.core                                 45.11KB java.util.HashMap$Node[]
    1.15MB for 96 more packages                               348.07KB for 474 more object types
    ------------------------------------------------------------------------------------------------------------------------
                            1.4s (1.7% of total time) in 17 GCs | Peak RSS: 2.96GB | CPU load: 1.78
    ------------------------------------------------------------------------------------------------------------------------
    Produced artifacts:
    /home/user_graal/graalvmee-java-hello-world/target/my-app (executable)
    /home/user_graal/graalvmee-java-hello-world/target/my-app.build_artifacts.txt (txt)
    ========================================================================================================================
    Finished generating 'my-app' in 1m 23s.
    ...
    ```

5. Run the native executable using:

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
* Last release: August 2022

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2022 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.

ORACLE AND ITS AFFILIATES DO NOT PROVIDE ANY WARRANTY WHATSOEVER, EXPRESS OR IMPLIED, FOR ANY SOFTWARE, MATERIAL OR CONTENT OF ANY KIND CONTAINED OR PRODUCED WITHIN THIS REPOSITORY, AND IN PARTICULAR SPECIFICALLY DISCLAIM ANY AND ALL IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.  FURTHERMORE, ORACLE AND ITS AFFILIATES DO NOT REPRESENT THAT ANY CUSTOMARY SECURITY REVIEW HAS BEEN PERFORMED WITH RESPECT TO ANY SOFTWARE, MATERIAL OR CONTENT CONTAINED OR PRODUCED WITHIN THIS REPOSITORY. IN ADDITION, AND WITHOUT LIMITING THE FOREGOING, THIRD PARTIES MAY HAVE POSTED SOFTWARE, MATERIAL OR CONTENT TO THIS REPOSITORY WITHOUT ANY REVIEW. USE AT YOUR OWN RISK. 