#
# this will build the docker contianer image
# the container will be pushed to ejbest docker hub as public
cd apline 
docker build . -t ejbest/alpine 
docker push ejbest/alpine 
cd ..

