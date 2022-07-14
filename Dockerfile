FROM amazoncorretto:17
ARG GIHUB_USERNAME
ARG GITHUB_TOKEN
ARG CIRCLE_TAG

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

RUN cd native-libs && jar cf xlearn-native-libs.jar .

RUN mvn deploy:deploy-file \
    -Dfile=native-libs/xlearn-native-libs.jar \
    -DrepositoryId=github \
    -DgroupId=com.inventale.coregistration \
    -DartifactId=xlearn-native-libs \
    -Dversion=1.0.23 \
    -Durl=https://maven.pkg.github.com/tventures/xlearn/ \
    -Dregistry=https://maven.pkg.github.com/tventures \
    -Dmaven.source.useDefaultManifestFile=true \
    -s settings.xml \
    -e
