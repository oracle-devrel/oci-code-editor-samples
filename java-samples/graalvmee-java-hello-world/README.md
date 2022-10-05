# Java Hello World with GraalVM Enterprise in OCI Code Editor

This sample shows how you can get started quickly with GraalVM Enterprise Edition in Oracle Cloud Infrastructre (OCI) Code Editor. This sample uses a simple hello world Java application built with GraalVM Enterprise Native Image and JDK (Java Development Kit).

## What is GraalVM?

GraalVM is a high-performance JDK distribution that can accelerate any Java workload running on the HotSpot JVM.

GraalVM Native Image ahead-of-time compilation enables you to build lightweight Java applications that are smaller, faster, and use less memory and CPU. At build time, GraalVM Native Image analyzes a Java application and its dependencies to identify just what classes, methods, and fields are absolutely necessary and generates optimized machine code for just those elements.

GraalVM Enterprise Edition is available for use on Oracle Cloud Infrastructure (OCI) at no additional cost.

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
      graalvmeejdk-17.0.4.1                                         /usr/lib64/graalvm/graalvm22-ee-java17
    * openjdk-11.0.16.1                        /usr/lib/jvm/java-11-openjdk-11.0.16.1.1-1.0.1.el7_9.x86_64
      openjdk-1.8.0.345                       /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.345.b01-1.el7_9.x86_64
    ```

2. Select GraalVM as the current JDK:

    ```shell
    csruntimectl java set graalvmeejdk-17.0.4.1
    ```

    The output should be similar to:

    ```shell
    The current managed java version is set to graalvmeejdk-17.0.4.1.
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

4. Let's use GraalVM Native Image to produce a native executable.

    4.1) **Option 1: Quick Build enabled**

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
    [1/7] Initializing...                                                                                   (11.0s @ 0.21GB)
    Version info: 'GraalVM 22.2.0.1 Java 17 EE'
    Java version info: '17.0.4.1+1-LTS-jvmci-22.2-b08'
    C compiler: gcc (redhat, x86_64, 11.2.1)
    Garbage collector: Serial GC
    [2/7] Performing analysis...  [*****]                                                                   (19.3s @ 0.69GB)
    1,819 (62.34%) of  2,918 classes reachable
    1,662 (46.88%) of  3,545 fields reachable
    7,638 (37.13%) of 20,573 methods reachable
        17 classes,     0 fields, and   254 methods registered for reflection
        49 classes,    32 fields, and    48 methods registered for JNI access
        4 native libraries: dl, pthread, rt, z
    [3/7] Building universe...                                                                               (2.8s @ 0.93GB)
    [4/7] Parsing methods...      [**]                                                                       (3.0s @ 0.35GB)
    [5/7] Inlining methods...     [***]                                                                      (1.8s @ 0.60GB)
    [6/7] Compiling methods...    [***]                                                                     (10.8s @ 0.75GB)
    [7/7] Creating image...                                                                                  (2.0s @ 0.94GB)
    1.78MB (42.86%) for code area:     4,433 compilation units
    2.23MB (53.52%) for image heap:   36,676 objects and 1 resources
    154.52KB ( 3.63%) for other data
    4.16MB in total
    ------------------------------------------------------------------------------------------------------------------------
    Top 10 packages in code area:                               Top 10 object types in image heap:
    208.78KB com.oracle.svm.jni                                 373.74KB byte[] for code metadata
    184.72KB java.lang                                          316.52KB byte[] for java.lang.String
    168.31KB com.oracle.svm.core.code                           267.37KB java.lang.Class
    144.00KB java.util                                          263.25KB java.lang.String
    104.54KB com.oracle.svm.core.genscavenge                    213.14KB byte[] for general heap data
    80.73KB java.util.concurrent                               111.71KB char[]
    64.87KB java.lang.invoke                                    71.05KB com.oracle.svm.core.hub.DynamicHubCompanion
    52.95KB java.math                                           68.35KB byte[] for reflection metadata
    44.58KB com.oracle.svm.jni.functions                        50.34KB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
    40.69KB java.io                                             44.95KB java.util.HashMap$Node[]
    700.72KB for 99 more packages                               346.11KB for 478 more object types
    ------------------------------------------------------------------------------------------------------------------------
                            1.3s (2.4% of total time) in 14 GCs | Peak RSS: 1.62GB | CPU load: 1.74
    ------------------------------------------------------------------------------------------------------------------------
    Produced artifacts:
    /home/user_graal/graalvmee-java-hello-world/target/my-app (executable)
    /home/user_graal/graalvmee-java-hello-world/target/my-app.build_artifacts.txt (txt)
    ========================================================================================================================
    Finished generating 'my-app' in 52.8s.
    ...
    ```

    4.2) **Option 2: Quick Build disabled** 
    
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
    [1/7] Initializing...                                                                                   (10.8s @ 0.21GB)
    Version info: 'GraalVM 22.2.0.1 Java 17 EE'
    Java version info: '17.0.4.1+1-LTS-jvmci-22.2-b08'
    C compiler: gcc (redhat, x86_64, 11.2.1)
    Garbage collector: Serial GC
    [2/7] Performing analysis...  [*****]                                                                   (19.3s @ 0.74GB)
    1,858 (61.54%) of  3,019 classes reachable
    1,698 (47.23%) of  3,595 fields reachable
    7,633 (36.19%) of 21,094 methods reachable
        17 classes,     0 fields, and   254 methods registered for reflection
        49 classes,    32 fields, and    48 methods registered for JNI access
        4 native libraries: dl, pthread, rt, z
    [3/7] Building universe...                                                                               (2.8s @ 1.00GB)
    [4/7] Parsing methods...      [**]                                                                       (2.8s @ 0.44GB)
    [5/7] Inlining methods...     [***]                                                                      (1.7s @ 0.70GB)
    [6/7] Compiling methods...    [*******]                                                                 (45.5s @ 2.32GB)
    [7/7] Creating image...                                                                                  (2.2s @ 2.53GB)
    2.50MB (49.18%) for code area:     3,714 compilation units
    2.43MB (47.88%) for image heap:   36,993 objects and 1 resources
    152.73KB ( 2.93%) for other data
    5.08MB in total
    ------------------------------------------------------------------------------------------------------------------------
    Top 10 packages in code area:                               Top 10 object types in image heap:
    299.87KB java.lang                                          508.47KB byte[] for code metadata
    193.82KB com.oracle.svm.jni                                 319.17KB byte[] for java.lang.String
    190.45KB java.util                                          272.45KB java.lang.Class
    155.80KB com.oracle.svm.core.code                           265.22KB java.lang.String
    118.87KB com.oracle.svm.core.genscavenge                    214.75KB byte[] for general heap data
    111.77KB java.util.concurrent                               111.71KB char[]
    75.68KB java.lang.invoke                                    72.58KB com.oracle.svm.core.hub.DynamicHubCompanion
    73.33KB java.math                                           69.43KB byte[] for reflection metadata
    71.31KB jdk.proxy4                                          51.22KB c.o.svm.core.hub.DynamicHub$ReflectionMetadata
    68.17KB com.oracle.svm.core                                 44.95KB java.util.HashMap$Node[]
    1.15MB for 96 more packages                               349.00KB for 474 more object types
    ------------------------------------------------------------------------------------------------------------------------
                            1.4s (1.6% of total time) in 17 GCs | Peak RSS: 2.94GB | CPU load: 1.76
    ------------------------------------------------------------------------------------------------------------------------
    Produced artifacts:
    /home/user_graal/graalvmee-java-hello-world/target/my-app (executable)
    /home/user_graal/graalvmee-java-hello-world/target/my-app.build_artifacts.txt (txt)
    ========================================================================================================================
    Finished generating 'my-app' in 1m 27s.
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
* Last updated: October 2022

## Contributing
This project is open source.  Please submit your contributions by forking this repository and submitting a pull request!  Oracle appreciates any contributions that are made by the open source community.

## License
Copyright (c) 2022 Oracle and/or its affiliates.

Licensed under the Universal Permissive License (UPL), Version 1.0.

See [LICENSE](../LICENSE) for more details.

ORACLE AND ITS AFFILIATES DO NOT PROVIDE ANY WARRANTY WHATSOEVER, EXPRESS OR IMPLIED, FOR ANY SOFTWARE, MATERIAL OR CONTENT OF ANY KIND CONTAINED OR PRODUCED WITHIN THIS REPOSITORY, AND IN PARTICULAR SPECIFICALLY DISCLAIM ANY AND ALL IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A PARTICULAR PURPOSE.  FURTHERMORE, ORACLE AND ITS AFFILIATES DO NOT REPRESENT THAT ANY CUSTOMARY SECURITY REVIEW HAS BEEN PERFORMED WITH RESPECT TO ANY SOFTWARE, MATERIAL OR CONTENT CONTAINED OR PRODUCED WITHIN THIS REPOSITORY. IN ADDITION, AND WITHOUT LIMITING THE FOREGOING, THIRD PARTIES MAY HAVE POSTED SOFTWARE, MATERIAL OR CONTENT TO THIS REPOSITORY WITHOUT ANY REVIEW. USE AT YOUR OWN RISK. 
