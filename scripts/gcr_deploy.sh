# GCP Variables
PROJECT_ID="payloadcms-test"
IMAGE_NAME=payloadcms-blog

# DOCKER Variables
IMAGE_VERSION=latest
IMAGE_URL=gcr.io/$PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION

# Deploy the docker image
docker build -t $IMAGE_URL .
# docker run --name my-blog -p 3000:3000 --network mybridge -e MONGODB_URI=mongodb://mongo:27017/blog-wd-payload -e PAYLOAD_SECRET=6273273a63c4245674af732b $IMAGE_URL
# docker push $IMAGE_URL

# Run the docker image
# gcloud app deploy --image-url=$IMAGE_URL --project=$PROJECT_ID
