FROM mhart/alpine-node
MAINTAINER Patrick Walker <bpatrick.walker@gmail.com>

# Bail out early if NODE_VERSION is not provided
RUN npm install -g newman

# Set workdir to /etc/newman
# When running the image, mount the directory containing your collection to this location
#
# docker run -v <path to collections directory>:/etc/newman ...
#
# In case you mount your collections directory to a different location, you will need to give absolute paths to any
# collection, environment files you want to pass to newman, and if you want newman reports to be saved to your disk.
# Or you can change the workdir by using the -w or --workdir flag
WORKDIR /etc/newman

