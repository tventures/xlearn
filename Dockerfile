FROM amazoncorretto:17
ARG GITHUB_USERNAME
ARG GITHUB_TOKEN

RUN yum install -y gcc binutils clang make cmake maven

ADD . .

RUN mkdir build && \
    cd build && \ 
    cmake .. && \
    make

RUN mkdir native-libs && \
    cp build/src/base/libbase.so native-libs/ && \
    cp build/src/data/libdata.so native-libs/ && \
    cp build/src/score/libscore.so native-libs/ && \
    cp build/src/reader/libreader.so native-libs/ && \
    cp build/src/solver/libsolver.so native-libs/ && \
    cp build/src/loss/libloss.so native-libs/

RUN jar cf xlearn-native-libs.jar native-libs

RUN mvn deploy:deploy-file \
    -Dfile=xlearn-native-libs.jar \
    -DrepositoryId=github \
    -DgroupId=com.inventale.coregistration \
    -DartifactId=xlearn-native-libs \
    -Dversion=1.0.22 \
    -Durl=https://maven.pkg.github.com/tventures/xlearn/ \
    -Dregistry=https://maven.pkg.github.com/tventures \
    -Dgithub.username=$GIHUB_USERNAME \
    -Dgithub.token=$GITHUB_TOKEN \
    -Dmaven.source.useDefaultManifestFile=true \
    -s settings.xml