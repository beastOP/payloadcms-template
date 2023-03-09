# The payloadcms-template
This template is setup with gcs and smtp to handle media storage and emails. This project is configured to be deployed to gcp app engine.

## Local development requirement
- Docker
- Google cloud SDK

## How to start the dev server
First you'll need to build the docker image which depends on your gcp service account json key, storage bucket name, and project id. 
You can configure the SMTP env directly in the Docker file if you want.
I you are using a mongodb docker image you'll need to create a network bridge and run your mongo image inside it (e.g. `docker start mongodb --network mybridge`).
Then you can run the docker image with `docker run --name my-blog -p 3000:3000 --network mybridge -e MONGODB_URI=mongodb://mongo:27017/my-blog -e PAYLOAD_SECRET=<random_encoded_string> -e SMTP_HOST=<smtp_host> -e SMTP_USER=<smtp_user> SMTP_PASS=<smtp_password> <image_name>` or you can add all the env inside a `.env.local` file and run `docker run --name my-blog --env-file .env.local -p 3000:3000 <image_name>`.

### Environment variables for application
- `GCS_BUCKET`
- `GCS_PROJECT_ID`
- `GCS_PROJECT_ID`
- `PAYLOAD_SECRET`
- `MONGODB_URI`
- `SMTP_HOST`
- `SMTP_USER`
- `SMTP_PASS`

You'll need to enable the container register api in GCP for this project and create a service account key json and add its contents to github secrets variable `SERVICE_ACCOUNT_KEY`. The first build might take around 5 mins but the subsequent build are fast.